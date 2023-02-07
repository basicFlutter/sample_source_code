import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDottedLineWidget extends StatelessWidget {
 final double? width ;

   CustomDottedLineWidget({Key? key , this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: width ?? 1.sw,
      // height: 3.h,
      child: DottedLine(
        direction: Axis.horizontal,
        lineLength: double.infinity,
        lineThickness: 1.0,
        dashLength: 6.0,
        dashColor: Theme.of(context).colorScheme.shadow,
        dashRadius: 1.0,
        dashGapLength: 4.0,
        dashGapColor: Colors.transparent,
        dashGapRadius: 0.0,
      ),
    );
  }

}
