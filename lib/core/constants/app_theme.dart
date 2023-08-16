import "dart:ui";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:new_panel/core/constants/app_colors.dart";



class Style {
  static ThemeData lightTheme = ThemeData(

    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    brightness: Brightness.light,
    // fontFamily: "publicSans-variable",
    fontFamily: "heebo-variable",
    primaryColor: AppColors.primary,

    searchBarTheme: SearchBarThemeData(
      backgroundColor:MaterialStateProperty.all(AppColors.primary3),
    ),




    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:AppColors.primary,


      elevation: 0,

      selectedIconTheme: IconThemeData(
          color: AppColors.white,
          size: 28.r
      ),
      unselectedIconTheme: IconThemeData(
          color:AppColors.white,
          size: 28.r
      ),
      selectedLabelStyle: TextStyle(
          color: AppColors.hint,
          fontSize:11.sp,
          fontVariations: const [
            FontVariation(
                'wght', 600
            )
          ]
      ),
      unselectedLabelStyle: TextStyle(
          color: AppColors.white,
          fontSize: 12.sp,

          fontVariations: const [
            FontVariation(
                'wght', 400
            )
          ]

      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(AppColors.white),

      fillColor: MaterialStateProperty.all(Colors.transparent),
      shape: const CircleBorder(),
    ),




    iconTheme: IconThemeData(color: Colors.grey[700]),
    textTheme: TextTheme(
      displayLarge:TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.titleColor,

      ),


      displaySmall:TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.titleColor),


      displayMedium: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.titleColor),


      titleLarge: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.titleColor),


      titleMedium: TextStyle(
          fontSize: 19.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.titleColor),


      titleSmall: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.titleColor),

      headlineLarge: TextStyle(
        fontSize: 31.sp,
        color: AppColors.titleColor,
        fontFamily: "publicSans-variable",

      ),
      headlineMedium: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w400, color: AppColors.secondary2),

      headlineSmall: TextStyle(
          fontSize: 9.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.titleColor),

      bodyLarge: TextStyle(
          fontSize: 10.sp, fontWeight: FontWeight.w400, color: AppColors.titleColor),
      bodyMedium: TextStyle(
          fontSize: 9.sp, fontWeight: FontWeight.w400, color: AppColors.titleColor),
      bodySmall: TextStyle(
          fontSize: 17.sp, fontWeight: FontWeight.w400, color: AppColors.titleColor),

      labelLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.titleColor),

      labelMedium: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.titleColor),

      labelSmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.titleColor),
    ),

  );

  static ThemeData darkTheme = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    brightness: Brightness.dark,
    // fontFamily: "publicSans-variable",
    fontFamily: "heebo-variable",
    primaryColor: AppColors.primary,

    searchBarTheme: SearchBarThemeData(
      backgroundColor:MaterialStateProperty.all(AppColors.primary3),
    ),




    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:AppColors.primary,


      elevation: 0,

      selectedIconTheme: IconThemeData(
          color: AppColors.white,
          size: 28.r
      ),
      unselectedIconTheme: IconThemeData(
          color:AppColors.white,
          size: 28.r
      ),
      selectedLabelStyle: TextStyle(
          color: AppColors.hint,
          fontSize:11.sp,
          fontVariations: const [
            FontVariation(
                'wght', 600
            )
          ]
      ),
      unselectedLabelStyle: TextStyle(
          color: AppColors.white,
          fontSize: 12.sp,

          fontVariations: const [
            FontVariation(
                'wght', 400
            )
          ]

      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(AppColors.white),

      fillColor: MaterialStateProperty.all(Colors.transparent),
      shape: const CircleBorder(),
    ),




    iconTheme: IconThemeData(color: Colors.grey[700]),
    textTheme: TextTheme(
      displayLarge:TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.titleColor,

      ),


      displaySmall:TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.titleColor),


      displayMedium: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.titleColor),


      titleLarge: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.titleColor),


      titleMedium: TextStyle(
          fontSize: 19.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.titleColor),


      titleSmall: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.titleColor),

      headlineLarge: TextStyle(
        fontSize: 31.sp,
        color: AppColors.titleColor,
        fontFamily: "publicSans-variable",

      ),
      headlineMedium: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w400, color: AppColors.secondary2Dark),

      headlineSmall: TextStyle(
          fontSize: 9.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.titleColor),

      bodyLarge: TextStyle(
          fontSize: 10.sp, fontWeight: FontWeight.w400, color: AppColors.titleColor),
      bodyMedium: TextStyle(
          fontSize: 9.sp, fontWeight: FontWeight.w400, color: AppColors.titleColor),
      bodySmall: TextStyle(
          fontSize: 17.sp, fontWeight: FontWeight.w400, color: AppColors.titleColor),

      labelLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.titleColor),

      labelMedium: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.titleColor),

      labelSmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.titleColor),
    ),
  );
}
