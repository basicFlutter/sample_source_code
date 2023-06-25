import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/circular_button.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({Key? key , this.title , this.actions , this.height}) : super(key: key);
  final String? title;
  final Widget? actions;
  final double? height;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return    Container(
      width: screenSize.width,
      height: height,

      margin: EdgeInsets.only(top: 12.h),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
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
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 5.h),
                    child: CustomText(text: title!, textStyle: Theme.of(context).textTheme.titleLarge , textFontWight: TextFontWight.bold,),
                  ))),
          if(actions!= null)
            actions!

        ],
      ),
    );
  }
}
