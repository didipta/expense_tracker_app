import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'material_color.dart';

ThemeData themeData = ThemeData(
  primarySwatch: customPurple ,
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  fontFamily: 'Roboto',
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFFF7F8F9),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.79)),
      borderSide: BorderSide(
        color: Color(0xFFE8ECF4),
        width: 1.1.w,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.79)),
      borderSide: BorderSide(
        color: Color(0xFFE8ECF4),
        width: 1.1.w,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.79)),
      borderSide: BorderSide(
        color: Color(0xFFE8ECF4),
        width: 1.1.w,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: customPurple.shade400,
      foregroundColor: Colors.white,
      minimumSize: Size(364.w, 50.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.r),
      ),
    ),
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headlineSmall: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    titleSmall: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  ),

);