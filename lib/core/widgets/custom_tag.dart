import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_dimensions.dart';
import '../constants/app_styles.dart';

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
          Text(
            tagString,
            style: Theme.of(context).textTheme.headlineSmall,
          ),

        ],
      ),
    );
  }
}
