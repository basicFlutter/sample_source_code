import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/models/drop_down_model.dart';
import 'package:new_panel/core/params/login_input_params.dart';
import 'package:new_panel/core/widgets/custom_container.dart';

import 'package:new_panel/core/widgets/custom_item_bottom_sheet.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/custome_expansion_in_bottomSheet.dart';
import 'package:new_panel/features/login_feature/presentation/pages/login_page.dart';
import 'package:new_panel/main.dart';

import '../../../../core/constants/app_colors.dart';

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
          itemListTitle: [
            "Coming Soon",
            "Pending",
            "Appraisal",
            "Delete",
          ],
          onSelected: (String titleSelected){
            logger.w(titleSelected);
          },


        ),
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
