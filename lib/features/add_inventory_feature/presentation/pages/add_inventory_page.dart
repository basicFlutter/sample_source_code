import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/enums/app_enums.dart';
import 'package:new_panel/core/widgets/appBar.dart';
import 'package:new_panel/core/widgets/custom_body.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/round_corner_button.dart';
import 'package:new_panel/core/widgets/text_field_with_back.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/presentation/pages/camera_page.dart';
import 'package:new_panel/features/filter_inventory_page/presentation/widgets/title_input.dart';
import 'package:new_panel/main.dart';
import 'package:page_transition/page_transition.dart';

class AddInventoryPage extends StatefulWidget {
  const AddInventoryPage({Key? key}) : super(key: key);

  @override
  State<AddInventoryPage> createState() => _AddInventoryState();
}

class _AddInventoryState extends State<AddInventoryPage> {
  TextEditingController searchController = TextEditingController();
  TextEditingController vinNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomBody(
        searchbarController: searchController,
        appBarCustom: const AppBarCustom(),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  CustomText(text: "Inventory Management",
                      textStyle: Theme.of(context).textTheme.titleSmall,
                    textFontWight: TextFontWight.bold,
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              TitleInput(title: "Enter Your VIN Number",
                  child: TextFieldWithBack(
                      controller: vinNumberController,
                    maxLength: 17,
                    textInputType: TextInputType.visiblePassword,
                    hint: "1D4GP25R96B685550",

                  )
              ),
              RoundCornerButton(onTap: (){}, width: 169.w, title: "Continue", height: 46.h),
              SizedBox(
                height: 25.h,
              ),
              RoundCornerButton(
                onTap: () async{
                  String? vinNumber = await Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        duration: const Duration(milliseconds: 200),
                        child:   const CameraPage(
                          scannerMode: ScannerMode.vinNumberScanner,
                        )
                    ),
                  );
                  if(vinNumber != null){
                    vinNumberController.text = vinNumber;
                    setState(() {

                    });
                  }

                },
                width: 358.w,
                height: 48.h,
                title: "Scan VIN",
                radius: 100.r,
                
                showTopLineShadow: true,
                backGroundColor: Theme.of(context).brightness == Brightness.light ? AppColors.primary3 : AppColors.primary3Dark,
                textColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary : AppColors.secondary3Dark,
                textFontWight: TextFontWight.regular,
                svgIconPath: Theme.of(context).brightness == Brightness.light ? AppImages.vinGradientIcon : AppImages.vinGradientIcon,
              ),

              SizedBox(
                height: 20.h,
              ),

              RoundCornerButton(
                onTap: () async {

                  List<String>? barcodeList = await Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        duration: const Duration(milliseconds: 200),
                        child:   const CameraPage(
                          scannerMode: ScannerMode.barcodeScanner,
                        )
                    ),
                  );
                  logger.w(barcodeList);

                  if(barcodeList != null){
                    // vinNumberController.text = vinNumber;
                    // setState(() {
                    //
                    // });
                  }


                },
                width: 358.w,
                height: 48.h,
                radius: 100.r,
                title: "Barcode Scan",
                showTopLineShadow: true,
                backGroundColor: Theme.of(context).brightness == Brightness.light ? AppColors.primary3 : AppColors.primary3Dark,
                textColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary : AppColors.secondary3Dark,
                textFontWight: TextFontWight.regular,
                svgIconPath: Theme.of(context).brightness == Brightness.light ? AppImages.barcodeScannerIcon : AppImages.barcodeScannerIcon,
              ),


              SizedBox(
                height: 20.h,
              ),

              RoundCornerButton(
                onTap: (){

                },
                width: 358.w,
                height: 48.h,
                radius: 100.r,
                title: "Upload Vehicle Without VIN",
                showTopLineShadow: true,
                backGroundColor: Theme.of(context).brightness == Brightness.light ? AppColors.primary3 : AppColors.primary3Dark,
                textColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary : AppColors.secondary3Dark,
                textFontWight: TextFontWight.regular,
                svgIconPath: Theme.of(context).brightness == Brightness.light ? AppImages.uploadIcon : AppImages.uploadIconDark,
              ),

            ],
          ),
        )

    );
  }
}
