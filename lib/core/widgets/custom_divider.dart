import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

class CustomDivider extends StatelessWidget {
  final DividerType type;
  final double? width;
  final double? height;



  const CustomDivider({Key? key, required this.type, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == DividerType.horizontal
        ? Divider(
            height: height,
            color: AppColors.unselected,
            thickness: AppDimensions.divider,
          )
        : VerticalDivider(
            width: width,
            color: AppColors.unselected,
            thickness: AppDimensions.divider,
          );
  }
}

enum DividerType { vertical, horizontal }
