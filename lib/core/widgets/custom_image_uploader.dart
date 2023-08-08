import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/enums/app_enums.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_image_network.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/ocr_entitiy.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/presentation/pages/camera_page.dart';


import 'package:new_panel/main.dart';
import 'package:page_transition/page_transition.dart';

class CustomImageUploader extends StatelessWidget {
   CustomImageUploader({Key? key , this.height , required this.onSelectImage,this.width , this.imageUrl , this.imageFile}) : super(key: key);
  final double? height;
  final double? width;
  final String? imageUrl;
   File? imageFile;
  final Function(File imageFile , OcrEntity) onSelectImage;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width:  338.w,
      height:  191.h,
      color: Theme.of(context).brightness == Brightness.light ? AppColors.primary3.withOpacity(0.3) : AppColors.primary3Dark.withOpacity(0.3),
      child: imageFile == null && imageUrl == null ?  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap:() async{
             OcrEntity? ocrEntity = await Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 200),
                    child:   const CameraPage(scannerMode: ScannerMode.driverLicenseScanner,)
                ),
              );
             if(ocrEntity != null){
               imageFile = ocrEntity.imageFile;
                 if(ocrEntity.imageFile != null){
                   onSelectImage(ocrEntity.imageFile! ,ocrEntity);
                 }
             }
            },
              child:  CustomImageNetwork(imageSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.uploadFileIcon : AppImages.uploadFileIconDark ,url: null,)),
          SizedBox(
            height: 13.h,
          ),

          CustomText(text: "Click to scan your driver license ", textStyle: Theme.of(context).textTheme.labelSmall , textFontWight: TextFontWight.regular,)
        ],
      ):CustomImageNetwork(imageFile: imageFile ,url: imageUrl,),

    );
  }
}
