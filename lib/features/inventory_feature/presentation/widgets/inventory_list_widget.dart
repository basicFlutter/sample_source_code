import 'package:flutter/material.dart';

import 'inventory_item_widget.dart';


class InventoryListWidget extends StatelessWidget {
  const InventoryListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      InventoryItemWidget()
      ],
    );
  }


}
