import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

class ItemExpansionText extends StatelessWidget {
  const ItemExpansionText({Key? key , required this.value }) : super(key: key);
  final String value;


  @override
  Widget build(BuildContext context) {
    return CustomText(
        text: value,
        multiLine: true,
        textStyle:Theme.of(context).textTheme.displayMedium,
      textFontWight: TextFontWight.regular,
      wordSpace: 2,

    );
  }
}
