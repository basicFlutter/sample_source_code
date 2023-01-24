import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/login_feature/presentation/widgets/hillz_text.dart';
import '../constants/app_images.dart';

class CustomBodyWithLogo extends StatelessWidget {
  final Widget body ;
  final double? bodyHeight ;
  final double? bodyWidth ;
  const CustomBodyWithLogo({Key? key , required this.body , this.bodyHeight , this.bodyWidth }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _customBody(context );
  }


  Widget _customBody(BuildContext context) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.topCenter,

            child: Image.asset(
              AppImages.pageLogo,
              fit: BoxFit.fitWidth,
            )
        ),
        Positioned(
            top: 68.h,
            left: 71.w,
            right: 88.w,
            child: const HillzLogo()
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width:bodyWidth?? 428.w,
            height:bodyHeight?? 562.h,
            padding: EdgeInsets.only(top: 40.h , bottom: 60.h , left: 24.w , right: 24.w),
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r ) , topRight: Radius.circular(30.r ))
            ),
            child:body,
          ),
        )
      ],
    );
  }
}
