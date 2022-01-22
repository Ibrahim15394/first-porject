import 'package:first_project/layout/news_app/cubit/cubit.dart';
import 'package:first_project/layout/news_app/news_layout.dart';
import 'package:first_project/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:first_project/shared/cubit/cubit.dart';
import 'package:first_project/shared/cubit/states.dart';
import 'package:first_project/shared/network/local/cache_helper.dart';
import 'package:first_project/shared/network/remote/dio_helper.dart';
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
              theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme:  const AppBarTheme(
                  titleSpacing: 20.0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,

                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                ),
                textTheme:  const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),

                ),
              ),
              darkTheme: ThemeData(
                scaffoldBackgroundColor: HexColor('333739'),
                primarySwatch: Colors.deepOrange,
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backgroundColor:HexColor('333739'),
                  elevation: 0.0,
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: HexColor('333739'),
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              themeMode: AppCubit.get(context). isDark ? ThemeMode.dark : ThemeMode.light,
              home:const NewsLayout(),
            );
          },
        ),
      );

  }


}