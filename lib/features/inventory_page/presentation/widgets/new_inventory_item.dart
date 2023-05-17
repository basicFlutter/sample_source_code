import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewInventoryItem extends StatelessWidget {
  const NewInventoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      height: 135.h,
      margin: EdgeInsets.only(bottom: 7.h),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(5.r))

      ),
    );
  }
}
