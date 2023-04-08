import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/data/network/api_provider.dart';
import 'package:new_panel/core/utils/app_utils.dart';

import '../../domain/entities/inventory_entity.dart';
import '../manager/inventory_bloc.dart';
import '../manager/status/inventory_page_status.dart';

class InventoryItem extends StatefulWidget {
   final int itemIndex ;
   final InventoryEntity currentInventory ;

    InventoryItem({Key? key , required this.itemIndex , required this.currentInventory}) : super(key: key);

  @override
  State<InventoryItem> createState() => _InventoryItemState();
}

class _InventoryItemState extends State<InventoryItem>with SingleTickerProviderStateMixin {
  // late List<AnimationController> controllerList =[];
   late AnimationController animationController;
   late int selectedIndex ;
    bool isExpanded =false  ;
    bool? isSelectMode ;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500),);

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


    return BlocBuilder<InventoryBloc, InventoryState>(
      builder: (context, state) {
        if(state.inventoryPageStatus is ChangeSelectModeStatus){
          ChangeSelectModeStatus changeSelectMode = state.inventoryPageStatus as ChangeSelectModeStatus ;
          isSelectMode = changeSelectMode.isSelectMode ;
        }
    return GestureDetector(
      onLongPress: (){
       BlocProvider.of<InventoryBloc>(context).add(ChangeSelectModeEvent(isSelectMode: true )) ;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h , horizontal: 12.w),
        child: SizedBox(
          width: MediaQuery.of(context).size.width ,
          height: 130.h,
          child: Stack(
            children: [
              _itemCard(context),
              _moreDetailCard(context)
            ],
          ),
        ),
      ),
    );
  },
);
  }

  Widget _moreDetailCard(BuildContext context) {
    return AnimatedPositioned(
            curve: Curves.linear,
            bottom:isExpanded && selectedIndex == widget.itemIndex ?8 : -50,
            left: 0,
            duration: const Duration(milliseconds: 500),
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
                color:Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.r))
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                _moreDetailItem(context , 'Total Cost : ${AppUtils.dollarFormat(widget.currentInventory.totalCost.toString())}') ,
                _moreDetailItem(context , 'Color :${ widget.currentInventory.vehicles?.colorsVehiclesFrkExteriorColorToColors!= null ?   widget.currentInventory.vehicles?.colorsVehiclesFrkExteriorColorToColors['name'] : '---'}') ,
                Container(decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(7.r)) ,
                border: Border.all(color: Theme.of(context).colorScheme.primary)),
                child:const Padding(
                  padding:  EdgeInsets.all(5.0),
                  child:  Icon(Icons.build ,size: 12, ),
                ),
                ) ,

              ],),
            ),
          );
  }

  Widget _moreDetailItem(BuildContext context , String title ) {
    return Padding(
      padding:  EdgeInsets.only(right: 8.w),
      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7.r)) ,
                      border: Border.all(color: Theme.of(context).colorScheme.primary)
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('$title '),
                    )),
    );
  }

  Widget _itemCard(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 6.w),
      child: Container(

        height: 127.h,

        child: Row(
                children: [
                  _cardPicture(),
                  const SizedBox(
                    width: 5,
                  ),
                  _cardDetail(context),
                ],
              ),
      ),
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
                  SizedBox(
                    width:MediaQuery.of(context).size.width/3+20.w,
                    height: 25.h,
                    child: Text(
                      '${widget.currentInventory.vehicles?.modelYear} ${widget.currentInventory.vehicles?.make} ${widget.currentInventory.vehicles?.model}',
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Text(
                    widget.currentInventory.vehicles?.vinNumber ?? '',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Stock #: ${widget.currentInventory.stockNO}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Odometer: ${widget.currentInventory.odometer} ${widget.currentInventory.odometerType == 2 ?'KM':'MI'}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),Text(
                    widget.currentInventory.vehicles?.bodyStyles?.name ?? '',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 80.w,
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.h, right: 8.w),
                    child: Column(
                      children: [
                        if(widget.currentInventory.specialPrice != 0)  Text(
                          AppUtils.dollarFormat('${widget.currentInventory.specialPrice}'),
                          overflow: TextOverflow.fade,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )else Text(

                          AppUtils.dollarFormat('${widget.currentInventory.sellPrice}'),
                          style: Theme.of(context).textTheme.bodyMedium,   overflow: TextOverflow.fade,
                        ),
                        if(widget.currentInventory.specialPrice != 0)
                        Text(AppUtils.dollarFormat('${widget.currentInventory.sellPrice}'),
                            overflow: TextOverflow.fade,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      decoration: TextDecoration.lineThrough,))
                      ],
                    ),
                  ),
                ),
                isSelectMode?? false   ?const SizedBox()
                : SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: Switch(value: true, onChanged: (isActive){})) ,
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
                                setState(() {

                                });
                              }

                            },
                            child:Stack(children: [
                              Positioned(
                                bottom: 2,
                                left: 0,
                                child: Container(
                                  width:30.w ,
                                  height: 30.h ,
                                  decoration: BoxDecoration(

                                  color: Theme.of(context).colorScheme.primary ,
                                  shape: BoxShape.circle
                                ),),
                              ) ,
                              Icon(Icons.arrow_drop_down_circle_sharp , size: 35.h , color: Colors.white ,)
                            ],)
                            // SvgPicture.asset(
                            //   AppImages.arrow,
                            //   height: 22.h,
                            // ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: 5.w,
                    ),

                    isSelectMode ??false   ?const SizedBox() :
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
                        child:Icon(Icons.more_vert , size: 22.h, color: Theme.of(context).colorScheme.primary,)),


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
          width: 120,
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.r),
                bottomLeft: Radius.circular(5.r)),
            child:widget.currentInventory.midVDSMedia!.isNotEmpty ?  Image.network(
              '${imageBaseUrl}${widget.currentInventory.midVDSMedia?[0].mediaSrc}' ,
              fit: BoxFit.cover,
            ) : Icon(Icons.directions_car_filled)
            // Image.asset(
            //   AppImages.inventoryTest,
            //   fit: BoxFit.cover,
            // ),
          ),
        ),

        Positioned(
          top: 0,
          left: 20,
          child: Container(
            height: 24.h,
            width: 20.w,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
                  offset: const Offset(0, 2)
                    ,
                  spreadRadius: 1 ,
                  blurRadius: 3
                )
              ],
              color: Theme.of(context).colorScheme.background ,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4.r) , bottomRight:Radius.circular(4.r) , )
            ),
            child: Center(child: Text(widget.currentInventory.age.toString())),
          ),
        ),
        isSelectMode ?? false   ?
        Positioned(
            bottom: -16,
            left: -16,
            child: Transform.scale(
                scale: 0.7,
                child: Checkbox(value: true, onChanged: (value) {}))) : const SizedBox()
      ],
    );
  }
}
