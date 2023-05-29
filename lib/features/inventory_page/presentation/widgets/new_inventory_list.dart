import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/features/inventory_page/domain/entities/inventory_entity.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/new_inventory_item.dart';
import 'package:new_panel/main.dart';

class NewInventoryList extends StatefulWidget {
  const NewInventoryList({Key? key , required this.inventories , required this.summeryIsExpanded}) : super(key: key);
 final List<InventoryEntity> inventories ;
 final bool summeryIsExpanded ;

  @override
  State<NewInventoryList> createState() => _NewInventoryListState();
}

class _NewInventoryListState extends State<NewInventoryList> {

  @override
  Widget build(BuildContext context) {
    logger.e(widget.summeryIsExpanded);
    return Container(
      width: 1.sw,
      // color: Colors.blue,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(

            width: 1.sw,
            // height: 464.h,
            // color: Colors.red,
            constraints: BoxConstraints(
              // maxHeight: widget.summeryIsExpanded? 457.h : 564.h, // in ok hast vali bayad state avaz beshe b delay
              maxHeight: 571.h,
              minHeight: 457.h
            ),
            child: ListView.builder(
                itemCount: widget.inventories.length,

                padding: EdgeInsets.only(bottom: 100.h,top: 7.h),

                itemBuilder: (context , index){
                  return  NewInventoryItem(
                    inventoryEntity: widget.inventories[index],
                  );

            }),
          ),
        ],
      ),
    );
  }
}
