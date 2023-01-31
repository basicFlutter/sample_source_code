import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSpace extends StatelessWidget {
  final double? space ;
  const CustomSpace({Key? key , this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _customSpace();
  }


  Widget _customSpace() {
    return SizedBox(
      height:space ??  16.4.h,
    );
  }
}
