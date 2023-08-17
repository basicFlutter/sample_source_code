import 'package:flutter/material.dart';

import 'package:new_panel/core/widgets/custom_item_bottom_sheet.dart';

import 'package:new_panel/core/widgets/custome_expansion_in_bottomSheet.dart';

import 'package:new_panel/main.dart';



class BottomSheetInventoryItems extends StatefulWidget {
  const BottomSheetInventoryItems({Key? key}) : super(key: key);

  @override
  State<BottomSheetInventoryItems> createState() => _BottomSheetInventoryItemsState();
}

class _BottomSheetInventoryItemsState extends State<BottomSheetInventoryItems> {


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomExpansionInBottomSheet(
          title: 'Change Status',
          selectedTile: "Pending",
          itemListTitle: const [
            "Coming Soon",
            "Pending",
            "Appraisal",
            "Delete",
          ],
          onSelected: (String titleSelected){
            logger.w(titleSelected);
          },


        ),
        const CustomItemBottomSheet(
          title: "View Listing",
        ),
        const CustomItemBottomSheet(
          title: "Edit Listing",
        ),
        const CustomItemBottomSheet(
          title: "Create Window Sticker",
        ),
        const CustomItemBottomSheet(
          title: "Start Deal",
        ),


      ],
    );
  }
}
