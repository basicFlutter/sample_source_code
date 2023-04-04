import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_dimensions.dart';
import '../constants/app_styles.dart';

class CustomTag extends StatelessWidget {
  final String tagString;
  final IconData? icon;
  final Function() onTap;
  final bool? isActive;

  const CustomTag(
      {Key? key,
      this.isActive,
      this.icon,
      required this.tagString,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: _tag(context));
  }

  Widget _tag(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 3.w , vertical: 2.h),
      child: Container(
        height: 35.h,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(12.r)),
            color: isActive ?? true
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).shadowColor),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.w, vertical:1.h),
          child: Row(
            mainAxisSize: MainAxisSize.min ,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                tagString,
                style: Theme.of(context).textTheme.bodySmall,
              )),
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Icon(
                    icon,
                    size: AppDimensions.smallIcon,
                    color: isActive ?? false
                        ? Theme.of(context).backgroundColor
                        : Theme.of(context).primaryColor,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
