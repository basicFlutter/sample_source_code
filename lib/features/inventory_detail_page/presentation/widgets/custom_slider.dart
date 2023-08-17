import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/constants/constants.dart';
import 'package:new_panel/core/utils/app_utils.dart';
import 'package:new_panel/features/inventory_page/data/models/inventory_model.dart';

import '../../../../core/data/network/api_provider.dart';

class CustomSlider extends StatefulWidget {
  final List<MidVdsMedia> carImages;


  const CustomSlider(
      {Key? key,
      required this.carImages,
})
      : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      child: Stack(children: [
        _mainPicture(context),
        // _jaPricei(context),
        _sliderPointer(context)
      ]),
    );
  }

  Widget _sliderPointer(BuildContext context) {
    return Positioned(
        right: 80.w,
        left: 80.w,
        bottom: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10, tileMode: TileMode.repeated),
              child: Container(
                width: 253.w,
                height: 66.h,
                decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .onTertiaryContainer
                        .withOpacity(0.6)),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                  Icon(Icons.arrow_back_ios_new, color: Theme.of(context).colorScheme.background,),
                  for(var image in widget.carImages) // TODO HANDLE IF IMAGES WAS MORE THAN 3 IMAGES
                    _smallPicture(context, image) ,
                  
                  Icon(Icons.arrow_forward_ios_outlined , color: Theme.of(context).colorScheme.background,)
                ],),
              ),
          ),
        ),
      );
  }

  Widget _smallPicture(BuildContext context, MidVdsMedia image) {
    return Container(
                    height: 52.h,
                    width: 52.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1,
                            spreadRadius: 0,
                              offset: Offset(0,0 ),
                              color: Theme.of(context).colorScheme.primary
                            )
                          ]
                        ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      child: Image.network( '${Constants.cdnBaseUrl}${image.mediaSrc!}' , fit: BoxFit.cover,),
                    ),
                  );
  }

  Widget _jaPricei(BuildContext context) {// :D
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 3, sigmaY: 3, tileMode: TileMode.repeated),
          child: Container(
            height: 35.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .onTertiaryContainer
                    .withOpacity(0.6)),

          ),
        ),
      ),
    );
  }

  Widget _mainPicture(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 287.h,
        child: widget.carImages != []
            ? ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.r),
                    bottomRight: Radius.circular(15.r)),
                child: Image.network(
                  '${Constants.cdnBaseUrl}${widget.carImages[0].mediaSrc}',
                  fit: BoxFit.cover,
                ),
              )
            : const Icon(Icons.image));
  }
}
