

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarPriceText extends StatelessWidget {
  final String text ;
  const CarPriceText({Key? key , required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
            Icons.attach_money,
          color: Theme.of(context).textTheme.labelSmall?.color,
          size: 14.sp,
        ),
        Text(
          text,
        style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
