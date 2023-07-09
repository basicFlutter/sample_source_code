import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/models/drop_down_model.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/icon_gradient.dart';



class SimpleDropDown extends StatefulWidget {
  SimpleDropDown({Key? key , required this.itemList , required this.onSelected}) : super(key: key);
  final List<DropDownModel> itemList;
  Function(DropDownModel) onSelected;
  @override
  State<SimpleDropDown> createState() => _SimpleDropDownState();
}

class _SimpleDropDownState extends State<SimpleDropDown> {
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
      height: 45.h,

      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light ? AppColors.input : AppColors.inputDark,
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
        boxShadow: [

          Theme.of(context).brightness == Brightness.light ?AppColors.inputShadow :AppColors.inputShadowDark

        ],

      ),

      child: DropdownButtonHideUnderline(

        child: DropdownButton2<DropDownModel>(
            iconStyleData: IconStyleData(
                icon: Padding(
                  padding:  EdgeInsets.only(right: 20.w),
                  child:  IconGradient(
                    icon:  Icons.keyboard_arrow_down ,
                    iconSize: 20.r,
                  )
                ),
                iconSize: 17.r
            ),
            isExpanded: true,

            dropdownStyleData: DropdownStyleData(
              offset: Offset(0, -5.h),
              maxHeight: 180.h,

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
                height: 40.h,
                padding: EdgeInsets.only(left: 10.w,),
                selectedMenuItemBuilder: (context , child){
                  return Container(

                    height: 40.h,
                    decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.light ? AppColors.input : AppColors.inputDark,
                        borderRadius: BorderRadius.all(Radius.circular(5.r))
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 15.w),
                    padding: EdgeInsets.only(left: 10.w),
                    child: Row(
                      children: [

                        CustomText(
                          text: dropDownValue?.title??"",
                          textStyle: Theme.of(context).textTheme.labelSmall,
                          textFontWight: TextFontWight.medium,
                          // textColor: Theme.of(context).primaryColor,
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
              widget.onSelected(value!);
            },


            value: dropDownValue,
            underline: const SizedBox(),

            /// title selected
            selectedItemBuilder: (context) {
              return widget.itemList.map(
                    (item) {
                  return Container(
                      alignment: AlignmentDirectional.centerStart,

                      padding:  EdgeInsets.only(left: 5.w),


                      child: CustomText(
                        text: item.title,
                        textFontWight: TextFontWight.medium,
                        textStyle: Theme.of(context).textTheme.labelSmall,
                        textColor: Theme.of(context).primaryColor


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

                Container(
                  height: 40.h,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: item.title,
                        textStyle: Theme.of(context).textTheme.labelSmall,
                        textFontWight: TextFontWight.medium,
                      ),
                    ],
                  ),
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
