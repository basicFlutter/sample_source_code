import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_image_network.dart';
import 'package:new_panel/features/veicle_detail_feature/domain/entities/inventory_image_entity.dart';

class ItemImageSlider extends StatelessWidget {
   ItemImageSlider({Key? key , required this.inventoryImageEntity , required this.onTap, required this.index , required this.indexSelected}) : super(key: key);
  final InventoryImageEntity inventoryImageEntity;
  Function(String imageUrl) onTap;
  int index;
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap(inventoryImageEntity.mediaSrc??"");
        indexSelected = index;
      },
      child: CustomContainer(
        width: 52.w ,
        height: 52.w ,
        color: Color(0xff808a95),
        boxShadow: [
          Theme.of(context).brightness == Brightness.light ? AppColors.boxShadow : AppColors.boxShadowDark,

          // if(index == indexSelected)
          // BoxShadow(
          //     color: Color(0xfffff06a),
          //     spreadRadius: 0.1,
          //     offset: const Offset(0, 2))
        ],
        margin: EdgeInsets.symmetric(horizontal: 6.5.w),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
         border:index == indexSelected ? Border.all(color: Color(0xffFF8147) , width: 2.5 , strokeAlign: BorderSide.strokeAlignOutside) :null,
        child: CustomImageNetwork(url: inventoryImageEntity.mediaSrc , borderRadius: BorderRadius.all(Radius.circular(8.r)),)
      ),
    );
  }
}
