import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({Key? key , this.title , this.subTitle , this.subTitlePadding , this.titlePadding}) : super(key: key);
  final String? title;
  final String? subTitle;

  final double? titlePadding;
  final double? subTitlePadding;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      // width: 1.sw,
      // height: height,
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 203.w,
              height: 189.h,
              child: SvgPicture.asset("assets/images/car_empty.svg")),
          SizedBox(
            height: titlePadding ?? 50.h,
          ),
          CustomText(
            text: title!,
            textStyle: Theme.of(context).textTheme.titleLarge ,
            textFontWight: TextFontWight.bold,
            textColor: Theme.of(context).primaryColor,
          ),
          SizedBox(
            height: subTitlePadding ?? 10.h,
          ),
          CustomText(
            text: subTitle!,
            textStyle: Theme.of(context).textTheme.labelSmall ,
            textFontWight: TextFontWight.medium,
            // letterSpace: 0.01,
            textColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary3 : AppColors.secondary3Dark,
          )
        ],
      ),
    );
  }
}
