import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/circular_button.dart';
import 'package:new_panel/core/widgets/custom_check_box.dart';
import 'package:new_panel/core/widgets/custom_image_network.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/features/inventory_page/domain/entities/inventory_entity.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/action_card_inventory.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/price_widget.dart';
import 'package:new_panel/main.dart';
import 'dart:math' as math;

class NewInventoryItem extends StatelessWidget {
   NewInventoryItem({Key? key , required this.inventoryEntity , required this.isSelectedMode ,required this.selectedThisVehicle ,required this.onTap , required this.onLongPress}) : super(key: key);
 final InventoryEntity? inventoryEntity;
  final bool isSelectedMode ;
  Function(String vehicleId) onTap;
  Function(String vehicleId) onLongPress;
  bool itemSelected = false;
  GlobalKey<CustomCheckBoxState> checkBoxKey = GlobalKey<CustomCheckBoxState>();


   Function(bool isSelected , String vehicleId) selectedThisVehicle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        if(isSelectedMode){
          itemSelected = !itemSelected;

        checkBoxKey.currentState?.updateState();
          logger.w(itemSelected);
        }else{
          onTap(inventoryEntity!.id!);
        }
      },
      onLongPress: (){
        onLongPress(inventoryEntity!.id!);

      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Visibility(

              visible: isSelectedMode,
              child: CustomCheckBox(
                key: checkBoxKey,
                isChecked: itemSelected,
                margin: EdgeInsets.only(right: 16.w , left: 16.w),
                onChecked: (newValue){
                  itemSelected = !itemSelected;

                  selectedThisVehicle(itemSelected,inventoryEntity!.id!);
                },
              )


          ),


          Container(
            width:isSelectedMode?318.w : 358.w,
            height: 136.h,
            margin: EdgeInsets.only(bottom: 7.h),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light ? AppColors.backgroundCard : AppColors.backgroundCardDark,
              // gradient: Theme.of(context).brightness == Brightness.light ? AppColors.gradientBackgroundCard : AppColors.gradientBackgroundCardDark,
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
              boxShadow: [
                Theme.of(context).brightness == Brightness.light ? AppColors.boxShadow : AppColors.boxShadowDark
              ]
            ),

            child: Column(
              children: [
                Container(
                  height: 100.h,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100.w,
                        height: 100.h,
                        child: CustomImageNetwork(
                          url: (inventoryEntity?.midVDSMedia?.isNotEmpty ?? false) ? (inventoryEntity?.midVDSMedia?[0].mediaSrc) : null,
                          age: inventoryEntity?.age,
                        ),
                      ),

                         SizedBox(width: 10.w),

                      Expanded(
                          child: Container(
                        // color: Colors.red,
                            child: Row(
                              children: [
                                Container(
                                  width:isSelectedMode? 145.w : 167.w,
                               //   color: Colors.red,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                         SizedBox( height: 8.h ),
                                      SizedBox(
                                        width:isSelectedMode? 145.w : 167.w,
                                        height: 12.h,
                                        child: CustomText(
                                            text: "${inventoryEntity?.vehicles?.model?.toString()}" ??"",
                                            textStyle: Theme.of(context).textTheme.displaySmall ,
                                          textFontWight: TextFontWight.bold,
                                        ),
                                      ),
                                      SizedBox( height: 10.h ),
                                      SizedBox(
                                        width:isSelectedMode? 145.w : 167.w,
                                        height: 12.h,
                                        child: CustomText(
                                          text: inventoryEntity?.vehicles?.vinNumber ??"",
                                          textStyle: Theme.of(context).textTheme.bodyLarge ,
                                          textFontWight: TextFontWight.regular,
                                        ),
                                      ),
                                      SizedBox( height: 10.h ),
                                      SizedBox(
                                        width:isSelectedMode? 145.w : 167.w,
                                        height: 12.h,
                                        child: CustomText(
                                          text: "Stock #: ${inventoryEntity?.stockNO}",
                                          textStyle: Theme.of(context).textTheme.bodyLarge ,
                                          textFontWight: TextFontWight.regular,
                                        ),
                                      ),

                                      SizedBox( height: 10.h ),
                                      SizedBox(
                                        width:isSelectedMode? 145.w : 167.w,
                                        height: 12.h,
                                        child: CustomText(
                                          text: "Odometer: ${inventoryEntity?.odometer} ${inventoryEntity?.odometerType == 2 ?'KM' : 'MI'}",
                                          textStyle: Theme.of(context).textTheme.bodyLarge ,
                                          textFontWight: TextFontWight.regular,
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                                Expanded(
                                    child:Column(

                                      children: [

                                        SizedBox( height: 9.5.h ),

                                        PriceWidget(
                                          price: inventoryEntity?.sellPrice?.toString(),
                                          specialPrice: inventoryEntity?.specialPrice?.toString(),
                                          showEditIcon: !isSelectedMode,
                                        ),

                                        const Expanded(child: SizedBox()),


                                        Visibility(
                                          visible: !isSelectedMode,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              CircularButton(
                                                gradient: Theme.of(context).brightness == Brightness.light ? AppColors.gradientBlue : AppColors.gradientBlueDark,

                                                  onTap: (){},
                                                radius: 25.r,
                                                 child: Transform.rotate(
                                                  angle: 90 * math.pi / 180,
                                                  child: Center(
                                                      child: Icon(
                                                      Icons.more_horiz,
                                                        size: 17.r,
                                                        color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
                                                      )
                                                      ),
                                              ),

                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 13.h,
                                        ),



                                      ],
                                    )
                                )


                              ],
                            ),

                      ))

                    ],
                  ),
                ),
                ActionCardInventory(
                  color: "Dark Yellow Metallic",
                  totalCost: inventoryEntity?.totalCost?.toString(),
                  inService: false,
                  inSelectMode: isSelectedMode,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
