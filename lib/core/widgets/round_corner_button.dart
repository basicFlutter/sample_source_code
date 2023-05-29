import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

class RoundCornerButton extends StatelessWidget {

  final double width;
  final double height;

  final double? radius;
  final IconData ? icon;
  final String title;
  const RoundCornerButton({Key? key, required this.width ,required this.title ,this.icon ,required this.height  , this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 10.r)),
          gradient: Theme.of(context).brightness == Brightness.light ? AppColors.gradientOrange : AppColors.gradientOrangeDark
      ),
      // padding: EdgeInsets.only(top: 7.h , bottom: 8.h),
      child:Container(
        height: 13.h,
        // color: Colors.grey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(icon != null)

              Icon(
                Icons.add ,
                size: 12.r,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0, 1),
                    blurRadius: 1,
                    color: Colors.black.withOpacity(0.25),
                  ),
                ],
                color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
              ),
            if(icon != null)
              SizedBox(width: 1.w),
            CustomText(
                textFontWight: TextFontWight.regular,
                text: title,
                isShadow: true,
                textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
                ))
          ],
        ),
      ),
    );
  }
}
