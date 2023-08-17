import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_text.dart';


import '../constants/app_dimensions.dart';


class CustomTag extends StatelessWidget {
  final String tagString;
  final Widget? icon;
  final Function() onTap;
  final bool? isActive;
  final double width;

  const CustomTag(
      {Key? key,
      this.isActive,
      this.icon,
      required this.tagString,
        required this.width,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: _tag(context));
  }

  Widget _tag(BuildContext context) {
    return Container(
      height: 23.h,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          border: Border.all(width: 0.5 , color: Theme.of(context).primaryColor),
          //color: isActive ?? true ? Theme.of(context).colorScheme.secondary : Theme.of(context).shadowColor
      ),
      child: Row(
       // mainAxisSize: MainAxisSize.min ,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          icon ?? const SizedBox() ,
          SizedBox(
            width: 4.5.w,
          ),
          CustomText(text: tagString,
            textStyle:
          Theme.of(context).textTheme.bodyLarge,
            textColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary : AppColors.secondary,
            textFontWight: TextFontWight.regular,

          )


        ],
      ),
    );
  }
}
