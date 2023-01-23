
import 'package:flutter/material.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class AppStyles {


  static  TextStyle welcomeTextStyle = TextStyle(
    fontSize: 20,
    fontFamily: 'roboto',
    fontWeight: FontWeight.bold,
    color: Colors.white
  );
  static  TextStyle welcomeSubtitleTextStyle = TextStyle(
      fontSize: 14,
      fontFamily: 'roboto',
      fontWeight: FontWeight.bold,
      color: Colors.white70
  );

  static  TextStyle poweredByHillzTextStyle = TextStyle(
      fontSize: 14,
      fontFamily: 'roboto',
      fontWeight: FontWeight.bold,
      color: Colors.white60
  );


  static const TextStyle h1 = TextStyle(
      color: AppColors.titleColor,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontFamily: 'montserrat',
      fontSize: 96.0);
  static const TextStyle h2 = TextStyle(
      color: AppColors.titleColor,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontFamily: 'montserrat',
      fontSize: 60.0);
  static const TextStyle h3 = TextStyle(
      color: AppColors.titleColor,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontFamily: 'montserrat',
      fontSize: 48.0);
  static const TextStyle h4 = TextStyle(
      color: AppColors.titleColor,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: 'montserrat',
      fontSize: 34.0);
  static const TextStyle h5 = TextStyle(
      color: AppColors.titleColor,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: 'montserrat',
      fontSize: 24.0);
  static const TextStyle h6 = TextStyle(
      color: AppColors.titleColor,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: 'montserrat',
      fontSize: 19.0);
  static  TextStyle subtitle1 = TextStyle(
      color: AppColors.titleColor,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontFamily: 'roboto',
      fontSize: 11.sp); // 14
  static  TextStyle subtitle2 = TextStyle(
      color: AppColors.titleColor,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontFamily: 'roboto',
      fontSize: 11.sp); // 14
  static const TextStyle body1 = TextStyle(
      color: AppColors.titleColor,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'roboto',
      fontSize: 18.0);
  static const TextStyle body2 = TextStyle(
      color: AppColors.titleColor,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'roboto',
      fontSize: 15.0
  );
  static const TextStyle body3 = TextStyle(
      color: AppColors.titleColor,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'roboto',
      fontSize: 12.0);
  static const TextStyle button = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontFamily: 'roboto',
      fontSize: 13.0);
  static const TextStyle caption = TextStyle(
      color: AppColors.titleColor,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'roboto',
      fontSize: 12.0);

  static const TextStyle titleCarDetailStyle = TextStyle(
    color: AppColors.customGray,
    fontSize: 13,
    fontWeight: FontWeight.bold,
    height: 1.4
  );

  static  TextStyle titleStyleDetail = TextStyle(
      color: AppColors.gray,
      fontSize: 11.sp,
      fontWeight: FontWeight.bold,
  );

  static  TextStyle subTitleStyleDetail = TextStyle(
    color: AppColors.gray,
    fontSize: 10.sp,
    fontWeight: FontWeight.normal,
  );

  static  TextStyle priceStyle = TextStyle(
    color: AppColors.yellow,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );

  static  TextStyle titleTableCarDetail = TextStyle(
    color: AppColors.titleRowTable,
    fontSize: 10.sp,
    fontWeight: FontWeight.bold,
  );

  static  TextStyle valueTableCarDetail = TextStyle(
    color: AppColors.gray,
    fontSize: 10.sp,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle buttonTextStyleCarDetail = TextStyle(
    color: AppColors.yellow,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
}
