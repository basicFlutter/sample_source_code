import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/models/drop_down_model.dart';
import 'package:new_panel/core/widgets/custom_dropdown.dart';
import 'package:new_panel/core/widgets/custom_tag.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/search_inventory.dart';

class SummeryInventory extends StatelessWidget {
  SummeryInventory({Key? key}) : super(key: key);
  String dropDownValue = 'Inventory';
  List<DropDownModel> items = [
    DropDownModel(title: "Inventory"),
    DropDownModel(title: "Coming Soon"),
    DropDownModel(title: "Active Inventory"),
    DropDownModel(title: "Pending"),
    DropDownModel(title: "Appraisal"),
    DropDownModel(title: "Delete"),
  ];
  TextEditingController inventorySearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      width: 358.w,
      //  color: Colors.green,
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            spacing: 8.w,
            runSpacing: 7.5.h,
            children: [
              CustomTag(
                  tagString: 'Total: 5900',
                  width: 90.w,
                  onTap: () {},
                  icon: SvgPicture.asset(
                    "assets/images/total_icon.svg" ,
                    width: 12.r ,
                    height: 12.r,
                    color:  Theme.of(context).colorScheme.primary,
                  )
              ),
              CustomTag(
                tagString: 'Active: 3200',
                width: 91.5.w,
                onTap: () {},
                icon:  Icon(
                  Icons.circle,
                  color: Colors.lightGreenAccent,
                  size: 8.r,
                ),
              ),
              CustomTag(
                tagString: 'Total Retail Price: \$32,700,557',
                onTap: () {},
                width: 159.5.w,
                icon: Icon(
                  Icons.payments,
                  size: 12.r,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              CustomTag(
                  tagString: 'Total Purchase Price: \$32,270,000',
                  onTap: () {},
                  width: 177.5.w,
                  icon: Icon(
                    Icons.price_change,
                    size: 12.r,
                    color: Theme.of(context).colorScheme.primary,
                  )),
              CustomTag(
                  tagString: 'Deactivate: 5000',
                  width: 107.5.w,
                  onTap: () {},
                  icon: Icon(
                    Icons.circle,
                    size: 8.r,
                    color: Theme.of(context).colorScheme.surface,
                  )),
            ],
          ),
          SizedBox(
            height: 11.h,
          ),
          Row(
            children: [
               Expanded(
                 child:  Row(
                children: [
                  SvgPicture.asset(
                    AppImages.filter,
                    width: 24.r,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  SearchInventory(
                    inventorySearchController:inventorySearchController ,
                    onTapPrefixIcon: (){

                    },
                    onTapSuffixIcon: (){

                    },
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),),
              CustomDropDown(
                itemList: items,
              )
            ],
          ),
        ],
      ),
    );
  }
}
