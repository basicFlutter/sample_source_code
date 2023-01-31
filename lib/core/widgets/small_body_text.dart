import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallBodyText extends StatelessWidget {
  final String text;

  const SmallBodyText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 8.sp,
          color: Theme.of(context).colorScheme.onBackground,
          fontFamily: "PublicSans"),
    );
  }
}
