import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/models/drop_down_model.dart';

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
      height: 24.h,
      width: 115.w,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.shadow,
          borderRadius: BorderRadius.all(Radius.circular(6.r))),

      child: DropdownButtonHideUnderline(

        child: DropdownButton2<DropDownModel>(
          iconStyleData: IconStyleData(
            icon: Padding(
              padding:  EdgeInsets.only(right: 10.01.w),
              child: const Icon(Icons.keyboard_arrow_down),
            ),
            iconSize: 8.r
          ),
            isExpanded: true,
            dropdownStyleData: DropdownStyleData(
              width: 115.w,
              padding:  EdgeInsets.symmetric(horizontal: 0 , vertical: 9.h),
              decoration: BoxDecoration(
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
                        offset: const Offset(0, -2))
                  ]
              ),
              elevation: 8,
            ),

            menuItemStyleData:  MenuItemStyleData(
                height: 26.h,
                padding: EdgeInsets.only(left: 10.w),
                selectedMenuItemBuilder: (context , child){
                  return Container(
                    width: 150.w,
                    height: 26.h,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.shadow,
                        borderRadius: BorderRadius.all(Radius.circular(5.r))
                    ),
                    margin: EdgeInsets.only(left: 5.w,right: 5.w),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          dropDownValue?.title??"",
                        ),
                      ],
                    ),
                  );
                }
            ),
            style:  Theme.of(context).textTheme.displayLarge,
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
                    padding:  EdgeInsets.only(left: 7.w),
                    child: Text(
                      item.title,
                      style:Theme.of(context).textTheme.headlineMedium,
                      maxLines: 1,
                    ),
                  );
                },
              ).toList();
            },

            items: widget.itemList.map((DropDownModel item) => DropdownMenuItem<DropDownModel>(
                value: item,
                child: Text(
                  item.title,
                  style: Theme.of(context).textTheme.displayLarge,
                ))).toList()),
      ),
    );
  }
}
