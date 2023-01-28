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

    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Colors.deepOrange),
      fillColor:MaterialStateProperty.resolveWith<Color?>(

            (Set<MaterialState> states) {
              if(states.contains(MaterialState.selected)){
                return AppColors.checkBoxBackgroundColor;
              }
          return Colors.red; // Defer to the widget's default.
        },
      ),
    ),


    // appBarTheme:  AppBarTheme(
    //     color: AppColors.appBarBackground,
    //     backgroundColor: AppColors.appBarBackground,
    //     titleTextStyle:  TextStyle(
    //         fontSize: 12.sp,
    //         fontWeight: FontWeight.w400,
    //         color: AppColors.appBarTitle
    //     ),
    //     iconTheme: IconThemeData(
    //         color: AppColors.appBarIcon,
    //       size: 24.r
    //     )
    // ),


    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.bottomNavigationBackGround,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        color: AppColors.bottomNavigationIconSelected,
        size: 30.r
      ),
      unselectedIconTheme: IconThemeData(
          color: AppColors.bottomNavigationIconUnselected,
          size: 30.r
      ),
      selectedLabelStyle: TextStyle(
        color: AppColors.bottomNavigationTitle,
        fontSize: 10.sp,
        fontFamily: "PublicSans",
        fontWeight: FontWeight.w400
      ),
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
          borderSide: const BorderSide(color: AppColors.borderTextFieldColor )
      ),
      enabledBorder: OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(AppDimensions.smallButtonRadius),
          borderSide: const BorderSide(color: AppColors.borderTextFieldColor)),
      labelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: "PublicSans",
        fontSize: 14.sp,
        color: AppColors.labelTextFieldColor
      ),
      floatingLabelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: "PublicSans",
          fontSize: 12.sp,

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
        fontSize: 12.sp,
        height: 0.3,
        color: AppColors.errorTextFieldColor,
      ),
      helperStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: "PublicSans",
          fontSize: 12.sp,
          color: AppColors.errorTextFieldColor
      ),


      prefixIconColor: AppColors.prefixIconColor,
      suffixIconColor: AppColors.suffixIconColor,

    ),


    // textButtonTheme: TextButtonThemeData(
    //   style: ButtonStyle(
    //     textStyle: MaterialStateProperty<TextStyle?>(TextStyle){
    //
    //   }
    //   )
    // ),



    ///###############################################################################################




    iconTheme: IconThemeData(color: Colors.grey[700]),
    textTheme:  TextTheme(
      /// for HillzDealer in login page
      displayLarge: TextStyle(fontSize: 37.sp, fontWeight: FontWeight.w400,fontFamily: "QuicklyGone" , color: const Color(0xff3F61AC)),
      /// for Driven by Future,Run Faster, Cost Less in login page
      displaySmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400,fontFamily: "Radley-Regular" , color: const Color(0xff3F61AC)),
      displayMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.grey[800] ),
      /// Large Title
      titleLarge: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700,fontFamily: "PublicSans" , color: AppColors.largeTitleColor),
      /// Medium Title
      titleMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600,fontFamily: "PublicSans" , color: AppColors.mediumTitleColor),
      /// SubTitle
      titleSmall:TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400,fontFamily: "PublicSans" , color: AppColors.subtitleColor),
      headlineLarge: const TextStyle(fontSize: 13, color: Colors.deepPurple),
      headlineMedium: TextStyle(fontSize: 14.sp, color:AppColors.bodyColor ), //body normal text
      headlineSmall:const TextStyle(fontSize: 15 , color: AppColors.grayText ),
      bodyLarge:  TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w900, color: Colors.black),
      bodyMedium:TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w900, color: Colors.black),
      /// DESCRIPTION
      bodySmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400,fontFamily: "PublicSans" , color: AppColors.textDescription),
      /// search hint text field text
      labelLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400,fontFamily: "PublicSans" , color: AppColors.searchHint),
      /// search text
      labelMedium: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400,fontFamily: "PublicSans" , color: AppColors.searchText),
      /// label text => carPrice
      labelSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400,fontFamily: "PublicSans" , color: AppColors.labelColor),

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
        displayLarge: TextStyle(fontSize: 37.sp, fontWeight: FontWeight.w400,fontFamily: "QuicklyGone" , color: AppColors.hillzTitle),  /// for HillzDealer in login page
        displaySmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400,fontFamily: "Radley-Regular" , color: AppColors.hillzSubtitle), /// for Driven by Future,Run Faster, Cost Less in login page
        titleLarge: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700,fontFamily: "PublicSans" , color: AppColors.largeTitleColorDark),
        titleMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600,fontFamily: "PublicSans" , color: AppColors.mediumTitleColorDark),
        titleSmall:TextStyle(fontSize: 37.sp, fontWeight: FontWeight.w400,fontFamily: "PublicSans" , color: AppColors.smallTitleColorDark),
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

}

