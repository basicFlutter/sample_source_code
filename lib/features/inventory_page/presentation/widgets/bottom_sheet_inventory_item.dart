import 'package:flutter/material.dart';

import 'package:new_panel/core/widgets/custom_item_bottom_sheet.dart';


import 'package:new_panel/main.dart';



class BottomSheetInventoryItems extends StatefulWidget {
  const BottomSheetInventoryItems({Key? key}) : super(key: key);

  @override
  State<BottomSheetInventoryItems> createState() => _BottomSheetInventoryItemsState();
}

class _BottomSheetInventoryItemsState extends State<BottomSheetInventoryItems> {


  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        CustomItemBottomSheet(
          title: "View Listing",
        ),
        CustomItemBottomSheet(
          title: "Edit Listing",
        ),
        CustomItemBottomSheet(
          title: "Create Window Sticker",
        ),
        CustomItemBottomSheet(
          title: "Start Deal",
        ),
      ],
    );
  }
}
