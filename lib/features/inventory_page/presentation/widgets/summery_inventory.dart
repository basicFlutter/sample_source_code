import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/models/drop_down_model.dart';
import 'package:new_panel/core/widgets/circular_button.dart';
import 'package:new_panel/core/widgets/custom_dropdown.dart';
import 'package:new_panel/core/widgets/custom_tag.dart';
import 'package:new_panel/core/widgets/round_corner_button.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/search_inventory.dart';

class SummeryInventory extends StatefulWidget {
  SummeryInventory({Key? key}) : super(key: key);

  @override
  State<SummeryInventory> createState() => _SummeryInventoryState();
}

class _SummeryInventoryState extends State<SummeryInventory> {
  String dropDownValue = 'Inventory';

  TextEditingController searchController = TextEditingController();

  List<DropDownModel> items = [
    DropDownModel(title: "Inventory"),
    DropDownModel(title: "Coming Soon"),
    DropDownModel(title: "Active Inventory"),
    DropDownModel(title: "Pending"),
    DropDownModel(title: "Appraisal"),
    DropDownModel(title: "Delete"),
  ];

  TextEditingController inventorySearchController = TextEditingController();

  bool searchIsOpen = false;
  bool visibleSearch = false;

  void changeVisibility() async{

    if(visibleSearch == false){
      await Future.delayed(const Duration(milliseconds: 150));
      visibleSearch = true;
    }else{
      visibleSearch = false;
    }

    setState(() {

    });

  }


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 150
      ),
      height: searchIsOpen ? 159.h :106.h,

      constraints: BoxConstraints(
        minHeight: 110.h,
        maxHeight: 159.h
      ),
      // width: 358.w,
      // color: Colors.green,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
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
                  tagString: 'Total Purchase Price: \$32,270,000',
                  onTap: () {},
                  width: 177.5.w,
                  icon: Icon(
                    Icons.price_change,
                    size: 12.r,
                    //   color: Theme.of(context).colorScheme.primary,
                  )),
              CustomTag(
                tagString: 'Total Retail Price: \$32,700,557',
                onTap: () {},
                width: 159.5.w,
                icon: Icon(
                  Icons.payments,
                  size: 12.r,
                  //  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              CustomTag(
                  tagString: 'Total: 5900',
                  width: 90.w,
                  onTap: () {},
                  icon: SvgPicture.asset(
                    "assets/images/total_icon.svg" ,
                    width: 12.r ,
                    height: 12.r,
                   // color:  Theme.of(context).colorScheme.primary,
                  )
              ),
              CustomTag(
                tagString: 'Active: 3200',
                width: 91.5.w,
                onTap: () {},
                icon:  Icon(
                  Icons.circle,
                color: Theme.of(context).brightness == Brightness.light ? AppColors.active : AppColors.activeDark,
                //  color: Colors.lightGreenAccent,
                  size: 8.r,
                ),
              ),


              CustomTag(
                  tagString: 'Deactivate: 5000',
                  width: 107.5.w,
                  onTap: () {},
                  icon: Icon(
                    Icons.circle,
                    size: 8.r,
                   color: Theme.of(context).brightness == Brightness.light ? AppColors.deActive : AppColors.deActiveDark,
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

                  CircularButton(
                      onTap: (){
                      },
                      radius: 28.r,
                      padding: EdgeInsets.all(7.r),
                      child: SvgPicture.asset("assets/images/new_filter_icon.svg",
                        color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
    )
                  ),
                       SizedBox(width: 11.w),
                  CircularButton(
                      onTap: (){
                        searchIsOpen = searchIsOpen ? false :true ;
                        if(searchIsOpen){
                          visibleSearch = false;
                        }else{
                          visibleSearch = true;
                        }
                        changeVisibility();
                        setState(() {

                        });
                      },
                      radius: 28.r,
                      padding: EdgeInsets.all(7.r),
                      child: SvgPicture.asset("assets/images/search_icon.svg" ,
                        color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,)
                  ),

                     SizedBox(width: 11.w),

                  RoundCornerButton(
                    width: 106.w,
                    height: 28.h,
                    title: "Add Inventory",
                    icon: Icons.add,

                  )


                ],
              ),),
              CustomDropDown(
                itemList: items,
              )
            ],
          ),

          Visibility(
            visible: visibleSearch,
              child: SearchInventory(
                onTapSuffixIcon: (){

                },
                onTapPrefixIcon: (){

                },
                inventorySearchController: searchController,


              )

          )

        ],
      ),
    );
  }
}
