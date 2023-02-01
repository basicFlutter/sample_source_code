import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/login_feature/presentation/widgets/hillz_text.dart';
import '../constants/app_images.dart';

class CustomBodyWithLogo extends StatelessWidget {
  final Widget body ;
  final double? bodyHeight ;
  final double? bodyWidth ;
  final double? spaceFromBottom ;
  final double? spaceFromTop ;

  const CustomBodyWithLogo({Key? key ,this.spaceFromBottom ,  required this.body , this.bodyHeight , this.bodyWidth  , this.spaceFromTop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _customBody(context );
  }


  Widget _customBody(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
            left: 0,
            right: 0,
            //alignment: Alignment.topCenter,

            // child: Container(
            //
            //
            //
            //   decoration: BoxDecoration(
            //
            //     image: DecorationImage(
            //       image: AssetImage(
            //
            //         AppImages.pageLogo,),
            //      fit: BoxFit.cover,
            //       alignment: Alignment.topCenter
            //     ),
            //
            //   ),
            //   ),
              child: Image.asset(
                AppImages.pageLogo,
                width: 428.w,
                height: 928.h,
                fit: BoxFit.fitHeight,
              ),
           // )
        ),
        Positioned(
            top: 68.h,
            left: 71.w,
            right: 88.w,
            child: const HillzLogo()
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: IntrinsicHeight(
            child: Container(
              
             // duration: const Duration(milliseconds: 500),
              width:bodyWidth?? 428.w,
             // height:bodyHeight?? 562.h,
              constraints: BoxConstraints(
                minHeight: bodyHeight?? 562.h,
                //maxHeight: 600.h
              ),
              padding: EdgeInsets.only(top: spaceFromTop ?? 40.h , bottom:spaceFromBottom ??  60.h , left: 24.w , right: 24.w),
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r ) , topRight: Radius.circular(30.r ))
              ),
              child:body,
            ),
          ),
        )
      ],
    );
  }
}
