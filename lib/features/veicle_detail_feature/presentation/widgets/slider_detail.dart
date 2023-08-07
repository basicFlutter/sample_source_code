import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html_editor_enhanced/utils/shims/dart_ui_real.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_image_network.dart';
import 'package:new_panel/core/widgets/custom_loading.dart';
import 'package:new_panel/features/veicle_detail_feature/domain/entities/inventory_image_entity.dart';
import 'package:new_panel/features/veicle_detail_feature/presentation/manager/status/get_inventroy_images_status.dart';
import 'package:new_panel/features/veicle_detail_feature/presentation/manager/vehicle_detail_bloc.dart';
import 'package:new_panel/features/veicle_detail_feature/presentation/widgets/item_image_slider.dart';

class SliderDetail extends StatefulWidget {
  const SliderDetail({Key? key}) : super(key: key);


  @override
  State<SliderDetail> createState() => _SliderDetailState();
}

class _SliderDetailState extends State<SliderDetail> {
  String imageUrl = "";
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-0-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-1-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-2-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-3-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-4-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-5-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-6-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-7-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-8-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-9-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-10-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-11-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-12-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-13-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-14-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-15-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-16-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-17-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-18-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-19-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-20-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-21-70209.jpg
  ///https://image123.azureedge.net/medallionmotors/2013-MINI-CooperCountryman-22-70209.jpg

  int? indexSelected ;

  final ScrollController _scrollController = ScrollController(

  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // imageUrl = widget.inventoryImageList[0].mediaSrc ?? "";
  }
  void start() async{
    await Future.delayed(const Duration(seconds: 1));
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        height: 322.h,
        width: 390.w,
        margin: EdgeInsets.only(top: 15.h),
        // color: Colors.red,
        child: Stack(
          children: [
            BlocConsumer<VehicleDetailBloc, VehicleDetailState>(
              listener: (context, state) {
                if(state.getInventoryImagesStatus is GetInventoryImagesCompleted){
                  GetInventoryImagesCompleted getInventoryImagesCompleted = state.getInventoryImagesStatus as GetInventoryImagesCompleted;
                  if(getInventoryImagesCompleted.inventoryImageList.isNotEmpty){
                    if(getInventoryImagesCompleted.inventoryImageList.length >4){
                      imageUrl = getInventoryImagesCompleted.inventoryImageList.last.mediaSrc??"";
                    }else{
                      imageUrl = getInventoryImagesCompleted.inventoryImageList[0].mediaSrc??"";
                    }

                  }

                }
              },
              builder: (context, state) {
                return CustomImageNetwork(
                    imageHeight: 287.h,
                    imageWidth: 390.w,
                    cacheHeight: 500,
                    cacheWidth: 500,
                    boxFit: BoxFit.cover,

                    // url: "/hillzgroup/6989326754475327-Subaru-BRZ-2015-11369cb0-2f8d-11ee-b422-cd37e6d3ffa2.jpg"
                    url: imageUrl
                );
              },
            ),

            Positioned(
              right: 30.w,
              left: 30.w,
              bottom: 2,
              child: CustomContainer(
                boxShadow: [
                  Theme.of(context).brightness == Brightness.light ? AppColors.boxShadow : AppColors.boxShadowDark
                ],
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4, tileMode: TileMode.repeated),
                    child: CustomContainer(
                      width: 325.w,
                      height: 66.h,
                      color: Theme.of(context).brightness == Brightness.light ? AppColors.darkBlueColor.withOpacity(0.49) : AppColors.darkBlueColorDark.withOpacity(0.49),


                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          // Icon(Icons.arrow_back_ios_new, color: Theme.of(context).colorScheme.background,),



                          BlocConsumer<VehicleDetailBloc, VehicleDetailState>(
                            listener: (context, state) {
                             if(state.getInventoryImagesStatus is GetInventoryImagesCompleted){
                               start();
                             }
                            },
                            builder: (context, state) {

                              if(state.getInventoryImagesStatus is GetInventoryImagesCompleted) {
                                GetInventoryImagesCompleted getInventoryImagesCompleted = state.getInventoryImagesStatus as GetInventoryImagesCompleted;

                                return SizedBox(
                                  width: 309.w,
                                  child: Center(
                                    child: ListView.builder(
                                      controller: _scrollController,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.symmetric(vertical: 7.h ,horizontal: 0),
                                        reverse: getInventoryImagesCompleted.inventoryImageList.length>4 ? true : false,
                                        itemCount: getInventoryImagesCompleted.inventoryImageList.length,
                                        scrollDirection: Axis.horizontal,
                                        physics: const BouncingScrollPhysics(),

                                        itemBuilder: (context, index) {
                                          return ItemImageSlider(
                                            index: index,
                                            inventoryImageEntity: getInventoryImagesCompleted.inventoryImageList[index],
                                            indexSelected: indexSelected ?? (getInventoryImagesCompleted.inventoryImageList.length>4? getInventoryImagesCompleted.inventoryImageList.length-1 : 0),
                                            onTap: (urlImageSelected){
                                              imageUrl = urlImageSelected;
                                              indexSelected = index;
                                              setState(() {

                                              });
                                            },

                                          );
                                        }
                                    ),
                                  ),
                                );
                              }

                              if(state.getInventoryImagesStatus is GetInventoryImagesLoading){
                                return const Expanded(
                                    child: Center(
                                      child: CustomLoading() ,
                                    )
                                );
                              }

                              return const Expanded(child: SizedBox());

                            },
                          ),
                          // SizedBox(
                          //   width: 5.w,
                          // ),


                          // Icon(Icons.arrow_forward_ios_outlined , color: Theme.of(context).colorScheme.background,)
                        ],),
                    ),
                  ),
                ),
              ),
            )
            // Positioned(
            //   bottom: 0,
            //
            //   child: BackdropFilter(
            //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10, tileMode: TileMode.repeated),
            //     child: CustomContainer(
            //       width: 325.w,
            //       height: 66.h,
            //       color: Colors.grey,
            //       boxShadow: [
            //         Theme.of(context).brightness == Brightness.light ? AppColors.boxShadow :AppColors.boxShadowDark
            //       ],
            //       borderRadius: BorderRadius.all(Radius.circular(10.r)),
            //
            //       child: SizedBox(),
            //     ),
            //   ),
            // )
          ],

        ));
  }
}
