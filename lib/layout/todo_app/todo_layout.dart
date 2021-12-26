import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_project/modules/archived_tasks/archived_screen.dart';
import 'package:first_project/modules/done_tasks/done_screen.dart';
import 'package:first_project/modules/new_tasks/new_screen.dart';
import 'package:first_project/shared/components/components.dart';
import 'package:first_project/shared/components/components2.dart';
import 'package:first_project/shared/components/constants.dart';
import 'package:first_project/shared/cubit/cubit.dart';
import 'package:first_project/shared/cubit/states.dart';
import 'package:first_project/shared/cubit/states.dart';
import 'package:first_project/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget {



  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();


  // ConditionalBuilder(
  // condition: tasks.isNotEmpty ,
  // builder: (context) => screen[currentIndex],
  // fallback: (context) => const Center(child: CircularProgressIndicator(),),

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit().. createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state)
        {
          if(state is AppInsertDatabaseState)
            {
              Navigator.pop(context);
            }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get (context);

          return Scaffold(
               key: scaffoldKey,
                 appBar: AppBar(
                  title: Text(
                 cubit.titles[cubit.currentIndex],
          ),
          ),
           //   tasks.length == 0 ? const Center(child: CircularProgressIndicator(),) : cubit.screen[cubit.currentIndex],
           body: ConditionalBuilder(
            condition: state is! AppGetDatabaseLoadingState,
            builder: (context) => cubit.screen[cubit.currentIndex],
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
          ),
          ),
            floatingActionButton: FloatingActionButton(
            onPressed: () {
               // if (cubit. isBottomSheetShown)
            if ( true)
              {

              if (formKey.currentState != null &&  formKey.currentState!.validate())
              {
                cubit. insertDatabase(
                    title: titleController.text,
                    time: timeController.text,
                    date: dateController.text,
                );
              } else
                {

                scaffoldKey.currentState!.showBottomSheet(
                      (context) =>
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        color: Colors.white,
                        child: Form(
                          key: formKey,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children:
                              [
                                TextFormField(
                                  controller: titleController,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'title must not be empty';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    label: Text('Task Title '),
                                    prefixIcon: Icon(
                                      Icons.title,
                                    ),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  controller: timeController,
                                  keyboardType: TextInputType.datetime,
                                  onTap: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      timeController.text =
                                          value!.format(context).toString();
                                      print('value.format(context)');
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'time must not be empty';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    label: Text('Task Time'),
                                    prefixIcon: Icon(
                                      Icons.watch_later_outlined,
                                    ),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  controller: dateController,
                                  keyboardType: TextInputType.datetime,
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2021-12-30'),
                                    ).then((value) {
                                      dateController.text =
                                          DateFormat.yMMMd().format(value!);
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'date must not be empty';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    label: Text('Task Date'),
                                    prefixIcon: Icon(
                                      Icons.calendar_today,
                                    ),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                  elevation: 20.0,
                    ).closed.then((value) {
                      cubit.changeBottomSheetState(
                      isShow: false,
                      icon: Icons.edit,
                  );
                });
                cubit.changeBottomSheetState(
                  isShow: true,
                  icon: Icons.add,
                );
            }
             }
              },
            child: Icon(
            cubit.fabIcon,
          ),
          ),
          bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: cubit.currentIndex,
          onTap: (index) {
            cubit.changeIndex (index);
          },
          items: const [
          BottomNavigationBarItem(
          icon: Icon(
          Icons.menu,
          ),
          label: 'Tasks',
          ),
          BottomNavigationBarItem(
          icon: Icon(
          Icons.check_circle_outline,
          ),
          label: 'Done',
          ),
          BottomNavigationBarItem(
          icon: Icon(
          Icons.archive_outlined,
          ),
          label: 'Archived',
          ),
          ],
          ),
          );
        },

      ),
    );
  }

  // Future<String> getName() async {
  //   return 'tahar morsy';
  }




