import 'package:first_project/layout/learny_home/learny_layout.dart';
import 'package:first_project/layout/news_app/news_layout.dart';
import 'package:first_project/modules/task2/tasks_screen.dart';
import 'package:first_project/modules/test/task_screen.dart';
import 'package:first_project/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'layout/todo_app/todo_layout.dart';
import 'package:first_project/modules/bmi/bmi_screen.dart';
import 'package:first_project/modules/bmi_result/bmi_result_screen.dart';
import 'package:first_project/modules/counter/counter_screen.dart';
import 'package:first_project/modules/home/home_screen.dart';
import 'package:first_project/modules/login/login_screen.dart';
import 'package:first_project/modules/messenger/messenger_screen.dart';
import 'package:first_project/modules/users/users_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shared/bloc_observer.dart';

void main(){
  BlocOverrides.runZoned(
      (){
        DioHelper.init();
        runApp( const MyApp());
      },
      blocObserver : MyBlocObserver(),
  );


}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return      const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.deepOrange,
      //   scaffoldBackgroundColor: Colors.white,
      //   appBarTheme: const AppBarTheme(
      //     backwardsCompatibility: false,
      //     systemOverlayStyle: SystemUiOverlayStyle(
      //       statusBarColor: Colors.white,
      //     ),
      //     backgroundColor: Colors.white,
      //     elevation: 0.0,
      //     iconTheme: IconThemeData(
      //       color: Colors.black,
      //     ),
      //     titleTextStyle: TextStyle(
      //       color: Colors.black,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 25.0,
      //     ),
      //   ),
      //   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //     type: BottomNavigationBarType.fixed,
      //     selectedItemColor: Colors.deepOrange,
      //   ),
      //   textTheme: const TextTheme(
      //     bodyText1: TextStyle(
      //       fontSize: 18.0,
      //       fontWeight: FontWeight.w600,
      //       color: Colors.black,
      //     ),
      //
      //   ),
      // ),
      // darkTheme: ThemeData(
      //   scaffoldBackgroundColor: HexColor('333739'),
      //   primarySwatch: Colors.deepOrange,
      //   appBarTheme: AppBarTheme(
      //     backwardsCompatibility: false,
      //     systemOverlayStyle: SystemUiOverlayStyle(
      //       statusBarColor: HexColor('333739'),
      //       statusBarIconBrightness: Brightness.light,
      //     ),
      //     backgroundColor:HexColor('333739'),
      //     elevation: 0.0,
      //     iconTheme: const IconThemeData(
      //       color: Colors.white,
      //     ),
      //     titleTextStyle: const TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 25.0,
      //     ),
      //   ),
      //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //     type: BottomNavigationBarType.fixed,
      //     selectedItemColor: Colors.deepOrange,
      //     unselectedItemColor: Colors.grey,
      //     backgroundColor: HexColor('333739'),
      //   ),
      //   textTheme: const TextTheme(
      //     bodyText1: TextStyle(
      //       fontSize: 18.0,
      //       fontWeight: FontWeight.w600,
      //       color: Colors.white,
      //     ),
      //
      //   ),
      //
      // ),
      // themeMode: ThemeMode.dark,
      home:TasksScreen(),
    );
  }


}