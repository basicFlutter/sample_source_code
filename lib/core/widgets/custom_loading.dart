import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_panel/core/constants/app_colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key , this.lightColor}) : super(key: key);
  final bool? lightColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(
        color: (lightColor?? false) ? (Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark ) : Theme.of(context).primaryColor,
        size: 50.r,
      ),
    );
  }
}
