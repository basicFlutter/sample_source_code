import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/circular_button.dart';
import 'package:new_panel/core/widgets/custom_text.dart';



class AppBarCustom extends StatelessWidget {
  const AppBarCustom({Key? key , this.title , this.actions , this.height , this.onTapBack , this.subTitle}) : super(key: key);
  final String? title;
  final String? subTitle;
  final Widget? actions;
  final double? height;
  final GestureTapCallback? onTapBack;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return    Container(
      width: screenSize.width,
      height: height,


      margin: EdgeInsets.only(top: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircularButton(
              gradient: Theme.of(context).brightness == Brightness.light ? AppColors.gradientOrange : AppColors.gradientOrangeDark,
              onTap: (){
                if(onTapBack != null){
                  onTapBack!();
                }else{
                Navigator.of(context).pop();
                }
              }, radius: 35.r,
              child: Icon(
                Icons.arrow_back_outlined,
                size: 20.r,
                color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
              )),

          if(title != null)
          Expanded(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),

                      CustomText(
                        text: title!,
                        textStyle: Theme.of(context).textTheme.titleLarge ,
                        textFontWight: TextFontWight.bold,
                      ),

                      if(subTitle!= null)
                        CustomText(text: subTitle!,
                          textStyle: Theme.of(context).textTheme.displayLarge ,
                          textFontWight: TextFontWight.regular,
                          textColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary3 : AppColors.secondary3Dark,),



                    ],
                  ))),
          if(actions!= null) actions!


        ],
      ),
    );
  }
}
