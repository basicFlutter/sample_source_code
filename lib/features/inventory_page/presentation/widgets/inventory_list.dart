import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/vehicle_item.dart';
import '../../domain/entities/inventory_entity.dart';


class InventoryList extends StatefulWidget {
List<InventoryEntity> inventories ;
  InventoryList({Key? key , required this.inventories})
      : super(key: key);

  @override
  State<InventoryList> createState() => _InventoryListState();
}

class _InventoryListState extends State<InventoryList> {

  int currentPage = 1 ;


  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (ScrollEndNotification t){
        // bool hasMoreData =widget.inventories.length;
        // if (t.metrics.pixels > 0 && t.metrics.atEdge) {
        //   int page = currentPage;
        //   logger.i('CURRENT PAGE IS  ------------------>  $page') ;
        //   if (hasMoreData) {
        //     page++;
        //     currentPage = page;
        //
        //     if (!state.isLoadingMore!) {
        //       BlocProvider.of<InventoryBloc>(context).add(GetInventoriesEvent(
        //         context: context,
        //         page: currentPage,
        //         data: filterData,
        //         sortQuery: sortQueryString, ));
        //     }
        //   }
        // } else {}
        return true ;
      },
      child:


      ListView.builder(
          // shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.inventories.length,
          itemBuilder: (context, index) {
            return VehicleItem(
              itemIndex: index,
              currentInventory: widget.inventories[index],
            );
          }),
    );
  }
}
