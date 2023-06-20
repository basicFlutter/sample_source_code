import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

class TotalCostInActionCard extends StatelessWidget {
  const TotalCostInActionCard({Key? key , required this.totalCost}) : super(key: key);
  final String? totalCost;
  @override
  Widget build(BuildContext context) {
    return     SizedBox(
      width: 126.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          SizedBox(width: 1.w),
          SizedBox(
              width: 10.w ,height: 9.h,
              child: SvgPicture.asset("assets/images/totalCostIcon.svg" )),
          SizedBox(width: 6.w),
          CustomText(text: "Total cost:",
            textStyle: Theme.of(context).textTheme.bodyLarge ,
            textFontWight: TextFontWight.bold,

            textColor: Theme.of(context).brightness == Brightness.light ? AppColors.black : AppColors.blackDark,
          ),
          SizedBox(width: 1.w),
          CustomText(
            text: totalCost ??"0",
            addSeparator: true,
            textStyle: Theme.of(context).textTheme.bodyLarge ,
            textFontWight: TextFontWight.regular,
            dollarSign: true,

            textColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary4 : AppColors.secondary4Dark,
          ),

        ],
      ),
    );
  }
}
