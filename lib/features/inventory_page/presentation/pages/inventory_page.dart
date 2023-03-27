import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/widgets/custom_tabBar.dart';
import 'package:new_panel/core/widgets/custom_tag.dart';
import 'package:new_panel/core/widgets/dialog_close_button.dart';

import '../../../../core/widgets/custom_body.dart';
import '../widgets/inventory_list.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  TextEditingController searchbarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBody(
        searchbarController: searchbarController,
        body: Column(
          children: [
            _tags(),
            SizedBox(height: 6.h,),
            _filterOptions(context),
            SizedBox(
              height: 5.h,
            ),
            const Expanded(child: InventoryList())
          ],
        ),
      ),
    );
  }

  Widget _filterOptions(BuildContext context) {
    return SizedBox(
      height: 42.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppImages.filter,
                width: 35,
              ),
              SizedBox(
                width: 15.w,
              ),
              SvgPicture.asset(
                AppImages.search,
                width: 35,
              ),
              SizedBox(
                width: 15.w,
              ),
            ],
          ),
          GestureDetector(
            onTap: (){
              showDialog(context: context , builder: (context){
                return AlertDialog(
                  insetPadding: EdgeInsets.all(10),
                  contentPadding: EdgeInsets.all(10),
                  content: _dialogContent(context),
                  shape:   const RoundedRectangleBorder(

                      borderRadius: BorderRadius.all(Radius.circular(8))),

                ) ;
              }) ;
            },
            child: Container(
                height: 40.h,
                width: 140.w,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.shadow,
                    borderRadius: BorderRadius.all(Radius.circular(6.r))),
                child: DropdownButton2(
                  underline: const SizedBox(),
                  items: const [],
                  barrierColor: Theme.of(context).colorScheme.secondary,
                  hint: Text(
                    'Inventory',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                )),
          )
          // SvgPicture.asset(AppImages.more , width: 35,  ) ,
        ],
      ),
    );
  }

  Widget _dialogContent(BuildContext context) {
    return SizedBox(
      width: 200.w,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
        const DialogCloseButton() ,
          _dialogItem(context, false   , 'Appraisal'),
          _dialogItem(context, true  , 'Coming soon' ),
          _dialogItem(context, false  , 'Active Inventory' ),
          _dialogItem(context, false  , 'pending' ),
          _dialogItem(context, false  , 'Delete' ),

          SizedBox(height: 10.h,)
      ],),
    );
  }

  Widget _dialogItem(BuildContext context , bool isSelected , String itemTitle) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              color:isSelected ? Theme.of(context).colorScheme.surfaceTint : Colors.transparent),
          child: Padding(
            padding: EdgeInsets.only(right: 100.w , left: 6.w , top: 5.h , bottom: 5.h),
            child: Text(itemTitle ,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.displayLarge, ),
          )),
    );
  }

  Widget _tags() {
    return SizedBox(
      height: 70.h,
      child: Wrap(
        alignment: WrapAlignment.center,
        direction: Axis.horizontal,
        children: [
          CustomTag(tagString: 'Total: 900\$', onTap: () {}),
          CustomTag(tagString: 'Active: 320\$', onTap: () {}),
          CustomTag(
              tagString: 'Total Retail Price: \$32,700,557', onTap: () {}),
          CustomTag(tagString: 'Total Purchase Price: \$322,700', onTap: () {}),
          CustomTag(tagString: 'Deactivate: 500', onTap: () {}),
        ],
      ),
    );
  }
}
