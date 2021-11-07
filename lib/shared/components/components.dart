

import 'package:flutter/material.dart';

Widget defaultButton({
    double width = double.infinity,
    Color background = Colors.grey,
    bool isUpperCase= true,
    double radius = 0.0,
  required Function function,
  required String text,

}) =>   Container(
  width: width,
  height: 40.0,

  child: MaterialButton(

    onPressed: function(),
    child: Text(
      isUpperCase ? text.toUpperCase() : text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color:background,
  ),
);

