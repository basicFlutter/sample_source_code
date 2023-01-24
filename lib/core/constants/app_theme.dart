import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:new_panel/core/constants/app_colors.dart";

import 'package:flutter/material.dart';
import "package:new_panel/core/constants/app_dimensions.dart";

class Style {

  static ThemeData lightTheme = ThemeData(

    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.lightBlue,
    highlightColor: Colors.white,
    secondaryHeaderColor: AppColors.unselected,


    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      background: Colors.white,
      onBackground: Colors.grey,
      error: Colors.red,
      onError: Colors.white,
      primary: AppColors.backgroundActiveButton, /// background active button
      onPrimary: AppColors.textActiveButton, /// text color active button
      secondary: AppColors.backgroundDeActiveButton, /// background deActive button
      onSecondary: AppColors.textDeActiveButton, /// text color deActive button
      tertiary: AppColors.backgroundGoogleButton, /// background Google Button
      onTertiary: AppColors.textGoogleButton, /// text color Google Button
      surface: Colors.white,
      onSurface: Colors.red,
    ),


    appBarTheme:  AppBarTheme(
        color: Colors.white54,
        titleTextStyle:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[700]),
        iconTheme: IconThemeData(
            color: Colors.grey[900]
        )
    ),


    ///############################ textField theme #########################################

    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(AppDimensions.smallButtonRadius),
          borderSide: const BorderSide(color: AppColors.borderTextFieldColor)),
      border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(AppDimensions.smallButtonRadius),
          borderSide: const BorderSide(color: AppColors.borderTextFieldColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(AppDimensions.smallButtonRadius),
          borderSide: const BorderSide(color: AppColors.borderTextFieldColor)),
      labelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: "PublicSans",
        fontSize: 16.sp,
        color: AppColors.labelTextFieldColor
      ),
      hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: "PublicSans",
        fontSize: 16.sp,
        color: AppColors.hintTextFieldColor
      ),
      errorStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: "PublicSans",
        fontSize: 16.sp,
        color: AppColors.errorTextFieldColor
      ),
      prefixIconColor: AppColors.prefixIconColor,
      suffixIconColor: AppColors.suffixIconColor,

    ),

    ///###############################################################################################




    iconTheme: IconThemeData(color: Colors.grey[700]),
    textTheme:  TextTheme(
      displayLarge: TextStyle(fontSize: 37.sp, fontWeight: FontWeight.w400,fontFamily: "QuicklyGone" , color: const Color(0xff3F61AC)),  /// for HillzDealer in login page
      displaySmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400,fontFamily: "Radley-Regular" , color: const Color(0xff3F61AC)), /// for Driven by Future,Run Faster, Cost Less in login page
      displayMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.grey[800] ),
      headlineLarge: const TextStyle(fontSize: 13, color: Colors.deepPurple),
      headlineMedium: TextStyle(fontSize: 14.sp, color:AppColors.bodyColor ), //body normal text
      headlineSmall:const TextStyle(fontSize: 15 , color: AppColors.grayText ),
      bodyLarge:  TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w900, color: Colors.black), //title
      bodyMedium:TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900, color: Colors.black), //subTitle
      bodySmall: TextStyle(fontSize: 14.sp, color: AppColors.grayText), // DESCRIPTION
      labelLarge: TextStyle(fontSize: 37.sp, fontWeight: FontWeight.w400,fontFamily: "QuicklyGone" , color: const Color(0xff3F61AC)),
      labelSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400,fontFamily: "Radley-Regular" , color: const Color(0xff3F61AC)),
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

    ///############################ textField theme #########################################

    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(AppDimensions.smallButtonRadius),
          borderSide: const BorderSide(color: AppColors.borderTextFieldColorDark)),
      border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(AppDimensions.smallButtonRadius),
          borderSide: const BorderSide(color: AppColors.borderTextFieldColorDark)),
      enabledBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(AppDimensions.smallButtonRadius),
          borderSide: const BorderSide(color: AppColors.borderTextFieldColorDark)),
      labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: "PublicSans",
          fontSize: 16.sp,
          color: AppColors.labelTextFieldColorDark
      ),
      hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: "PublicSans",
          fontSize: 16.sp,
          color: AppColors.hintTextFieldColorDark
      ),
      errorStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: "PublicSans",
          fontSize: 16.sp,
          color: AppColors.errorTextFieldColorDark
      ),
      prefixIconColor: AppColors.prefixIconColorDark,
      suffixIconColor: AppColors.suffixIconColorDark,

    ),

    ///###############################################################################################



    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      background: Colors.white,
      onBackground: Colors.grey,
      error: Colors.red,
      onError: Colors.white,
      primary: AppColors.backgroundActiveButtonDark, /// background active button
      onPrimary: AppColors.textActiveButtonDark, /// text color active button
      secondary: AppColors.backgroundDeActiveButtonDark, /// background deActive button
      onSecondary: AppColors.textDeActiveButtonDark, /// text color deActive button
      tertiary: AppColors.backgroundGoogleButtonDark, /// background Google Button
      onTertiary: AppColors.textGoogleButtonDark, /// text color Google Button
      surface: Colors.white,
      onSurface: Colors.red,
    ),

    iconTheme: IconThemeData(color: Colors.grey[500] ,),
    textTheme:  TextTheme(
      displayLarge: TextStyle(fontSize: 37.sp, fontWeight: FontWeight.w400,fontFamily: "QuicklyGone" , color: const Color(0xff3F61AC)),  /// for HillzDealer in login page
      displaySmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400,fontFamily: "Radley-Regular" , color: const Color(0xff3F61AC)), /// for Driven by Future,Run Faster, Cost Less in login page
      headlineLarge: const TextStyle(fontSize: 13, color: Colors.deepPurple),
      headlineMedium:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.deepPurple ),
      headlineSmall:const TextStyle(fontSize: 15 , color: Colors.deepPurple ), ///
      bodyLarge: TextStyle(fontSize: 15,  color: Colors.grey[800]),
      bodyMedium:const TextStyle(fontSize: 15, color: Colors.grey),
      bodySmall:const TextStyle(fontSize: 15, color: Colors.grey),
    ),
  );

}

