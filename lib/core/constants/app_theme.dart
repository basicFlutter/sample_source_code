import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:new_panel/core/constants/app_colors.dart";

import 'package:flutter/material.dart';

class Style {

  static ThemeData lightTheme = ThemeData(

    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.lightBlue,
    highlightColor: Colors.white,
    secondaryHeaderColor: AppColors.unselected,


    appBarTheme:  AppBarTheme(
        color: Colors.white54,
        titleTextStyle:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[700]),
        iconTheme: IconThemeData(
            color: Colors.grey[900]
        )
    ),


    iconTheme: IconThemeData(color: Colors.grey[700]),
    textTheme:  TextTheme(
      displayLarge: TextStyle(fontSize: 37.sp, fontWeight: FontWeight.w400,fontFamily: "QuicklyGone" , color: const Color(0xff3F61AC)),
      displayMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.grey[800] ),
      displaySmall:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.indigoAccent ),
      headlineLarge: const TextStyle(fontSize: 13, color: Colors.deepPurple),
      headlineMedium:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.deepPurple ),
      headlineSmall:const TextStyle(fontSize: 15 , color: AppColors.grayText ),
      bodyLarge:  TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w900, color: Colors.black),
      bodyMedium:const TextStyle(fontSize: 15, color: Colors.grey),
      bodySmall:const TextStyle(fontSize: 15, color: Colors.grey),

      labelLarge: TextStyle(fontSize: 37.sp, fontWeight: FontWeight.w400,fontFamily: "QuicklyGone" , color: const Color(0xff3F61AC)),  /// for HillzDealer in login page
      labelSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400,fontFamily: "Radley-Regular" , color: const Color(0xff3F61AC)), /// for Driven by Future,Run Faster, Cost Less in login page
    ),
  );



  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme:  AppBarTheme(
        titleTextStyle:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[400]),
        iconTheme: IconThemeData(
            color: Colors.grey[500]
        )
    ),

    iconTheme: IconThemeData(color: Colors.grey[500] ,),
    textTheme:  TextTheme(
      displayLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[900]),
      displayMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.grey[800] ),
      displaySmall:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.indigoAccent ),
      headlineLarge: const TextStyle(fontSize: 13, color: Colors.deepPurple),
      headlineMedium:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.deepPurple ),
      headlineSmall:const TextStyle(fontSize: 15 , color: Colors.deepPurple ), ///
      bodyLarge: TextStyle(fontSize: 15,  color: Colors.grey[800]),
      bodyMedium:const TextStyle(fontSize: 15, color: Colors.grey),
      bodySmall:const TextStyle(fontSize: 15, color: Colors.grey),
    ),
  );

}

