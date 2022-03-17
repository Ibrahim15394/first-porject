import 'package:first_project/layout/news_app/cubit/cubit.dart';
import 'package:first_project/layout/news_app/news_layout.dart';
import 'package:first_project/modules/bmii/bmi/BMI_Screen.dart';
import 'package:first_project/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:first_project/shared/cubit/cubit.dart';
import 'package:first_project/shared/cubit/states.dart';
import 'package:first_project/shared/network/local/cache_helper.dart';
import 'package:first_project/shared/network/remote/dio_helper.dart';
import 'package:first_project/shared/styles/themes.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'layout/todo_app/todo_layout.dart';

import 'package:first_project/modules/counter/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/bloc_observer.dart';

void main(){
  BlocOverrides.runZoned(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        DioHelper.init();
       await CacheHelper.init();
     bool? isDark = CacheHelper.getBoolean(key:'isDark');
        runApp( MyApp(isDark!));
      },
      blocObserver : MyBlocObserver(),
  );
}
class MyApp extends StatelessWidget {

 final bool isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers:
      [
        BlocProvider(create:(BuildContext context)=>
        NewsCubit()..getBusiness(),),
        BlocProvider( create: (BuildContext context) => AppCubit()..changeAppMode(
    fromShared: isDark,)),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
          listener:(context,state){} ,
          builder: (context,state)
          {
            return  MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: AppCubit.get(context). isDark ? ThemeMode.dark : ThemeMode.light,
              home: OnBoardingScreen(),
            );
          },
        ),
      );
  }
}