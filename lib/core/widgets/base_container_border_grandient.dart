import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_container.dart';

class ContainerWithBorderGradient extends StatelessWidget {
  const ContainerWithBorderGradient({Key? key,required this.radius , required this.child}) : super(key: key);
  final double radius;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      shape: BoxShape.circle,
      width: radius,
      height: radius,
      padding: EdgeInsets.all(1.r),
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,

        colors: [
          Theme.of(context).brightness == Brightness.light ? AppColors.primary : AppColors.primaryDark,
          Theme.of(context).brightness == Brightness.light ? AppColors.borderButtonColor : AppColors.borderButtonColorDark,
          Theme.of(context).brightness == Brightness.light ? AppColors.borderButtonColor.withOpacity(0) : AppColors.borderButtonColorDark.withOpacity(0),
        ]
      ),
        child: CustomContainer(
            color: Theme.of(context).brightness == Brightness.light ? AppColors.primary3 : AppColors.primary3Dark,
            shape: BoxShape.circle,
            child: child)
    );
  }
}
