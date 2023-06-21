import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/icon_gradient.dart';

class FilterListItem extends StatelessWidget {
  const FilterListItem({Key? key , required this.filterName , required this.onTap}) : super(key: key);
  final String filterName;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: InkWell(
        onTap: onTap,
        child: Container(
            height: 36.h,
            margin: EdgeInsets.only(right: 5.w),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(31.r)),
                boxShadow: [
                  Theme.of(context).brightness == Brightness.light ? AppColors.boxShadowInventory : AppColors.boxShadowInventoryDark
                ]
            ),
            child: Row(
              children: [
                CustomText(text: filterName,
                  textStyle:Theme.of(context).textTheme.displaySmall,
                  textFontWight: TextFontWight.regular,
                ),
                SizedBox(width: 8.w),

                IconGradient(
                  iconSize: 12.r,
                )
              ],
            )
        ),
      ),
    );
  }
}
