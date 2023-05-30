import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/gradeint_text.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key , required this.price , required this.specialPrice}) : super(key: key);
  final String? price;
  final String? specialPrice;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 6.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset("assets/images/edit_icon.svg"),
              SizedBox(width: 5.34.w),
              GradientText(
                text: specialPrice?? price??"0",
                textStyle: Theme.of(context).textTheme.bodyLarge,
                textFontWight: TextFontWight.bold,
                dollarSign: true,
                gradient:  Theme.of(context).brightness == Brightness.light ? AppColors.gradientBlue : AppColors.gradientBlueDark
              ),
            ],
          ),
             SizedBox(
                 height:3.5.h
             ),

          (specialPrice != null && specialPrice != "0" && price != "0") ?
          CustomText(text: price??"0",
            textStyle: Theme.of(context).textTheme.bodyMedium,
            textColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary4 : AppColors.secondary4Dark,
            textFontWight: TextFontWight.bold,
            dollarSign: true,
            specialPrice: true,
          ):
          const SizedBox()


        ],
      ),
    );
  }
}
