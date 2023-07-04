import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/widgets/round_corner_button.dart';

class BillOfSaleCustomerBottomNavigation extends StatefulWidget {
  const BillOfSaleCustomerBottomNavigation({Key? key}) : super(key: key);

  @override
  State<BillOfSaleCustomerBottomNavigation> createState() => _BillOfSaleCustomerBottomNavigationState();
}

class _BillOfSaleCustomerBottomNavigationState extends State<BillOfSaleCustomerBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      height: 46.h,
      child: Row(
        children: [
          RoundCornerButton(
            height: 46.h,
            width: 173.w,
            onTap: (){

            },
            title: "Preview",
          )
        ],
      ),
    );
  }
}
