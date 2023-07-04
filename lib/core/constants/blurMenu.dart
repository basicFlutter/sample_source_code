import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/constants/blurMenuItem.dart';

class BlurMenu extends StatelessWidget {
  final double width;
  final double height;
  final double itemHeight;
  final List<BlurMenuItem> items;
  final void Function(BlurMenuItem item) onSelect;
  const BlurMenu(
      {Key? key,
        required this.items,
        required this.onSelect,
        required this.width,
        required this.height,
        this.itemHeight = 64})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        boxShadow: [
          Theme.of(context).brightness == Brightness.light ? AppColors.boxShadowMenu : AppColors.boxShadowMenuDark
        ],
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: BackdropFilter(

            filter: ImageFilter.blur(
              sigmaX: 3.0,
              sigmaY: 3.0,
            ),
            child: Material(
              type: MaterialType.transparency,

              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light ? Colors.white.withOpacity(0.8) : AppColors.whiteDark.withOpacity(0.8),

                ),
                width: width,

                child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.w , vertical: 15.h),
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemExtent: itemHeight,
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context , index){
                          return InkWell(
                            onTap: (){
                              onSelect(items[index]);
                            },
                            child: Padding(
                              padding:  EdgeInsets.only(bottom: index == 0 ? 10.h :0),
                              child: items[index],
                            ),
                          );
                        })
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
}