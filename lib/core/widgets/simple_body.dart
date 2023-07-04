import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/widgets/appBar.dart';

class SimpleBody extends StatelessWidget {
  const SimpleBody({Key? key , this.title , this.appBarCustom , required this.body , this.bottomNavigation}) : super(key: key);
  final String? title;
  final AppBarCustom? appBarCustom;
  final Widget body;
  final Widget? bottomNavigation;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: bottomNavigation,
        appBar: appBarCustom != null ? PreferredSize(
          preferredSize:Size(1.sw , 47.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: appBarCustom!,
          )
        ): null,
        body: Container(
          height: 1.sh,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          margin: EdgeInsets.only(top: 20.h),
          width: 1.sw,
          child: body,
        ),
      ),
      
    );
  }
}
