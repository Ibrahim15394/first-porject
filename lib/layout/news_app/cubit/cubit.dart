import 'package:first_project/layout/news_app/cubit/states.dart';
import 'package:first_project/modules/business/business_screen.dart';
import 'package:first_project/modules/science/science_screen.dart';
import 'package:first_project/modules/setting_tasks/setting_screen.dart';
import 'package:first_project/modules/sports/sports_screen.dart';
import 'package:first_project/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;



  List<BottomNavigationBarItem> bottomItem =
      [
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.business,
          ),
          label: 'Business',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.sports,
          ),
          label: 'Sports',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.science,
          ),
          label: 'Science',
        ),
      ];
  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];
  void changeBottomNavBar(index)
  {
    currentIndex = index;
    if (index == 1)
    {
      getSports();
    }
    if (index == 2)
    {
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

   void getBusiness()
   {
     emit(NewsGetBusinessLoadingState());
     DioHelper.getData(

         url:'v2/top-headlines',
         query:{
           "country": "eg",
           "category": "business",
           "apiKey": "9137d536ee3a423ea37d261116cd8c8b"

         },).then((value)
     {
    //  print(value?.data.toString());
       business = value?.data['articles'];
       print(business[0]['title']);
       emit(NewsGetBusinessSuccessState());
     }).catchError((error){
       print(error.toString());
       emit(NewsGetBusinessErrorState(error.toString()));
     });
   }

  List<dynamic> sports= [];

  void getSports()
  {
    emit(NewsGetSportsLoadingState());
    if(sports.isEmpty)
      {
        DioHelper.getData(

          url:'v2/top-headlines',
          query:{
            "country": "eg",
            "category": "sports",
            "apiKey": "9137d536ee3a423ea37d261116cd8c8b"

          },).then((value)
        {
          //  print(value?.data.toString());
          sports = value?.data['articles'];
          print(sports[0]['title']);
          emit(NewsGetSportsSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(NewsGetSportsErrorState(error.toString()));
        });
      }else
        {
          emit(NewsGetSportsSuccessState());
        }

  }

  List<dynamic> science = [];

  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    if(science.isEmpty)
      {
        DioHelper.getData(

          url:'v2/top-headlines',
          query:{
            "country": "eg",
            "category": "science",
            "apiKey": "9137d536ee3a423ea37d261116cd8c8b"

          },).then((value)
        {
          //  print(value?.data.toString());
          science = value?.data['articles'];
          print(science[0]['title']);
          emit(NewsGetScienceSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(NewsGetScienceErrorState(error.toString()));
        });
      }else
        {
          emit(NewsGetScienceSuccessState());

        }

  }
 }
