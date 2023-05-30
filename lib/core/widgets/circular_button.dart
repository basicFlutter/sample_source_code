import 'package:flutter/material.dart';
import 'package:new_panel/core/constants/app_colors.dart';

class CircularButton extends StatelessWidget {
  final double radius;
 final Widget child;
 final GestureTapCallback onTap;
 final EdgeInsets? padding;
 final Gradient? gradient;
  const CircularButton({Key? key ,required this.onTap ,  this.gradient ,this.padding,required this.radius , required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: radius,
        height: radius,
        padding: padding,
        decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: gradient ?? (Theme.of(context).brightness == Brightness.light ? AppColors.gradientGreen : AppColors.gradientGreenDark)

        ),
        child: Center(child: child),
      ),
    );
  }
}
