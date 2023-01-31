import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/widgets/subtitle.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorText ;
  const CustomErrorWidget({Key? key , required this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51.h,
      width: 380.w,
      decoration: BoxDecoration(
        color: Theme.of(context).errorColor.withOpacity(0.2)
      ),
      child: Row(children: [
        Padding(
          padding:  EdgeInsets.only(top: 13.w , bottom: 13.w,left: 16.h , right: 12.h),
          child: Icon(Icons.error , color: Theme.of(context).errorColor),
        ) ,
        Subtitle(text: errorText)
      ],),
    );
  }
}
