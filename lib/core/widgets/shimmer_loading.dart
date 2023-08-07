import 'package:flutter/material.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({Key? key , this.child }) : super(key: key);
  final Widget? child;



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
          baseColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary3Dark : AppColors.secondary3Dark,
          highlightColor:Colors.white,
        child: child ?? Icon(Icons.car_repair )
      ),
    );
  }
}
