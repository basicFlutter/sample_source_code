import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_images.dart';
import 'detail_expansion_children.dart';

class VehicleInformationView extends StatefulWidget {
  const VehicleInformationView({Key? key}) : super(key: key);

  @override
  State<VehicleInformationView> createState() => _VehicleInformationViewState();
}

class _VehicleInformationViewState extends State<VehicleInformationView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        // shrinkWrap: true ,
        // physics: NeverScrollableScrollPhysics(),
        children: [
          _cards(context),
          _fuelCard(context, AppImages.hwyFuel, 'HWY FUEL :', '9.0'),
          _fuelCard(context, AppImages.cityFuel, 'CITY FUEL :', '3.0'),
          _customExpansion(context:context, title: 'Details' , imageUrl: AppImages.details , child:DetailExpansionChildren()),
          _customExpansion(context:context, title: 'Hyper Link' , imageUrl: AppImages.hyperLink , child: Container()),
          _customExpansion(context:context, title: 'Purchase Information' , imageUrl: AppImages.purchaseInformation , child:  Container()),
          _customExpansion(context:context, title: 'Cost Information' , imageUrl: AppImages.constInformation , child:  Container()),
          _customExpansion(context:context, title: 'Receive Commission' , imageUrl: AppImages.receivedCommission , child:  Container()),
          _customExpansion(context:context, title: 'Deal' , imageUrl: AppImages.deal , child:  Container()),
          _customExpansion(context:context, title: 'History' , imageUrl: AppImages.history , child:  Container()),
        ],
      ),
    );
  }

  Widget _customExpansion({required BuildContext context , required String title , required String imageUrl , required Widget child }) {
    return Padding(
          padding:  EdgeInsets.symmetric(vertical:7.h , horizontal: 8.w),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.shadow ,
                    offset: Offset(1,1) ,
                    blurRadius: 1 ,
                    spreadRadius: 2
                  )
                ],
                color: Colors.white ),
            // height: 62.h,

            child: ExpansionTile(
              leading: SvgPicture.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
              title: Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              subtitle: Text(
                'Click for show more detail',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.surface
                ),
              ),
              children: [child],
            ),
          ),
        );
  }

  Widget _fuelCard(
      BuildContext context, String imageUrl, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 8.w),
      child: Container(
        height: 57.h,
        width: 1.sw,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).colorScheme.shadow,
                  offset: const Offset(1, 1),
                  blurRadius: 2,
                  spreadRadius: 1)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: SizedBox(
                  width: 60.w,
                  child: SvgPicture.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  )),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Container(
              width: 20.w,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.r),
                      bottomRight: Radius.circular(5.r))),
            )
          ],
        ),
      ),
    );
  }

  Widget _cards(BuildContext context) {
    return SizedBox(
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 1,
        crossAxisCount: 3,
        children: [
          _customCard(
              context: context,
              label: 'YEAR',
              value: '2022',
              icon: Icons.dangerous),
          _customCard(
              context: context,
              label: 'MAKE',
              value: '2022',
              icon: Icons.dangerous),
          _customCard(
              context: context,
              label: 'MODEL',
              value: '2022',
              icon: Icons.dangerous),
          _customCard(
              context: context,
              label: 'ODOMETER',
              value: '2022',
              icon: Icons.dangerous),
          _customCard(
              context: context,
              label: 'TRANSMISSION',
              value: '2022',
              icon: Icons.dangerous),
          _customCard(
              context: context,
              label: 'BODY STYLE',
              value: '2022',
              icon: Icons.dangerous),
        ],
      ),
    );
  }

  Widget _customCard(
      {required BuildContext context,
      required String label,
      required String value,
      required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 86.h,
        width: 110.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1, 1),
                  color: Theme.of(context).colorScheme.shadow,
                  spreadRadius: 2,
                  blurRadius: 3)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24.sp,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.labelLarge,
            )
          ],
        ),
      ),
    );
  }
}
