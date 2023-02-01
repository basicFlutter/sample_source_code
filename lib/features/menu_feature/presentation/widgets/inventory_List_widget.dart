import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'inventory_item_widget.dart';

class InventoryListWidget extends StatelessWidget {
  const InventoryListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _inventory();
  }

  Padding _inventory() {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          InventoryItemWidget(),
          InventoryItemWidget(),
          InventoryItemWidget()
        ],
      ),
    );
  }
}
