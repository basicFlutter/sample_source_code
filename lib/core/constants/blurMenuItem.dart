
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/icon_gradient.dart';

class BlurMenuItem extends StatelessWidget {
  final String text;
  final String? imagePath;
  final IconData? icon;

  const BlurMenuItem( {Key? key,required this.text,this.imagePath ,this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        if(imagePath == null)
          SizedBox(
            width: 5.w,
          ),
        if(imagePath != null)
          CustomContainer(
            width: 35.r,
            height: 35.r,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.borderButtonColor),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: Image.asset(
                  AppImages.profileTest,
                  fit: BoxFit.cover,
                  width: 35.r,
                  height:35.r,
                )),
          ),

        if(icon != null)
          CustomContainer(
            width: 30.r,
            height: 30.r,
            shape: BoxShape.circle,
            color: Theme.of(context).brightness == Brightness.light ? AppColors.primary3 : AppColors.primary3Dark,
            child: Center(
                child: IconGradient(
                  icon: icon!,
                  iconSize : 16.r,
                )
            ),

          ),

        SizedBox(
          width: imagePath != null ? 9.w : icon != null ? 10.w : 0,
        ),

        CustomText(text:text,
          textStyle: imagePath != null ? Theme.of(context).textTheme.labelLarge :Theme.of(context).textTheme.displayMedium ,
          textFontWight: TextFontWight.bold,),

      ],
    );
  }
}