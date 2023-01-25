import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSpace extends StatelessWidget {
  const CustomSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _customSpace();
  }


  Widget _customSpace() {
    return SizedBox(
      height: 16.4.h,
    );
  }
}
