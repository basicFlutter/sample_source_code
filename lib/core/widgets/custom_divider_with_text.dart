import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

class CustomDividerWithText extends StatelessWidget {
  final String text ;
  const CustomDividerWithText({Key? key , required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 22.h,
      child: Row(children: <Widget>[
        Expanded(
          child:  Container(
              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Divider(
                color: Theme.of(context).brightness == Brightness.light ? AppColors.deActive :AppColors.deActiveDark,
                height: 36,
              )),
        ),
        CustomText(text: text, textStyle: Theme.of(context).textTheme.displaySmall),
        Expanded(
          child:  Container(
              margin: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: Divider(
                color: Theme.of(context).brightness == Brightness.light ? AppColors.deActive :AppColors.deActiveDark,
                height: 36,
              )),
        ),
      ]),
    );
  }
}
