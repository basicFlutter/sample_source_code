import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

class ColorNameInActionCard extends StatelessWidget {
  const ColorNameInActionCard({Key? key , required this.color }) : super(key: key);
  final String? color;
  @override
  Widget build(BuildContext context) {
    return     Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Theme.of(context).brightness == Brightness.light ? AppColors.deActive : AppColors.deActiveDark,
            width: 0.5,
          ),
          right: BorderSide(
            color: Theme.of(context).brightness == Brightness.light ? AppColors.deActive : AppColors.deActiveDark,
            width:0.5,
          ),
        ),
      ),
      width: 148.w,
      height: 36.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(
              width: 11.w,
              height: 12.h,
              child: SvgPicture.asset("assets/images/colorIcon.svg")),
          SizedBox(
            width: 5.w,
          ),
          CustomText(
            text: "Color:",

            textStyle: Theme.of(context).textTheme.bodyLarge ,
            textFontWight: TextFontWight.bold,

            textColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary4 : AppColors.secondary4Dark,
          ),
          SizedBox(
            width: 1.w,
          ),
          CustomText(
            text: color??"",

            textStyle: Theme.of(context).textTheme.bodyLarge ,
            textFontWight: TextFontWight.regular,

            textColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary4 : AppColors.secondary4Dark,
          ),
        ],
      ),

    );
  }
}
