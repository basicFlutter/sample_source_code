import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/main.dart';

class CustomSwitch extends StatefulWidget {
   CustomSwitch({Key? key ,required this.state , required this.onChanged}) : super(key: key);
   bool state;
   Function(bool) onChanged;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.state = !widget.state;
        widget.onChanged(widget.state);
        setState(() {

        });
      },
      child: Container(
        width: 30.w,
        height: 16.h,
        decoration: BoxDecoration(
          color: widget.state ? (Theme.of(context).brightness == Brightness.light ? AppColors.active : AppColors.activeDark) :Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(50.r)),
          boxShadow: [

            BoxShadow(
              color: Theme.of(context).brightness == Brightness.light ? AppColors.black.withOpacity(0.1) : AppColors.blackDark.withOpacity(0.1)  ,
            ),

             BoxShadow(
                color:Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
                spreadRadius: -3.0,
                blurRadius: 8,
                offset: const Offset(0, 6)
            ),
            // if(widget.state == false)
            //   BoxShadow(
            //       color:Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
            //       spreadRadius: -3.0,
            //       blurRadius: 8,
            //       offset: const Offset(0, 6)
            //   ),
          ]
          // boxShadow: Theme.of(context).brightness == Brightness.light ? AppColors.switchShadow :AppColors.switchShadowDark
        ),
        padding: EdgeInsets.symmetric(horizontal: 1.7.w),
        child: AnimatedAlign(
          duration: const Duration(
            milliseconds: 300
          ),
          curve: Curves.easeIn,
          alignment: widget.state ? Alignment.centerRight :Alignment.centerLeft,
          child: Container(
            width: 11.9.w,
            height: 12.44.h,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              boxShadow: [
                Theme.of(context).brightness == Brightness.light ? AppColors.toggleSwitchShadow :AppColors.toggleSwitchShadowDark
              ]
            ),
          ),
        ),
      ),
    );
  }
}
