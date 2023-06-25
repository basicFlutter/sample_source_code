import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';

class IconGradient extends StatelessWidget {
  const IconGradient({Key? key , required this.iconSize , required this.icon,this.gradient , this.onTap}) : super(key: key);
  final Gradient? gradient;
  final double iconSize;
  final IconData icon;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (Rect bounds) => (gradient??(Theme.of(context).brightness == Brightness.light ? AppColors.gradientBlue :AppColors.gradientBlueDark)).createShader(bounds),
        child: Icon(
         icon ,
          size: iconSize,
        ),
      ),
    );
  }
}
