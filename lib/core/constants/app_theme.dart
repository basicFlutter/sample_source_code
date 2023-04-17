import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:new_panel/core/constants/app_colors.dart";

class Style {
  static ThemeData lightTheme = ThemeData(

       colorScheme: const ColorScheme(
         surfaceTint: AppColors.selectedColor,
       tertiary: AppColors.cardColor,
       onTertiaryContainer: AppColors.darkBlueColor,
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
        surface: AppColors.unselectedColor,
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
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.customLightGray,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        color: AppColors.backgroundColor,
        size: 30.r
      ),
      unselectedIconTheme: IconThemeData(
          color:AppColors.backgroundColor.withOpacity(0.5),
          size: 30.r
      ),
      selectedLabelStyle: TextStyle(
        color: AppColors.backgroundColor,
        fontSize:10.sp,
        fontFamily: "Tajawal-Regular",
        fontWeight: FontWeight.w400
      ),
      unselectedLabelStyle: TextStyle(
          color: AppColors.backgroundColor.withOpacity(0.5) ,
          fontSize: 10.sp,
          fontFamily: "Tajawal-Regular",
          fontWeight: FontWeight.w400
      ),
    ),
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
      displayLarge:TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "PublicSans",
          color: AppColors.titleColor),

      /// for Driven by Future,Run Faster, Cost Less in login page
      displaySmall:TextStyle(
          fontSize: 8.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "PublicSans",
          color: AppColors.titleColor),


      displayMedium: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "PublicSans",
          color: AppColors.titleColor),

      /// Large Title
      titleLarge: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "PublicSans",
          color: AppColors.titleColor),

      /// Medium Title
      titleMedium: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "PublicSans",
          color: AppColors.titleColor),

      /// SubTitle
      titleSmall: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "PublicSans",
          color: AppColors.titleColor),

      headlineLarge: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w300,
          fontFamily: "PublicSans",
          color: AppColors.titleColor),
      headlineMedium:
          TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w300, color: AppColors.grayText),
      //body normal text
      headlineSmall: TextStyle(
          fontSize: 9.sp,
          fontWeight: FontWeight.w300,
          fontFamily: "PublicSans",
          color: AppColors.titleColor),
    //
    //   /// for title check box
      bodyLarge: TextStyle(
          fontSize: 10.sp, fontWeight: FontWeight.w400, color: Colors.black),
      bodyMedium: TextStyle(
          fontSize: 10.sp, fontWeight: FontWeight.w700, color: AppColors.primaryColor),

      bodySmall: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w300,
          fontFamily: "PublicSans",
          color: AppColors.disableGrayColor),
    //
    //   /// search hint text field text
      labelLarge: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "PublicSans",
          color: AppColors.titleColor),

      /// search text
      labelMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "PublicSans",
          color: AppColors.primaryColor),

      /// label text => carPrice
      labelSmall: TextStyle(
          fontSize: 13.sp,
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
