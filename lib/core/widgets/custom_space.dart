import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomVerticalSpace extends StatelessWidget {
  final double? space ;
  const CustomVerticalSpace({Key? key , this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _customSpace();
  }


  Widget _customSpace() {
    return SizedBox(
      height:space ??  15.h,
    );
  }
}
