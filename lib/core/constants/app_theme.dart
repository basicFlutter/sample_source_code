import "package:flutter/material.dart";
import "package:new_panel/core/constants/app_colors.dart";

ThemeData customLightTheme() {
  TextTheme _customLightThemesTextTheme(TextTheme base) {
    return base.copyWith(
        headline1: base.headline1?.copyWith(
          fontFamily: "Roboto",
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: AppColors.titleColor,
        ),
        headline2: base.headline2?.copyWith(
          fontFamily: "Roboto",
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.titleColor,
        ),
        headline3: base.headline3?.copyWith(
          fontSize: 15.0,
          color: AppColors.gray,
        ),
        headline4: base.headline4?.copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
          color: AppColors.titleColor,
        ),
        headline5: base.headline5?.copyWith(
          fontSize: 22.0,
          color: AppColors.titleColor,
        ),
        caption: base.caption?.copyWith(
            color: AppColors.gray, fontWeight: FontWeight.bold, fontSize: 10),
        bodyText1: base.bodyText1?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.gray,
        ),
        bodyText2:
            base.bodyText2?.copyWith(color: AppColors.titleColor, fontSize: 14),
        overline:
            base.overline?.copyWith(color: AppColors.yellow, fontSize: 12));
  }

  final ThemeData lightTheme = ThemeData.light();
  return lightTheme.copyWith(
    textTheme: _customLightThemesTextTheme(lightTheme.textTheme),
    primaryColor: AppColors.customGray,
    secondaryHeaderColor: AppColors.yellow,
    errorColor: AppColors.red,
    hintColor: AppColors.green,
    disabledColor: AppColors.unselected,
    cardColor: Colors.white,
    shadowColor: AppColors.unselected,
    backgroundColor: AppColors.darkBackground,
    indicatorColor: AppColors.yellow,
    dividerColor: AppColors.gray,
    toggleableActiveColor: AppColors.green,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    bottomAppBarColor: AppColors.customGray,
    primaryIconTheme: lightTheme.primaryIconTheme.copyWith(
      color: AppColors.customGray,
      size: 20,
    ),
    iconTheme: lightTheme.iconTheme.copyWith(color: AppColors.customGray),
    tabBarTheme: lightTheme.tabBarTheme.copyWith(
      labelColor: AppColors.customGray,
      unselectedLabelColor: AppColors.backgroundColor,
    ),
    buttonTheme:
        lightTheme.buttonTheme.copyWith(buttonColor: AppColors.customGray),
  );
}
