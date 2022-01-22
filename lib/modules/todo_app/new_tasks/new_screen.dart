import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_project/shared/components/components2.dart';
import 'package:first_project/shared/components/constants.dart';
import 'package:first_project/shared/cubit/cubit.dart';
import 'package:first_project/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTasksScreen extends StatelessWidget {
  const NewTasksScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context , state){},
        builder: (context , state)
        {
     var tasks = AppCubit.get(context).newTasks;
          return tasksBuilder(
            tasks: tasks,
          );
        },

    );



  }
}
