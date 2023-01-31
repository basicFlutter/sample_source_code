import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/widgets/small_body_text.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_images.dart';

class InventoryItemWidget extends StatelessWidget {
  const InventoryItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h , vertical: 6.w ),
      child: Container(
        width: 125.w,
        height: 122.h,
        decoration: BoxDecoration(
            color:Theme.of(context).backgroundColor,
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimensions.buttonRadius))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cardImage() ,
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 6.h , vertical: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\$43,000' , style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).primaryColor
                  ),) ,
                  
                  const SmallBodyText(text: 'Mileage:15734 km')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cardImage() {
    return SizedBox(
            height: 80.5.h,
            width: 124.w,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppDimensions.buttonRadius),
                    topLeft: Radius.circular(AppDimensions.buttonRadius)),
                child: Image.asset(AppImages.test , fit: BoxFit.cover,)));
  }
}
