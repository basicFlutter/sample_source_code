import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

class ColumnTitle extends StatelessWidget {
  const ColumnTitle({Key? key , required this.title , required this.value , this.isHyperLink}) : super(key: key);
  final String title;
  final String value;
  final bool? isHyperLink;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          textStyle: Theme.of(context).textTheme.displayMedium ,
          textFontWight: TextFontWight.medium,
          textColor: Theme.of(context).brightness == Brightness.light ?  AppColors.secondary3 : AppColors.secondary3Dark,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomText(
          text: ". $value",
          textStyle: Theme.of(context).textTheme.labelMedium ,
          textFontWight: TextFontWight.regular,

          hyperLink: isHyperLink ?? false,
          textColor: (isHyperLink ??false) ? Theme.of(context).primaryColor :null,
        ),
        SizedBox(
          height: 17.h,
        ),


      ],
    );
  }
}
