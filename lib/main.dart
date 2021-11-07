import 'package:flutter/material.dart';
import 'package:untitled/modules/bmi/BMI_Screen.dart';
import 'package:untitled/modules/login/Login_Screen.dart';
import 'package:untitled/modules/bmi%20result/bmi_%20result_screen.dart';

import 'modules/counter/Counter_Screen.dart';
import 'modules/home/Home _screen.dart';
import 'modules/users/Users_Screen.dart';
import 'modules/messenger/messenger_screen.dart';
void main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginScreen
        (),




    );



  }


}