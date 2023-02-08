import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_dimensions.dart';
import '../constants/app_images.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 19.h , right: 20.w , left: 20.w ,   ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Image.asset(AppImages.lorem) ,
        _profilePicture(context)
      ],),
    );
  }

  Widget _profilePicture(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        _notifButton(context) ,
        SizedBox(width: 15.w,) ,
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(50.r)),
            child: Image.asset(AppImages.test , fit: BoxFit.cover,
            height: 35.h,
              width: 35.w,
            ))
      ],);
  }


  Widget _notifButton(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only( left: 20.h ),
      child: GestureDetector(
        child: Container(
          width: 35.w,
          height: 35.h,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(AppDimensions.circle))
          ),
          child: Icon(Icons.notifications_rounded  ,color: Theme.of(context).primaryColor,),
        ),
      ),
    );
  }
}
