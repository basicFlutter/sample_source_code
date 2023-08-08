import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key , required this.imageSvgPath , required this.title , this.isDisable , this.isVisible}) : super(key: key);
  final String imageSvgPath;
  final String title;
  final bool? isDisable;
  final bool? isVisible;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 24.h),
      child: Row(
        children: [
          CustomContainer(
            width: 40.r,
            height: 40.r,
            shape: BoxShape.circle,
              color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,

              child: Center(
                child: SvgPicture.asset(imageSvgPath),
              )),

          SizedBox(
            width: 15.w,
          ),

          CustomText(text: title,
              textStyle: Theme.of(context).textTheme.labelLarge ,
            textFontWight: TextFontWight.bold,
            textColor: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
          )

        ],
      ),
    );
  }
}
