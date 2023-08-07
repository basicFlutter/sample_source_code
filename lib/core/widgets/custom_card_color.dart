import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

class CustomCardColor extends StatelessWidget {
  const CustomCardColor({Key? key , required this.iconSvgPath, required this.value , required this.title , required this.gradient}) : super(key: key);
  final String iconSvgPath;
  final String title;
  final String value;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(

      width: 358.w,
        height: 57.h,
        color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
        boxShadow: [
          Theme.of(context).brightness == Brightness.light ? AppColors.boxShadow : AppColors.boxShadowDark
        ],

        child: Row(
          children: [
            SizedBox(
              width: 18.w,
            ),
            SizedBox(
                width: 50.w,
                height: 40.h,
                child: Image.asset(iconSvgPath,)),
            SizedBox(
              width: 31.w,
            ),
            CustomText(
              text: title,
              textStyle: Theme.of(context).textTheme.displayLarge ,
              textFontWight: TextFontWight.medium,

            ),

            SizedBox(
              width: 170.w,
              child: Center(
                child: CustomText(
                  text: value,
                  textStyle: Theme.of(context).textTheme.headlineLarge,
                  textFontWight: TextFontWight.bold,
                ),
              ),
            ),

            const Expanded(child: SizedBox()),


            CustomContainer(
                width: 18.w,
                height: 57.h,
                borderRadius: BorderRadius.only(topRight: Radius.circular(5.r) , bottomRight: Radius.circular(5.r)),
                gradient: gradient,
                child: const SizedBox())

          ],
        )
    );
  }
}
