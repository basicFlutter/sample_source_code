import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/widgets/custom_card_detail.dart';

class MainDetailWidget extends StatelessWidget {
  const MainDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 358.w,
      height: 192.h,
      child: Wrap(
        spacing: 14.w,
        runSpacing: 20.h,
        children: [
          CustomCardDetail(
            title: "YEAR",
            iconSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.calenderIcon : AppImages.calenderIconDark,
            value: "2014",
          ),
          CustomCardDetail(
            title: "MAKE",
            iconSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.makeIcon : AppImages.makeIconDark,
            value: "Toyota Camry",
          ),
          CustomCardDetail(
            title: "MODEL",
            iconSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.modelIcon : AppImages.modelIconDark,
            value: "M550L",
          ),
          CustomCardDetail(
            title: "ODOMETER",
            iconSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.odometerIcon : AppImages.odometerIconDark,
            value: "321,5555 KM",
          ),
          CustomCardDetail(
            title: "TRANSMISSION",
            iconSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.transmissionIcon : AppImages.transmissionIconDark,
            value: "5Speed Manual",
          ),
          CustomCardDetail(
            title: "BODY STYLE",
            iconSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.bodyStyleIcon : AppImages.bodyStyleIconDark,
            value: "Sedan",
          ),

        ],
      ),
    );
  }
}
