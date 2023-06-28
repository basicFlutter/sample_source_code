import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/features/inventory_page/domain/entities/inventory_entity.dart';
import 'package:new_panel/features/inventory_page/presentation/manager/inventory_bloc.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/new_inventory_item.dart';
import 'package:new_panel/main.dart';

class NewInventoryList extends StatefulWidget {
  const NewInventoryList({Key? key , required this.inventories }) : super(key: key);
 final List<InventoryEntity> inventories ;



  @override
  State<NewInventoryList> createState() => _NewInventoryListState();
}

class _NewInventoryListState extends State<NewInventoryList> {

  bool isSelectedMode = false;
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

                }else{

                }
                logger.e(vehicleID);
              },
              inventoryEntity: widget.inventories[index],
              onLongPress: (vehicleId){
                isSelectedMode = !isSelectedMode;
                BlocProvider.of<InventoryBloc>(context).add(ChangeSelectModeEvent(isSelectMode: isSelectedMode));
                // setState(() {
                //
                // });
              },

              onTap: (vehicleId){

              },
              isSelectedMode: isSelectedMode,
            );

      }),
    );
  }
}
