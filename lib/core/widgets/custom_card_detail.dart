import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

class CustomCardDetail extends StatelessWidget {
  const CustomCardDetail({Key? key , required this.title , required this.iconSvgPath , required this.value}) : super(key: key);
  final String iconSvgPath;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        width: 110.w,
        height: 86.h,
        color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
        boxShadow: [
          Theme.of(context).brightness == Brightness.light ? AppColors.boxShadow : AppColors.boxShadowDark
        ],
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 25.w,
              height: 25.h,
              child: SvgPicture.asset(iconSvgPath),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomText(
              text: title,
              textStyle: Theme.of(context).textTheme.bodyLarge ,
            textFontWight: TextFontWight.regular,
              textColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary3 : AppColors.secondary3Dark,
            ),

            CustomText(text: value, textStyle: Theme.of(context).textTheme.displayLarge ,
              textFontWight: TextFontWight.medium,
            ),

          ],

        )

    );
  }
}
