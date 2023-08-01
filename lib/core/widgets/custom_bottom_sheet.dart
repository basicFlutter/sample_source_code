import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_container.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({Key? key , required this.child}) : super(key: key);
  final Widget child;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SizedBox(
        width: 1.sw,
        child: Column(
          children: [
            CustomContainer(
                width:1.sw,
                height: 44.55.h,
              borderRadius: BorderRadius.only(topRight: Radius.circular(36.r) , topLeft: Radius.circular(36.r)) ,
              color: Theme.of(context).brightness == Brightness.light ? AppColors.primary3 : AppColors.primary3Dark,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 34.w,
                    height: 2.h,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),


            ),
            SizedBox(
              height: 17.45.h,
            ),
            widget.child
          ],

        ),

      ),
    );
  }
}
