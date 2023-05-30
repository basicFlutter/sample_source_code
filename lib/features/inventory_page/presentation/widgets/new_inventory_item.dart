import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/circular_button.dart';
import 'package:new_panel/core/widgets/custom_image_network.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/features/inventory_page/domain/entities/inventory_entity.dart';
import 'package:new_panel/features/inventory_page/presentation/widgets/price_widget.dart';
import 'package:new_panel/main.dart';
import 'dart:math' as math;

class NewInventoryItem extends StatelessWidget {
  const NewInventoryItem({Key? key , required this.inventoryEntity}) : super(key: key);
 final InventoryEntity? inventoryEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        logger.w({"vehicle Id is : ${inventoryEntity?.age}"});
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 358.w,
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
                                  width:167.w,
                               //   color: Colors.red,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                         SizedBox( height: 8.h ),
                                      SizedBox(
                                        width:167.w,
                                        child: CustomText(
                                            text: inventoryEntity?.vehicles?.model?.toString() ??"",
                                            textStyle: Theme.of(context).textTheme.displaySmall ,
                                          textFontWight: TextFontWight.bold,
                                        ),
                                      ),
                                      SizedBox( height: 10.h ),
                                      SizedBox(
                                        width:167.w,
                                        child: CustomText(
                                          text: inventoryEntity?.vehicles?.vinNumber ??"",
                                          textStyle: Theme.of(context).textTheme.bodyLarge ,
                                          textFontWight: TextFontWight.regular,
                                        ),
                                      ),
                                      SizedBox( height: 10.h ),
                                      SizedBox(
                                        width:167.w,
                                        child: CustomText(
                                          text: "Stock #: ${inventoryEntity?.stockNO}",
                                          textStyle: Theme.of(context).textTheme.bodyLarge ,
                                          textFontWight: TextFontWight.regular,
                                        ),
                                      ),

                                      SizedBox( height: 10.h ),
                                      SizedBox(
                                        width:167.w,
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
                                        ),

                                        Expanded(child: SizedBox()),

                                        
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            CircularButton(
                                              gradient: Theme.of(context).brightness == Brightness.light ? AppColors.gradientBlue : AppColors.gradientBlueDark,

                                                onTap: (){}, radius: 21.r, child: Transform.rotate(
                                                angle: 90 * math.pi / 180,
                                                child: Center(
                                                    child: Icon(
                                                    Icons.more_horiz,
                                                      size: 9.67.r,
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
                Container(
                  height:36.h ,
                  width: 358.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(5.r) , bottomLeft: Radius.circular(5.r)),
                    color: Theme.of(context).colorScheme.primaryContainer
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
