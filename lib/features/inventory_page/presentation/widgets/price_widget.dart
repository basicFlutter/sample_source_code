import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/gradeint_text.dart';



class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key , required this.price , required this.specialPrice , this.showEditIcon}) : super(key: key);
  final String? price;
  final String? specialPrice;
  final bool? showEditIcon ;


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
              Visibility(
                  visible: showEditIcon ??true,
                  child: SvgPicture.asset("assets/images/edit_icon.svg")),
              SizedBox(width: (showEditIcon ??true) ? 5.34.w :0),
              GradientText(
                text: specialPrice?? price??"0",
                textStyle: Theme.of(context).textTheme.bodyLarge,
                textFontWight: TextFontWight.bold,
                addSeparator: true,
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
            addSeparator: true,
            specialPrice: true,
          ):
          const SizedBox()


        ],
      ),
    );
  }
}
