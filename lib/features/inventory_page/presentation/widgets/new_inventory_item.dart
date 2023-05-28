import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';

class NewInventoryItem extends StatelessWidget {
  const NewInventoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      height: 135.h,
      margin: EdgeInsets.only(bottom: 7.h),
      decoration: BoxDecoration(
        gradient: Theme.of(context).brightness == Brightness.light ? AppColors.gradientBackgroundCard : AppColors.gradientBackgroundCardDark,

          borderRadius: BorderRadius.all(Radius.circular(5.r))

      ),
    );
  }
}
