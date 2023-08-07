import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/gradeint_text.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          SizedBox(
            width: 261.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                GradientText(
                    text: "2010 Infiniti Mercedes benz",
                    textStyle: Theme.of(context).textTheme.titleSmall,
                    textFontWight: TextFontWight.bold,
                    gradient: Theme.of(context).brightness == Brightness.light ? AppColors.gradientBlue : AppColors.gradientBlueDark,
                ),

                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                  text: "TRUUT28N7110442", textStyle: Theme.of(context).textTheme.labelSmall ,
                )

              ],
            ),
          ),
          SizedBox(
            width: 97.w,
            child: Column(
              children: [
                CustomText(
                    text: "12000000",
                    textStyle: Theme.of(context).textTheme.bodySmall,
                    textFontWight: TextFontWight.bold,
                    dollarSign: true,
                    addSeparator: true,
                    specialPrice: false,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomText(
                  text: "13000000",
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  textFontWight: TextFontWight.regular,
                  dollarSign: true,
                  addSeparator: true,
                  specialPrice: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
