import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/models/drop_down_model.dart';
import 'package:new_panel/core/widgets/circular_button.dart';
import 'package:new_panel/core/widgets/custom_dropdown.dart';
import 'package:new_panel/core/widgets/custom_tag.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/round_corner_button.dart';
import 'package:new_panel/features/filter_inventory_page/presentation/pages/filter_page.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/filter_list_item.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/search_inventory.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/selected_state_widget.dart';

import 'package:new_panel/main.dart';

class SummeryInventory extends StatefulWidget {
  SummeryInventory({Key? key , required this.filterList , required this.onTapDoneButton}) : super(key: key);
  List<String> filterList ;
  GestureTapCallback onTapDoneButton;




  @override
  State<SummeryInventory> createState() => SummeryInventoryState();
}

class SummeryInventoryState extends State<SummeryInventory> {
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
   bool inSelectedMode = false;
   List<int> vehicleIdSelected = [];

  void changeVisibility() async{
    if(visibleSearch == false){
      visibleSearch = true;
    }else{
      visibleSearch = false;
    }
    setState(() {
    });

  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(

      constraints: BoxConstraints(
          minHeight: 110.h,
      ),

      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child:
     inSelectedMode ? SelectedStateWidget(
        vehicleIdListSelected: vehicleIdSelected,
        onTapDoneButton: (){
          vehicleIdSelected.clear();
          inSelectedMode = false;
          widget.onTapDoneButton();
          setState(() {

          });
        },
      ) :
      Column(
        children: [
          SizedBox(
            height: 11.h,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            spacing: 8.w,
            runSpacing: 7.5.h,
            children: [
              CustomTag(
                  tagString: 'Total Purchase Price: \$32,270,000',
                  onTap: () {
                  },
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
                  )
              ),
              CustomTag(
                tagString: 'Active: 3200',
                width: 91.5.w,
                onTap: () {},
                icon:  Icon(
                  Icons.circle,
                  color: Theme.of(context).brightness == Brightness.light ? AppColors.active : AppColors.activeDark,
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
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                child:  Row(
                  children: [
                    CircularButton(
                        onTap: () async {
                          List<String>? filterParams = await Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  FilterPage()));
                          if(filterParams != null && filterParams.isNotEmpty){
                            widget.filterList = filterParams;
                            setState(() {});
                          }
                        },
                        radius: 28.r,
                      child: Icon(MdiIcons.filterOutline,size: 18.r,
                        shadows: <Shadow>[
                          Shadow(
                            offset: const Offset(0, 1),
                            blurRadius: 1,
                            color: Colors.black.withOpacity(0.25),
                          ),
                        ],
                        color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark
                        ,),
                    ),
                    SizedBox(width: 11.w),
                    CircularButton(
                        onTap: (){
                          searchIsOpen = searchIsOpen ? false :true ;

                          changeVisibility();
                        },
                        radius: 28.r,
                        // padding: EdgeInsets.all(7.r),
                     child: Icon(Icons.search,size: 18.r,
                       shadows: <Shadow>[
                         Shadow(
                           offset: Offset(0, 1),
                           blurRadius: 1,
                           color: Colors.black.withOpacity(0.25),
                         ),
                       ],
                     color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark
                       ,),
                        // child: SvgPicture.asset("assets/images/search_icon.svg" ,
                        //   color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,)
                        //
                    ),

                    SizedBox(width: 11.w),

                    RoundCornerButton(
                      width: 106.w,
                      height: 28.h,
                      radius: 14.r,
                      title: "Add Inventory",
                      icon: Icons.add,
                      textStyle: Theme.of(context).textTheme.displayMedium,
                      textFontWight: TextFontWight.regular,
                      onTap: (){

                      },

                    )


                  ],
                ),),
              CustomDropDown(
                itemList: items,
              )
            ],
          ),
          if(visibleSearch)
          SizedBox( height: 10.h),

             if(visibleSearch)
             SearchInventory(
               fieldHint: "Inventory Search",
               searchbarController: searchController,
               onTapSuffix: (){
                 searchIsOpen = searchIsOpen ? false :true ;
                 if(searchIsOpen){
                   visibleSearch = false;
                 }else{
                   visibleSearch = true;
                 }
                 changeVisibility();
               },
             ),
          if(widget.filterList.isNotEmpty)
          SizedBox( height: 15.h),
          if(widget.filterList.isNotEmpty)
          SizedBox(
            width: screenSize.width,
            height: 40.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.filterList.length,
                // padding: EdgeInsets.only(bottom: 14.h),
                itemBuilder: (context , index){

                return FilterListItem(
                  filterName: widget.filterList[index],
                  onTap: (){
                    widget.filterList.removeAt(index);
                   // logger.w("click on filter ${widget.filterList[index]}");
                    setState(() {

                    });
                  },
                );

            }),

          ),
        ],
      ),
    );
  }
}
