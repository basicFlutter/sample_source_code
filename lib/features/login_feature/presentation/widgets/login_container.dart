import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 428.w,
      height: 562.h,
      padding: EdgeInsets.only(top: 40.h , bottom: 64.h , left: 24.w , right: 24.w),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r ) , topRight: Radius.circular(30.r ))
      ),

      child: Column(
        children: [
          Row(
            children: [
              Image.asset("assets/images/icon_accont.png")
            ],
          )
        ],
      ),


    );
  }
}
