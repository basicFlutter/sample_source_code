import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html_editor_enhanced/utils/shims/dart_ui_real.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_image_network.dart';

class SliderDetail extends StatefulWidget {
  const SliderDetail({Key? key}) : super(key: key);

  @override
  State<SliderDetail> createState() => _SliderDetailState();
}

class _SliderDetailState extends State<SliderDetail> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        height: 320.h,
        width: 390.w,
        margin: EdgeInsets.only(top: 15.h),
        //color: Colors.red,
        child: Stack(
          children: [
            CustomImageNetwork(
                imageHeight: 287.h,
                imageWidth: 390.w,
                url: "/hillzgroup/6989326754475327-Subaru-BRZ-2015-11369cb0-2f8d-11ee-b422-cd37e6d3ffa2.jpg"
            ),

      Positioned(
        right: 30.w,
        left: 30.w,
        bottom: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4, tileMode: TileMode.repeated),
            child: Container(
              width: 325.w,
              height: 66.h,
              decoration: BoxDecoration(
                  color: const Color(0xff2C3E50).withOpacity(0.63)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios_new, color: Theme.of(context).colorScheme.background,),



                  Icon(Icons.arrow_forward_ios_outlined , color: Theme.of(context).colorScheme.background,)
                ],),
            ),
          ),
        ),
      )
            // Positioned(
            //   bottom: 0,
            //
            //   child: BackdropFilter(
            //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10, tileMode: TileMode.repeated),
            //     child: CustomContainer(
            //       width: 325.w,
            //       height: 66.h,
            //       color: Colors.grey,
            //       boxShadow: [
            //         Theme.of(context).brightness == Brightness.light ? AppColors.boxShadow :AppColors.boxShadowDark
            //       ],
            //       borderRadius: BorderRadius.all(Radius.circular(10.r)),
            //
            //       child: SizedBox(),
            //     ),
            //   ),
            // )
          ],

    ));
  }
}
