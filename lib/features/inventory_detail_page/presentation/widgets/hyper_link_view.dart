
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HyperLinkView extends StatelessWidget {
  const HyperLinkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h , horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Carfax Link:' , style: Theme.of(context).textTheme.labelLarge,) ,
          SizedBox(height: 10.h,),
          const Text('https://linkekarfaxinjabezar') ,
            SizedBox(height: 8.h,),
        ],),
      ),
    );
  }
}
