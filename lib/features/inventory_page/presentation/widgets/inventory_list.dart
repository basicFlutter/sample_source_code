import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'inventory_item.dart';

class InventoryList extends StatefulWidget {

  InventoryList({Key? key})
      : super(key: key);

  @override
  State<InventoryList> createState() => _InventoryListState();
}

class _InventoryListState extends State<InventoryList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return InventoryItem(
            itemIndex: index,

          );
        });
  }
}
