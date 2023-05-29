import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_image_network.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/features/inventory_page/domain/entities/inventory_entity.dart';

class NewInventoryItem extends StatelessWidget {
  const NewInventoryItem({Key? key , required this.inventoryEntity}) : super(key: key);
 final InventoryEntity? inventoryEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
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
                      ),
                    ),

                       SizedBox(width: 10.w),

                    Expanded(
                        child: Container(
                      // color: Colors.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                 SizedBox( height: 8.h ),
                              Row(
                                children: [
                                  SizedBox(
                                    width:167.w,
                                    child: CustomText(
                                        text: inventoryEntity?.vehicles?.model?.toString() ??"",
                                        textStyle: Theme.of(context).textTheme.displaySmall ,
                                      textFontWight: TextFontWight.bold,
                                    ),
                                  )
                                ],
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
    );
  }
}
