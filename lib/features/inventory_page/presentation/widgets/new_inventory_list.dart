import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/features/inventory_page/domain/entities/inventory_entity.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/new_inventory_item.dart';

class NewInventoryList extends StatefulWidget {
  const NewInventoryList({Key? key }) : super(key: key);
 // final List<InventoryEntity> inventories ;
  @override
  State<NewInventoryList> createState() => _NewInventoryListState();
}

class _NewInventoryListState extends State<NewInventoryList> {
  List<InventoryEntity> myList = [
    InventoryEntity(
      id: "1",
      odometer: 1000,
      stockNO: "12345678912345678",
      sellPrice: 10000,
      specialPrice: 9000,
    ),InventoryEntity(
      id: "1",
      odometer: 1000,
      stockNO: "12345678912345678",
      sellPrice: 10000,
      specialPrice: 9000,
    ),InventoryEntity(
      id: "1",
      odometer: 1000,
      stockNO: "12345678912345678",
      sellPrice: 10000,
      specialPrice: 9000,
    ),InventoryEntity(
      id: "1",
      odometer: 1000,
      stockNO: "12345678912345678",
      sellPrice: 10000,
      specialPrice: 9000,
    ),InventoryEntity(
      id: "1",
      odometer: 1000,
      stockNO: "12345678912345678",
      sellPrice: 10000,
      specialPrice: 9000,
    ),InventoryEntity(
      id: "1",
      odometer: 1000,
      stockNO: "12345678912345678",
      sellPrice: 10000,
      specialPrice: 9000,
    ),InventoryEntity(
      id: "1",
      odometer: 1000,
      stockNO: "12345678912345678",
      sellPrice: 10000,
      specialPrice: 9000,
    ),InventoryEntity(
      id: "1",
      odometer: 1000,
      stockNO: "12345678912345678",
      sellPrice: 10000,
      specialPrice: 9000,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      width: 359.w,
      height: 635.h,
      child: ListView.builder(
          itemCount: myList.length,
          padding: EdgeInsets.only(bottom: 100.h),

          itemBuilder: (context , index){
            return NewInventoryItem();

      }),
    );
  }
}
