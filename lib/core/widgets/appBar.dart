import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/circular_button.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({Key? key , this.title , this.actions}) : super(key: key);
  final String? title;
  final Widget? actions;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return    Container(
      width: screenSize.width,
      margin: EdgeInsets.only(top: 12.h),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          CircularButton(
              gradient: Theme.of(context).brightness == Brightness.light ? AppColors.gradientOrange : AppColors.gradientOrangeDark,
              onTap: (){}, radius: 35.r,
              child: Icon(
                Icons.arrow_back_outlined,
                size: 20.r,
                color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
              )),

          Expanded(
              child: Center(child: CustomText(text: title!, textStyle: Theme.of(context).textTheme.titleLarge , textFontWight: TextFontWight.bold,))),
          if(actions!= null)
            actions!

        ],
      ),
    );
  }
}
