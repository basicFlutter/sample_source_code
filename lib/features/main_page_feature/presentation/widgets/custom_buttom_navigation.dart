import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

class CustomBottomNavigation extends StatelessWidget {
  CustomBottomNavigation({Key? key , required this.indexSelected , required this.onSelected}) : super(key: key);
  final int indexSelected;
  Function(int index) onSelected;
  final double itemSelectedSizeWidth = 70.w;
  final double itemSelectedSizeHeight = 60.w;
  final double borderRadius = 12.r;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 65.h,
      margin: EdgeInsets.only(bottom: 4.h , left: 16.w , right: 16.w),
      decoration:  BoxDecoration(
          color:Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          borderRadius:  BorderRadius.all(Radius.circular(15.r)),
      ),
      child: Row(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              onSelected(0);
            },
            child: Container(
              width: 89.5.w,
             // color: Colors.red,

              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width:itemSelectedSizeWidth,
                    height: itemSelectedSizeHeight,
                    // decoration: BoxDecoration(
                    //     color: indexSelected == 0 ?  Theme.of(context).primaryColor : Colors.transparent,
                    //     borderRadius: BorderRadius.all(Radius.circular(15.r))
                    // ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width:23.r,
                          height: 23.r,
                          // padding: EdgeInsets.all(2.r),
                          child: SvgPicture.asset("assets/images/bottomNavigation/home_icon.svg",
                            color: indexSelected == 0 ? Theme.of(context).bottomNavigationBarTheme.selectedIconTheme?.color : Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme?.color,
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        CustomText(text: "Home",
                            textStyle: indexSelected == 0 ? Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle :
                            Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle
                        )

                      ],
                    ),
                  ),
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

              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width:itemSelectedSizeWidth,
                    height: itemSelectedSizeHeight,
                    decoration: BoxDecoration(
                        color: indexSelected == 1 ?  Theme.of(context).primaryColor : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(15.r))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 28.r,
                          height: 28.r,
                          padding: EdgeInsets.symmetric(vertical: 4.r),
                          child: SvgPicture.asset("assets/images/bottomNavigation/inventory_icon.svg",
                            color: indexSelected == 1 ? Theme.of(context).bottomNavigationBarTheme.selectedIconTheme?.color : Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme?.color,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),

                        CustomText(text: "Inventory", textStyle: indexSelected == 1 ? Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle :Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle)

                      ],
                    ),
                  ),
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
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width:itemSelectedSizeWidth,
                    height: itemSelectedSizeHeight,
                    decoration: BoxDecoration(
                        color: indexSelected == 2 ?  Theme.of(context).primaryColor : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(15.r))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 28.r,
                          height: 28.r,
                          padding: EdgeInsets.symmetric(vertical: 1.r,horizontal: 2.r),
                          child: SvgPicture.asset("assets/images/bottomNavigation/customer_icon.svg",
                            color: indexSelected == 2 ? Theme.of(context).bottomNavigationBarTheme.selectedIconTheme?.color : Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme?.color,

                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomText(text: "Customers", textStyle: indexSelected == 2 ? Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle :Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle)

                      ],
                    ),
                  ),
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
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width:itemSelectedSizeWidth,
                    height: itemSelectedSizeHeight,
                    decoration: BoxDecoration(
                        color: indexSelected == 3 ?  Theme.of(context).primaryColor : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(15.r))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Container(
                          width: 30.r,
                          height: 30.r,
                          padding: EdgeInsets.symmetric(vertical: 5.95.r,horizontal: 0),

                          child: SvgPicture.asset("assets/images/bottomNavigation/handshake_hands_icon.svg",
                            color: indexSelected == 3 ? Theme.of(context).bottomNavigationBarTheme.selectedIconTheme?.color : Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme?.color,

                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),

                        CustomText(text: "Deals", textStyle: indexSelected == 3 ? Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle :Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle)

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
