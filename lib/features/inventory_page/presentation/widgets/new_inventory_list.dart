import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/features/inventory_detail_page/presentation/pages/inventory_detail.dart';
import 'package:new_panel/features/inventory_page/domain/entities/inventory_entity.dart';
import 'package:new_panel/features/inventory_page/presentation/manager/inventory_bloc.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/new_inventory_item.dart';
import 'package:new_panel/features/veicle_detail_feature/presentation/pages/vehicle_detail_page.dart';

import 'package:new_panel/main.dart';
import 'package:page_transition/page_transition.dart';

class NewInventoryList extends StatefulWidget {
   NewInventoryList({Key? key , required this.inventories , required this.selectedListVehicle , required this.cancelSelectedMode}) : super(key: key);
 final List<InventoryEntity> inventories ;
 Function(List<int> itemIdSelected) selectedListVehicle;
 Function() cancelSelectedMode;



  @override
  State<NewInventoryList> createState() => NewInventoryListState();
}

class NewInventoryListState extends State<NewInventoryList> {

  bool isSelectedMode = false;
  List<int> itemSelectedIdList = [];
  @override
  Widget build(BuildContext context) {

    return Container(
      width: 1.sw,

      constraints: BoxConstraints(
        maxHeight:  564.h,
        minHeight: 457.h
      ),

      // constraints: widget.summeryIsExpandedFromFilter && widget.summeryIsExpandedFromSearch ? BoxConstraints(
      //   maxHeight:  457.h , // in ok hast vali bayad state avaz beshe b delay
      // ):widget.summeryIsExpandedFromSearch ? BoxConstraints(
      //   maxHeight:  510.h,
      // ):BoxConstraints(
      //   maxHeight:  564.h,
      // ),

      child: ListView.builder(
          itemCount: widget.inventories.length,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 100.h,top: 7.h),

          itemBuilder: (context , index){
            return  NewInventoryItem(
              selectedThisVehicle: (isSelected , vehicleID){

                if(isSelected){
                  itemSelectedIdList.add(vehicleID);

                }else{
                  itemSelectedIdList.removeWhere((element) => element == vehicleID);

                }
                widget.selectedListVehicle(itemSelectedIdList);

               // logger.e(itemSelectedIdList);

              },
              inventoryEntity: widget.inventories[index],
              onLongPress: (vehicleId){
                isSelectedMode = !isSelectedMode;
                if(isSelectedMode){
                  widget.selectedListVehicle(itemSelectedIdList);
                }else{
                  itemSelectedIdList.clear();
                 widget.cancelSelectedMode();
                }
                BlocProvider.of<InventoryBloc>(context).add(ChangeSelectModeEvent(isSelectMode: isSelectedMode));


                // setState(() {
                //
                // });
              },

              onTap: (vehicleId){

                logger.w(vehicleId);
               // InventoryDetailPage
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 200),
                      child:   VehicleDetailPage(
                        id: vehicleId,
                      )
                  ),
                );

              },
              isSelectedMode: isSelectedMode,
            );

      }),
    );
  }
}
