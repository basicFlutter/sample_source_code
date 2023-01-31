import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_images.dart';

class MenuItemWidget extends StatelessWidget {
  final String title ;
  final String imageUrl ;
  final Function? onTap ;

  const MenuItemWidget({Key? key , required this.title , required this.imageUrl , this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _menuItem(context );
  }


Widget _menuItem(BuildContext context ){
    return  Container(
      decoration: BoxDecoration(
          boxShadow:  [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow,
              blurRadius: 1,
              offset: const Offset(1, 1 ), // Shadow position
            ),
          ],
          color: Theme.of(context).backgroundColor),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.h , vertical:  9.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Padding(
                padding: EdgeInsets.only(right: 13.h),
                child: SvgPicture.asset(imageUrl),
              ) ,
              Text(title , style: Theme.of(context).textTheme.headlineLarge,)
            ],),
            Icon(Icons.arrow_forward_ios , size:15 , color: Theme.of(context).colorScheme.onBackground,)
          ],),
      ),
    );
}
}
