import 'package:bloc/bloc.dart';
import 'package:first_project/modules/archived_tasks/archived_screen.dart';
import 'package:first_project/modules/done_tasks/done_screen.dart';
import 'package:first_project/modules/new_tasks/new_screen.dart';
import 'package:first_project/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  
  static AppCubit get (context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screen = [
    const NewTasksScreen(),
    const DoneTasksScreen(),
    const ArchivedTasksScreen(),
  ];
  List<String> titles = [
    'New tasks',
    'Done tasks',
    'Archived tasks',
  ];

  void changeIndex(int index)
  {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  late Database database;

  void createDatabase()
  {
     openDatabase(
      'Todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)'
        ).then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Table Created ${error.toString()}');
        });
      },
      onOpen: (database)
      {
        getDataFormDatabase(database);
        print('database opened');

      },
     ).then((value)
     {
       database = value;
       emit(AppCreateDatabaseState());
     });
  }

  insertDatabase({
    required String title,
    required String time,
    required String date,
  }) async
  {
    await database.transaction((txn) =>
        txn.rawInsert(
            'INSERT INTO tasks(title, date, time, status) VALUES("$title","$date","$time","new")'
        ).then((value) {
          print('$value inserted successfully');
          emit(AppInsertDatabaseState());

       getDataFormDatabase (database);
        }).catchError((error) {
          print('Error When Inserting New Record ${error.toString()}');
        }));
  }

  void getDataFormDatabase(database)
  {
    newTasks = [];
    doneTasks = [];
   archivedTasks = [];
    emit(AppGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value) {

      value.forEach((element)
      {
        if(element['status'] == 'new')
        {
          newTasks.add(element);
        }else if(element['status'] == 'done')
        {
          doneTasks.add(element);
        }else {
          archivedTasks.add(element);
        }

      });
      emit(AppGetDatabaseState());
    });
  }

  void updateData({
    required String status,
    required int id,
})async
  {
     database.rawUpdate(
        'UPDATE tasks SET status = ?  WHERE id = ?',
        [status, id ],
    ).then((value) 
     {
       getDataFormDatabase(database);
       emit(AppUpdateDatabaseState());
     });
  }

  void deleteData({
 required int id,
})async
  {
    database.rawDelete(
        'DELETE FROM tasks WHERE id = ?', [id]
    ).then((value) {
      getDataFormDatabase(database);
     emit(AppDeleteDatabaseState());
    });
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
  required bool isShow ,
  required IconData icon,
})
  {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }
}