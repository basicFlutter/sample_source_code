import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:new_panel/core/constants/app_colors.dart";

class Style {
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme(

       onTertiary: AppColors.grayText, //TEXTE KHAKESTARY K TU SEARCH BAR DARIM
        shadow: AppColors.customGray,
        brightness: Brightness.light,
        primary: AppColors.primaryColor,
        onPrimary: AppColors.titleColor,
        secondary: AppColors.secondaryColor,
        onSecondary: AppColors.titleColor,
        error: AppColors.errorColor,
        onError: AppColors.white,
        background: AppColors.backgroundColor,
        onBackground: AppColors.titleColor,
        surface: AppColors.buttonColor,
        onSurface: AppColors.titleColor),
    //
    // checkboxTheme: CheckboxThemeData(
    //   checkColor: MaterialStateProperty.all(AppColors.checkColor),
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.all(Radius.circular(3.r)),
    //   ),
    //   side: MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
    //     if(states.contains(MaterialState.selected)){
    //       return const BorderSide(
    //           width: 1,
    //           color:Colors.transparent
    //       );
    //     }
    //     return const BorderSide(
    //         width: 1,
    //         color:AppColors.checkBorderColor
    //     ); // Defer to the widget's default.
    //   },
    //
    //   ),
    //   fillColor:MaterialStateProperty.resolveWith<Color?>(
    //
    //         (Set<MaterialState> states) {
    //           if(states.contains(MaterialState.selected)){
    //             return AppColors.checkBoxBackgroundColor;
    //           }
    //       return AppColors.lightBlue; // Defer to the widget's default.
    //     },
    //   ),
    //
    // ),
    //
    //
    // // appBarTheme:  AppBarTheme(
    // //     color: AppColors.appBarBackground,
    // //     backgroundColor: AppColors.appBarBackground,
    // //     titleTextStyle:  TextStyle(
    // //         fontSize: 12.sp,
    // //         fontWeight: FontWeight.w400,
    // //         color: AppColors.appBarTitle
    // //     ),
    // //     iconTheme: IconThemeData(
    // //         color: AppColors.appBarIcon,
    // //       size: 24.r
    // //     )
    // // ),
    //
    //
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor: AppColors.bottomNavigationBackGround,
    //   elevation: 0,
    //   selectedIconTheme: IconThemeData(
    //     color: AppColors.bottomNavigationIconSelected,
    //     size: 30.r
    //   ),
    //   unselectedIconTheme: IconThemeData(
    //       color: AppColors.bottomNavigationIconUnselected,
    //       size: 30.r
    //   ),
    //   selectedLabelStyle: TextStyle(
    //     color: AppColors.bottomNavigationTitle,
    //     fontSize: 10.sp,
    //     fontFamily: "PublicSans",
    //     fontWeight: FontWeight.w400
    //   ),
    // ),
    //
    //
    //
    // ///############################ textButton #########################################
    //
    // // textButtonTheme: TextButtonThemeData(
    // //   style: ButtonStyle(
    // //    textStyle: MaterialStateProperty.resolveWith((states) {
    // //      return
    // //    })
    // //   )
    // // ),
    //
    //
    //
    //
    // ///############################ textField theme #########################################
    //
    // inputDecorationTheme: InputDecorationTheme(
    //
    //   focusedBorder: OutlineInputBorder(
    //       borderRadius:
    //       BorderRadius.circular(AppDimensions.smallButtonRadius),
    //       borderSide: const BorderSide(color: AppColors.borderTextFieldColor)),
    //   border: OutlineInputBorder(
    //       borderRadius:
    //       BorderRadius.circular(AppDimensions.smallButtonRadius),
    //       borderSide: const BorderSide(color: AppColors.borderTextFieldColor )
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //
    //       borderRadius:
    //       BorderRadius.circular(AppDimensions.smallButtonRadius),
    //       borderSide: const BorderSide(color: AppColors.borderTextFieldColor)),
    //   labelStyle: TextStyle(
    //     fontWeight: FontWeight.w400,
    //     fontFamily: "PublicSans",
    //     fontSize: 14.sp,
    //     color: AppColors.labelTextFieldColor
    //   ),
    //   floatingLabelStyle: TextStyle(
    //       fontWeight: FontWeight.w400,
    //       fontFamily: "PublicSans",
    //       fontSize: 12.sp,
    //
    //       color: AppColors.labelTextFieldColor
    //   ),
    //
    //   hintStyle: TextStyle(
    //     fontWeight: FontWeight.w400,
    //     fontFamily: "PublicSans",
    //     fontSize: 16.sp,
    //     color: AppColors.hintTextFieldColor
    //   ),
    //
    //   errorStyle: TextStyle(
    //     fontWeight: FontWeight.w400,
    //     fontFamily: "PublicSans",
    //     fontSize: 12.sp,
    //     height: 0.3,
    //     color: AppColors.errorTextFieldColor,
    //   ),
    //   helperStyle: TextStyle(
    //       fontWeight: FontWeight.w400,
    //       fontFamily: "PublicSans",
    //       fontSize: 12.sp,
    //       color: AppColors.errorTextFieldColor
    //   ),
    //
    //
    //   prefixIconColor: AppColors.prefixIconColor,
    //   suffixIconColor: AppColors.suffixIconColor,
    //
    // ),
    //
    //
    // // textButtonTheme: TextButtonThemeData(
    // //   style: ButtonStyle(
    // //     textStyle: MaterialStateProperty<TextStyle?>(TextStyle){
    // //
    // //   }
    // //   )
    // // ),
    //
    //
    //
    // ///###############################################################################################
    //
    //

