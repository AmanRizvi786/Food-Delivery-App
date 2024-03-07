import 'dart:ui';
import 'package:flutter/material.dart';

class AppWidget{
  static TextStyle boldTextStyle(){
    return TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
    );
  }

  static TextStyle HeaderTextStyle(){
    return TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle LightTextStyle(){
    return TextStyle(
      color: Colors.black38,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    );
  }
  static TextStyle SemiboldTextStyle(){
    return TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    );
  }
  static TextStyle WhiteSemiboldTextStyle(){
    return TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle OrangeSemiboldTextStyle(){
    return TextStyle(
      color: Color(0xFFff5722),
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    );
  }
}