import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_switch.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/colorName_inActionCard.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/in_service_icon.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/totalCost_inActionCard.dart';
import 'package:new_panel/main.dart';

class ActionCardInventory extends StatefulWidget {
  const ActionCardInventory({Key? key ,required this.inSelectMode,required this.inService ,required this.color , required this.totalCost}) : super(key: key);
  final String? color;
  final String? totalCost;
  final bool? inService;
  final bool inSelectMode;

  @override
  State<ActionCardInventory> createState() => _ActionCardInventoryState();
}

class _ActionCardInventoryState extends State<ActionCardInventory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:36.h ,
      width: 358.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(5.r) , bottomLeft: Radius.circular(5.r)),
          color: Theme.of(context).brightness == Brightness.light ? AppColors.primary3 : AppColors.primary3Dark
      ),
      child: Row(
        children: [
          SizedBox(width: 5.w),

          TotalCostInActionCard(
            totalCost: widget.totalCost,
          ),

          const ColorNameInActionCard(
            color: "Dark Yellow",
          ),

          SizedBox(width: 5.w),

          InServiceIcon(
            inService: widget.inService ?? false,
          ),

          SizedBox(width: 14.w),

          if(!widget.inSelectMode)
          CustomSwitch(
            state: false,
            onChanged: (stateSwitch){

            },
          )



        ],
      ),
    );
  }
}
