import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/models/drop_down_model.dart';
import 'package:new_panel/core/widgets/circular_button.dart';
import 'package:new_panel/core/widgets/custom_dropdown.dart';
import 'package:new_panel/core/widgets/custom_tag.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/icon_gradient.dart';
import 'package:new_panel/core/widgets/round_corner_button.dart';
import 'package:new_panel/features/inventory_page/presentation/manager/inventory_bloc.dart';
import 'package:new_panel/features/filter_inventory_page/presentation/pages/filter_page.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/filter_list_item.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/search_inventory.dart';
import 'package:new_panel/main.dart';

class SummeryInventory extends StatefulWidget {
  SummeryInventory({Key? key , required this.filterList ,required this.changeVisibilitySearch ,required this.filterChanged}) : super(key: key);
  List<String> filterList ;
  Function(List<String>) filterChanged;
  Function(bool) changeVisibilitySearch;

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
      await Future.delayed(const Duration(milliseconds:120));
      visibleSearch = true;
    }else{
      visibleSearch = false;
    }

    setState(() {

    });

  }

  double getHeight(){
    double height = 110.h;
    if(searchIsOpen && widget.filterList.isEmpty){
      height = 163.h;
    }else if(searchIsOpen && widget.filterList.isNotEmpty){
      height = 214.h;
    }else if(searchIsOpen == false && widget.filterList.isNotEmpty){
      height = 161.h;
    }

    return height;


  }


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(
          milliseconds: 150
      ),
      height: getHeight(),

      // constraints: BoxConstraints(
      //     minHeight: 110.h,
      //     maxHeight: 221.h
      // ),
      // width: 358.w,
      // color: Colors.green,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
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
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                child:  Row(
                  children: [


                    CircularButton(
                        onTap: () async {
                         List<String> filterList = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FilterPage()));
                         // BlocProvider.of<InventoryBloc>(context).add(ChangeSelectModeEvent(isSelectMode: widget.filterList.isNotEmpty));
                         widget.filterChanged(filterList);
                         setState(() {

                         });

                        },
                        radius: 28.r,
                        // padding: EdgeInsets.only(top: 3.r),
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
                          // if(searchIsOpen){
                          //   visibleSearch = false;
                          // }else{
                          //   visibleSearch = true;
                          // }
                         // BlocProvider.of<InventoryBloc>(context).add(ChangeSelectModeEvent(isSelectMode: widget.filterList.isNotEmpty));
                          widget.changeVisibilitySearch(searchIsOpen);
                          changeVisibility();
                          // setState(() {
                          //
                          // });


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
              child: SizedBox( height: 10.h)),

          Visibility(
              visible: visibleSearch,
              child: SearchInventory(
                fieldHint: "Inventory Search",
                searchbarController: searchController,
                onTapSuffix: (){
                  searchIsOpen = searchIsOpen ? false :true ;
                  if(searchIsOpen){
                    visibleSearch = false;

                  }else{
                    visibleSearch = true;

                  }
                  widget.changeVisibilitySearch(searchIsOpen);
                  changeVisibility();
                  setState(() {

                  });
                },
              )

          ),

          Visibility(
              visible: widget.filterList.isNotEmpty,
              child: SizedBox( height: 15.h)),

          Visibility(
              visible: widget.filterList.isNotEmpty,
              child: SizedBox(
                width: screenSize.width,
                height: 36.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.filterList.length,
                    itemBuilder: (context , index){

                    return FilterListItem(
                      filterName: widget.filterList[index],
                      onTap: (){
                        logger.w("click on filter ${widget.filterList[index]}");
                      },
                    );

                }),

          )),

          // Visibility(
          //     visible: visibleSearch,
          //     child: SizedBox( height: 15.h)),
        ],
      ),
    );
  }
}
