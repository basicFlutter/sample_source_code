import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/widgets/custom_space.dart';


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
        height: 172.h,
        decoration: BoxDecoration(
            color:Theme.of(context).backgroundColor,
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimensions.buttonRadius))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cardImage(),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 6.h , vertical: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _price(context) ,
                  CustomVerticalSpace(space: 5.h,),
                  _name(context),
                  CustomVerticalSpace(space: 4.h,),
                  _date(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _date(BuildContext context) => Center(child: Text('03 Jun 2020' , style: Theme.of(context).textTheme.displayMedium,));

  Widget _name(BuildContext context) {
    return SizedBox(
                  height: 35.h,
                  width: 125.w,
                  child: Text('Mileage:10423 km ' ,
                      overflow: TextOverflow.fade,
                      style:Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground
                  )),
                );
  }

  Widget _price(BuildContext context) {
    return Text('\$43,000' , style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Theme.of(context).primaryColor
                ),);
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
