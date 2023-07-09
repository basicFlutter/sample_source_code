import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/models/drop_down_model.dart';

import '../constants/app_colors.dart';
import 'custom_text.dart';


class CustomDropDown extends StatefulWidget {
  const CustomDropDown({Key? key , required this.itemList}) : super(key: key);
  final List<DropDownModel> itemList;
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  DropDownModel? dropDownValue ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropDownValue =  widget.itemList[0];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.h,
      width: 125.w,

      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.all(Radius.circular(6.r))),

      child: DropdownButtonHideUnderline(

        child: DropdownButton2<DropDownModel>(
          iconStyleData: IconStyleData(
            icon: Padding(
              padding:  EdgeInsets.only(right: 10.01.w),
              child:  Icon(Icons.keyboard_arrow_down ,
              color: Theme.of(context).primaryColor,
              ),
            ),
            iconSize: 17.r
          ),
            isExpanded: true,
            dropdownStyleData: DropdownStyleData(
              width: 125.w,
              offset: Offset(0, -5.h),
              padding:  EdgeInsets.symmetric(horizontal: 0 , vertical: 9.h),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(2, 5),
                        color: Theme.of(context).brightness == Brightness.light ? AppColors.elevationDropDown : AppColors.elevationDropDownDark,
                        spreadRadius: 0,
                        blurRadius: 20
                    ),
                    BoxShadow(
                        color: Theme.of(context).colorScheme.primary,
                        spreadRadius: 0.1,
                        offset: const Offset(0, 4))
                  ]
              ),
              elevation: 8,
            ),

            menuItemStyleData:  MenuItemStyleData(
                height: 35.h,

                padding: EdgeInsets.only(left: 10.w,top: 0),
                selectedMenuItemBuilder: (context , child){
                  return Container(
                    width: 150.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.light ? AppColors.input : AppColors.inputDark,
                        borderRadius: BorderRadius.all(Radius.circular(5.r))
                    ),
                    margin: EdgeInsets.only(left: 5.w,right: 5.w),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        CustomText(
                            text: dropDownValue?.title??"",
                            textStyle: Theme.of(context).textTheme.displayLarge,
                          textFontWight: TextFontWight.medium,
                          textColor: Theme.of(context).primaryColor,
                        )

                      ],
                    ),
                  );
                }
            ),
            style:  Theme.of(context).textTheme.displaySmall,
            onChanged: (value) {
              setState(() {
                dropDownValue = value!;
              });
            },

           value: dropDownValue,
            underline: const SizedBox(),

            /// title selected
            selectedItemBuilder: (context) {
              return widget.itemList.map(
                    (item) {
                  return Container(
                    alignment: AlignmentDirectional.centerStart,

                    padding:  EdgeInsets.only(left: 10.w),

                    child: CustomText(
                      textFontWight: TextFontWight.regular,
                      text: item.title, textStyle: Theme.of(context).textTheme.displayMedium,

                    )

                    // Text(
                    //   item.title,
                    //   style:Theme.of(context).textTheme.displayMedium?.copyWith(
                    //       fontVariations: [
                    //         FontVariation(
                    //             'wght',
                    //             600
                    //         )
                    //       ]
                    //   ),
                    //   maxLines: 1,
                    // ),
                  );
                },
              ).toList();
            },

            items: widget.itemList.map((DropDownModel item) => DropdownMenuItem<DropDownModel>(
                value: item,
                child:

                CustomText(
                  text: item.title,
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  textFontWight: TextFontWight.regular,
                )

                // Text(
                //   item.title,
                //   style: Theme.of(context).textTheme.displayMedium?.copyWith(
                //       fontVariations: [
                //         FontVariation(
                //             'wght',
                //             400
                //         )
                //       ]
                //   ),
                // )
            )).toList()),
      ),
    );
  }
}
