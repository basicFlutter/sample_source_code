import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/round_corner_button.dart';

class BosBottomNavigation extends StatelessWidget {
  const BosBottomNavigation({Key? key ,
    required this.onTapLeftButton ,
    required this.leftButtonTitle ,
    required this.rightButtonTitle,
    required this.onTapRightButton,
    this.leftButtonSvgPath,
    this.leftButtonIcon,
    this.rightButtonSvgPath,
    this.rightButtonIcon,
    this.iconSize,
    this.paddingBetweenIconAndText,
    this.leftButtonLoading,
    this.rightButtonLoading

  }) : super(key: key);
  final GestureTapCallback onTapLeftButton;
  final GestureTapCallback onTapRightButton;
  final String rightButtonTitle;
  final String leftButtonTitle;
  final String? leftButtonSvgPath;
  final String? rightButtonSvgPath;
  final IconData? rightButtonIcon;
  final IconData? leftButtonIcon;
  final double? iconSize;
  final double? paddingBetweenIconAndText;
  final bool? leftButtonLoading ;
  final bool? rightButtonLoading ;




  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      height: 56.h,

      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          RoundCornerButton(
            height: 46.h,
            width: 173.w,
            onTap: onTapLeftButton,
            title: leftButtonTitle,
            svgIconPath: leftButtonSvgPath,
            icon: leftButtonIcon,
            iconSize: iconSize,
            isLoading: leftButtonLoading,
            paddingBetweenIconAndText: paddingBetweenIconAndText,
            gradientBackGround: Theme.of(context).brightness == Brightness.light ? AppColors.gradientBlue : AppColors.gradientBlueDark,
          ),
             SizedBox(width: 12.w),
          RoundCornerButton(
            height: 46.h,
            width: 173.w,
            onTap: onTapRightButton,
            title: rightButtonTitle,
            svgIconPath: rightButtonSvgPath,
            icon: rightButtonIcon,
            iconSize: iconSize,
            isLoading: rightButtonLoading,
            paddingBetweenIconAndText: paddingBetweenIconAndText,
            gradientBackGround: Theme.of(context).brightness == Brightness.light ? AppColors.gradientGreen : AppColors.gradientGreenDark,

          ),
        ],
      ),

    );
  }
}
