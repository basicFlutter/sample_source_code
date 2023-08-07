import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

class CustomItemExpansion extends StatelessWidget {
  const CustomItemExpansion({Key? key , required this.title ,required this.value  , this.dolorSignValue}) : super(key: key);
  final String title ;
  final String value;
  final bool? dolorSignValue;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: 358.w,
        height: 48.h,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).brightness == Brightness.light ? AppColors.primary3 : AppColors.primary3Dark,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            CustomText(
              text: title,
              textStyle: Theme.of(context).textTheme.displayMedium ,
              textFontWight: TextFontWight.medium,
              textColor: Theme.of(context).brightness == Brightness.light ?  AppColors.secondary3 : AppColors.secondary3Dark,
            ),
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                      text: value,
                      dollarSign: dolorSignValue,
                      textStyle: Theme.of(context).textTheme.displayMedium ,
                      textFontWight: TextFontWight.medium,
                      textColor: Theme.of(context).brightness == Brightness.light ?  AppColors.secondary : AppColors.secondaryDark,
                    ),
                  ],
                )
            )

          ],
        )

    );
  }
}
