import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigation extends StatelessWidget {
  CustomBottomNavigation({Key? key , required this.indexSelected , required this.onSelected}) : super(key: key);
  final int indexSelected;
  Function(int index) onSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      height: 60.h,
      margin: EdgeInsets.only(left: 16.w,right: 16.w,bottom: 5.h),
      decoration:  BoxDecoration(
          color:Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(23))
      ),
      child: Row(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              onSelected(0);
            },
            child: SizedBox(
              width: 89.5.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 28.r,
                    height: 28.r,
                    padding: EdgeInsets.all(2.r),
                    child: SvgPicture.asset("assets/images/bottomNavigation/home_icon.svg",
                      color: indexSelected == 0 ? Theme.of(context).bottomNavigationBarTheme.selectedIconTheme!.color : Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme!.color,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text("Home",
                    style: indexSelected == 0 ? Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle :Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle ,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              onSelected(1);
            },
            child: SizedBox(

              width: 89.5.w,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 28.r,
                    height: 28.r,
                    padding: EdgeInsets.symmetric(vertical: 4.r),
                    child: SvgPicture.asset("assets/images/bottomNavigation/car_transport_icon.svg",
                      color: indexSelected == 1 ? Theme.of(context).bottomNavigationBarTheme.selectedIconTheme!.color : Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme!.color,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text("Inventory",
                    style: indexSelected == 1 ? Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle :Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle ,

                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              onSelected(2);
            },
            child: Container(

              width: 89.5.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 28.r,
                    height: 28.r,
                    padding: EdgeInsets.symmetric(vertical: 1.r,horizontal: 2.r),
                    child: SvgPicture.asset("assets/images/bottomNavigation/customer_icon.svg",
                      color: indexSelected == 2 ? Theme.of(context).bottomNavigationBarTheme.selectedIconTheme!.color : Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme!.color,

                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text("Customers",
                    style: indexSelected == 2 ? Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle :Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle ,

                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              onSelected(3);
            },
            child: Container(

              width: 89.5.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                    width: 28.r,
                    height: 28.r,
                    padding: EdgeInsets.symmetric(vertical: 5.95.r,horizontal: 0),

                    child: SvgPicture.asset("assets/images/bottomNavigation/handshake_hands_icon.svg",
                      color: indexSelected == 3 ? Theme.of(context).bottomNavigationBarTheme.selectedIconTheme!.color : Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme!.color,

                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),

                  Text("Deals",
                    style: indexSelected == 3 ? Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle :Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle ,

                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
