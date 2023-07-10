import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';

class BackTextField extends StatefulWidget {
   BackTextField({Key? key , required this.isRequired }) : super(key: key);

   bool? isRequired;

  @override
  State<BackTextField> createState() => BackTextFieldState();
}

class BackTextFieldState extends State<BackTextField> {
  bool hasError = false;
  @override
  Widget build(BuildContext context) {
    return   Container(

      height: 45.h,

      decoration: BoxDecoration(
        color: Theme.of(context).brightness== Brightness.light ? AppColors.input  : AppColors.inputDark,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),

        boxShadow: [

          Theme.of(context).brightness == Brightness.light ?AppColors.inputShadow :AppColors.inputShadowDark,

          if((widget.isRequired ?? false)&& (hasError ?? false))
            BoxShadow(
                color: Theme.of(context).brightness == Brightness.light ?AppColors.errorColor :AppColors.errorColorDark,
                spreadRadius: 0.1,
                offset: const Offset(0, 2))
        ],
      ),


    );
  }
}