    iconTheme: IconThemeData(color: Colors.grey[700]),
    textTheme: TextTheme(
      /// for HillzDealer in login page
      displayLarge: TextStyle(
          fontSize: 37.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "QuicklyGone",
          color: const Color(0xff3F61AC)),

      /// for Driven by Future,Run Faster, Cost Less in login page
      displaySmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "Radley-Regular",
          color: const Color(0xff3F61AC)),
      displayMedium: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.titleColor),

      /// Large Title
      titleLarge: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "PublicSans",
          color: AppColors.titleColor),

      /// Medium Title
      titleMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "PublicSans",
          color: AppColors.titleColor),

      /// SubTitle
      titleSmall: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "PublicSans",
          color: AppColors.titleColor),
      headlineLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "PublicSans",
          color: AppColors.titleColor),
      headlineMedium:
          TextStyle(fontSize: 18.sp, color: AppColors.titleColor),
      //body normal text
      headlineSmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "PublicSans",
          color: AppColors.titleColor),

      /// for title check box
      bodyLarge: TextStyle(
          fontSize: 24.sp, fontWeight: FontWeight.w900, color: Colors.black),
      bodyMedium: TextStyle(
          fontSize: 18.sp, fontWeight: FontWeight.w900, color: Colors.black),
      // bodyText1: TextStyle(fontSize: 10.sp, color: AppColors.lightGrayColor),
      /// DESCRIPTION
      bodySmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "PublicSans",
          color: AppColors.titleColor),

      /// search hint text field text
      labelLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "PublicSans",
          color: AppColors.titleColor),

      /// search text
      labelMedium: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "PublicSans",
          color: AppColors.titleColor),

      /// label text => carPrice
      labelSmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "PublicSans",
          color: AppColors.titleColor),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[400]),
        iconTheme: IconThemeData(color: Colors.grey[500])),

    ///############################ textField theme #########################################

    // inputDecorationTheme: InputDecorationTheme(
    //   focusedBorder: OutlineInputBorder(
    //       borderRadius:
    //       BorderRadius.circular(AppDimensions.smallButtonRadius),
    //       borderSide:  BorderSide(color: AppColors.borderTextFieldColorDark)),
    //   border: OutlineInputBorder(
    //       borderRadius:
    //       BorderRadius.circular(AppDimensions.smallButtonRadius),
    //       borderSide:  BorderSide(color: AppColors.borderTextFieldColorDark)),
    //   enabledBorder: OutlineInputBorder(
    //       borderRadius:
    //       BorderRadius.circular(AppDimensions.smallButtonRadius),
    //       borderSide:  BorderSide(color: AppColors.borderTextFieldColorDark)),
    //   labelStyle: TextStyle(
    //       fontWeight: FontWeight.w400,
    //       fontFamily: "PublicSans",
    //       fontSize: 16.sp,
    //       color: AppColors.labelTextFieldColorDark
    //   ),
    //   hintStyle: TextStyle(
    //       fontWeight: FontWeight.w400,
    //       fontFamily: "PublicSans",
    //       fontSize: 16.sp,
    //       color: AppColors.hintTextFieldColorDark
    //   ),
    //   errorStyle: TextStyle(
    //       fontWeight: FontWeight.w400,
    //       fontFamily: "PublicSans",
    //       fontSize: 16.sp,
    //       color: AppColors.errorTextFieldColorDark
    //   ),
    //   prefixIconColor: AppColors.prefixIconColorDark,
    //   suffixIconColor: AppColors.suffixIconColorDark,
    //
    // ),
    //
    // ///###############################################################################################

    // colorScheme:  ColorScheme(
    //
    // ),

    iconTheme: IconThemeData(
      color: Colors.grey[500],
    ),
    textTheme: TextTheme(),
  );
}
