import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/features/main_page_feature/presentation/widgets/submenu_model.dart';

class CustomSubmenu extends StatelessWidget {
   CustomSubmenu({Key? key , required this.subtitle, required this.index , required this.itemLength }) : super(key: key);
  final String subtitle;
 final int index;
 final int itemLength;



  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [


        if(index != 0)
          Align(
            alignment: Alignment.topLeft,
            child: CustomContainer(
                width: 2.r,
                height: 10.r,
                margin: EdgeInsets.only(left: 2.5.w),

                color: Theme.of(context).primaryColor,
                child: SizedBox()
            ),
          ),

        CustomContainer(
          // height: 51.h,
          // color: Colors.red,
          // border:Border(
          //   left: BorderSide( //                   <--- right side
          //     color: Colors.black,
          //     width: 1,
          //   ),
          // ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomContainer(
                  width: 7.5.r,
                  height: 7.5.r,
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                  child: SizedBox()),
              SizedBox(
                width: 20.w,
              ),
              CustomText(text: subtitle, textStyle: Theme.of(context).textTheme.labelMedium,
                textFontWight: TextFontWight.regular,
                textColor: Theme.of(context).brightness == Brightness.light ? AppColors.white :AppColors.whiteDark,
              )
            ],
          ),
        ),

        if(index != itemLength-1)

          Padding(
            padding:  EdgeInsets.only(top: 7.h,left: 2.5.w),
            child: CustomContainer(
                width: 2.r,
                height: 36.5.r,

                color: Theme.of(context).primaryColor,
                child: SizedBox()),
          ),


      ],
    );
  }
}
