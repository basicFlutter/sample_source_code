import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/constants.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/gradeint_text.dart';


import '../constants/app_colors.dart';



class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork({Key? key , required this.url , this.imageSvgPath,this.imageFile ,this.imageSvgSource,this.imageHeight , this.imageWidth,this.boxFit , this.showAge , this.age , this.borderRadius , this.cacheHeight , this.cacheWidth}) : super(key: key);
  final String? url;
  final BoxFit? boxFit;
  final bool? showAge;
  final num? age;
  final double? imageWidth;
  final double? imageHeight;
  final File? imageFile;
  final String? imageSvgPath;
  final String? imageSvgSource;
  final BorderRadius? borderRadius;
  final int ? cacheWidth;
  final int ? cacheHeight;

  @override
  Widget build(BuildContext context) {
    return  url != null || imageFile!=null || imageSvgPath != null ?Stack(
      alignment: Alignment.center,
      children: [

        if(imageFile != null)
        SizedBox(
            height: imageHeight,
            width: imageWidth,
            child: ClipRRect(
                borderRadius: borderRadius ?? BorderRadius.zero,
                child: Image.file(imageFile! , fit: boxFit ?? BoxFit.cover,))),
        if(imageSvgPath != null )
          SizedBox(
              height: imageHeight,
              width: imageWidth,
              child: SvgPicture.asset(imageSvgPath!)),
        if(imageSvgSource != null)
          SizedBox(
              height: imageHeight,
              width: imageWidth,
              child: SvgPicture.string(imageSvgSource!)
          ),

        if(url != null && imageFile == null && url?.trim() != "")
        ClipRRect(
          borderRadius: borderRadius?? BorderRadius.zero,
          child: Image.network(
            Constants.cdnBaseUrl+url!,
            cacheWidth:cacheWidth ?? 200,
            cacheHeight:cacheHeight?? 200,
            height:imageHeight ,
            width: imageWidth,
            fit: boxFit ?? BoxFit.cover,


            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(
                child: Icon(Icons.car_crash),
              );
            },
            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              return SizedBox(
                height:imageHeight,
                width: imageWidth,
                child: const Center(
                  child: Icon(Icons.error_outline),
                ),
              );
            },
          ),
        ),
        (age != null )? Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 19.h,
            margin: EdgeInsets.only(left: 15.w),
            padding: EdgeInsets.symmetric(vertical: 3.h ,horizontal: 0),
            decoration: BoxDecoration(
              boxShadow: [
              Theme.of(context).brightness == Brightness.light ? AppColors.boxShadow :AppColors.boxShadowDark
              ],
            color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,

              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4.r) , bottomRight: Radius.circular(4.r))
            ),
            constraints: BoxConstraints(
              minWidth: 17.w,
              maxWidth: 37.w
            ),
            child: Center(
              child: GradientText(
                text: age!.toString(),
                textStyle: Theme.of(context).textTheme.displayMedium,
                textFontWight: TextFontWight.bold,
                gradient: Theme.of(context).brightness == Brightness.light ? AppColors.gradientBlue : AppColors.gradientBlueDark,
              ),
            ),

          ),
        ) : const SizedBox() ,

      ],
    ):const Center(
      child: Icon(Icons.error_outline),
    );
  }
}
