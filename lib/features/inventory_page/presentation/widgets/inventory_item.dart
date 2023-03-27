import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/utils/app_utils.dart';

class InventoryItem extends StatefulWidget {
   final int itemIndex ;
   const InventoryItem({Key? key , required this.itemIndex}) : super(key: key);

  @override
  State<InventoryItem> createState() => _InventoryItemState();
}

class _InventoryItemState extends State<InventoryItem>with SingleTickerProviderStateMixin {
  // late List<AnimationController> controllerList =[];
   late AnimationController animationController;
   late int selectedIndex ;
    bool isExpanded =false  ;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000),);

    selectedIndex = widget.itemIndex ;
   super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.h),
      child: SizedBox(
        height: 100,
        child: Stack(
          children: [
            _itemCard(context),
            AnimatedPositioned(
              bottom:isExpanded && selectedIndex == widget.itemIndex ?0 : -50,
              left: 0,
              duration: const Duration(milliseconds: 1000),
              child: Container(
                width: 329.w ,
                height: 50.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(1, 0), // changes position of shadow
                    ),
                  ],
                  color: Theme.of(context).colorScheme.secondary ,
                  borderRadius: BorderRadius.all(Radius.circular(5.r))
                ),

                child: Row(children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7.r)) ,
                        border: Border.all(color: Theme.of(context).colorScheme.primary)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('Total cost: '),
                      ))
                ],),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemCard(BuildContext context) {
    return Row(
            children: [
              _cardPicture(),
              const SizedBox(
                width: 5,
              ),
              _cardDetail(context),
            ],
          );
  }

  Widget _cardDetail(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(1, 3), // changes position of shadow
              ),
            ],
            border: Border.all(
                color: Theme.of(context).colorScheme.tertiary, width: 1),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.background,
                Theme.of(context).colorScheme.tertiary,
              ],
            ),
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.r),
                bottomRight: Radius.circular(5.r))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Land rover range rover evoque',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    'TRUUT28N7110442',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Sedan',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    '15734 KM',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Stock #: NV911415659278301',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h, right: 8.w),
                  child: Column(
                    children: [
                      Text(
                        AppUtils.dollarFormat('3000'),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(AppUtils.dollarFormat('2500'),
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    decoration: TextDecoration.lineThrough,))
                    ],
                  ),
                ),
                _options(context)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _options(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(36),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return _moreBottomSheet(context);
                              });
                        },
                        child: SvgPicture.asset(
                          AppImages.more,
                          height: 22.h,
                        )),
                    SizedBox(
                      width: 15.w,
                    ),
                    AnimatedBuilder(
                      animation: animationController,
                      builder: (BuildContext context, Widget? child){
                        return  Transform.rotate(
                          angle: animationController.value *pi,
                          child: GestureDetector(
                            onTap: (){
                              if(selectedIndex == widget.itemIndex){

                                if(!isExpanded){
                                  animationController.animateTo(180) ;
                                }else{
                                  animationController.animateBack(0);
                                }

                                isExpanded = !isExpanded;
                              }

                            },
                            child: SvgPicture.asset(
                              AppImages.arrow,
                              height: 22.h,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
  }

  Widget _moreBottomSheet(BuildContext context) {
    return Container(
                                  // height: 360.h ,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(36.r),
                                        topLeft: Radius.circular(36.r),
                                      )),
                                  child: ListView(
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _topDesignWidget(context),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _bottomSheetItem(
                                                context: context,
                                                title: 'View Listing'),
                                            _bottomSheetItem(
                                                context: context,
                                                title: 'Edit Listing'),
                                            _bottomSheetItem(
                                                context: context,
                                                title:
                                                    'Create Windows Sticker'),
                                            _bottomSheetItem(
                                                context: context,
                                                title: 'Start Deal'),
                                            _subMenuExpansion(context),
                                            _bottomSheetItem(
                                                context: context,
                                                title: 'Appraisal'),
                                            _bottomSheetItem(
                                                context: context,
                                                title: 'Coming Soon'),
                                            _bottomSheetItem(
                                                context: context,
                                                title: 'Pending'),
                                            _bottomSheetItem(
                                                context: context,
                                                title: 'Mark As Sold'),
                                            _bottomSheetItem(
                                                context: context,
                                                title: 'Delete Listing'),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
  }

  Widget _subMenuExpansion(BuildContext context) {
    return ListTileTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
      dense: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
          child: ExpansionTile(
            tilePadding: EdgeInsets.symmetric(horizontal: 6.w),
            childrenPadding: EdgeInsets.zero,
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            collapsedBackgroundColor: Colors.white,
            title: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Creat Bill Of Sale',
                  style: Theme.of(context).textTheme.headlineLarge,
                )),
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 15.w),
                child: Column(
                  children: [
                    _subMenu(context, 'Retail'),
                    _subMenu(context, 'Whole Sale'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _subMenu(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Container(
            height: 10.h,
            width: 10.w,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );
  }

  Widget _bottomSheetItem(
          {required BuildContext context, required String title}) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 30.w),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      );

  Widget _topDesignWidget(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(36.r),
            topLeft: Radius.circular(36.r),
          )),
      child: Center(
        child: Container(
          width: 60.w,
          height: 3.h,
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.onTertiary),
        ),
      ),
    );
  }

  Widget _cardPicture() {
    return Stack(
      children: [
        SizedBox(
          width: 126,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.r),
                bottomLeft: Radius.circular(55.r)),
            child: Image.asset(
              AppImages.inventoryTest,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            bottom: -16,
            left: -16,
            child: Transform.scale(
                scale: 0.7,
                child: Checkbox(value: true, onChanged: (value) {})))
      ],
    );
  }
}
