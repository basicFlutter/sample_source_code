import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

class ButtonChangeStatus extends StatelessWidget {
  const ButtonChangeStatus({Key? key , required this.title , required this.onTap  , this.useLargeButton}) : super(key: key);
  final String title;
  final GestureTapCallback onTap;
  final bool? useLargeButton;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CustomContainer(
        width: (useLargeButton ?? false) ? 114.w: 83.w,
        padding: EdgeInsets.symmetric(horizontal:(useLargeButton ?? false) ? 26.w: 10.5.w , vertical: 5.h),
          // boxConstraints: BoxConstraints(
          //   maxWidth: 124.w,
          //   minWidth: 81.w
          // ),

          // gradient: Theme.of(context).brightness == Brightness.light ? AppColors.gradientBlue : AppColors.gradientBlueDark,
          color: Theme.of(context).brightness == Brightness.light ? AppColors.primary3 : AppColors.primary3Dark,
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).colorScheme.primary,
                spreadRadius: 0.1,
                offset: const Offset(0, 1))

          ],

          child: Center(
            child: SizedBox(
              width: 62.w,
              child: Center(
                child: CustomText(
                  text: title,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  textFontWight: TextFontWight.medium,

                ),
              ),
            ),
          )
      ),
    );
  }
}
