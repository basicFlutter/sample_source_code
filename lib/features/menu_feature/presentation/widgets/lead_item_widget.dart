import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/widgets/custom_space.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_images.dart';

class LeadItemWidget extends StatelessWidget {
  const LeadItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return item(context);
  }

  Widget item(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      child: Container(
        width: 125.w,
        height: 160.h,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimensions.buttonRadius)),
            color: Theme.of(context).colorScheme.background),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              _userPicture(),
              _userName(context),
              CustomSpace(space: 5.h,) ,
              _type(context),
              CustomSpace(space: 10.h,) ,
            ],),

            _date(context)
          ],
        ),
      ),
    );
  }

  Widget _type(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Icon(
                Icons.directions_car_filled,
                size: 20,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              Text('Car Finder',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground))
            ],
          );
  }

  Widget _userName(BuildContext context) {
    return Text('Savannah Nguyen',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground));
  }

  Widget _userPicture() {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            child: SizedBox(
              width: 60.w,
              height: 60.h,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(AppDimensions.circle)),
                child: Image.asset(
                  AppImages.profileTest,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
  }

  Widget _date(BuildContext context) => Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text(
        '03 Jun 2020',
        style: Theme.of(context).textTheme.displayMedium,
      ),
          ));
}
