import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/data/network/api_provider.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../inventory_detail_page/presentation/pages/inventory_detail.dart';
import '../../domain/entities/inventory_entity.dart';
import '../manager/inventory_bloc.dart';
import '../manager/status/inventory_page_status.dart';

class VehicleItem extends StatefulWidget {
  final int itemIndex;
  final InventoryEntity currentInventory;

  const VehicleItem(
      {Key? key, required this.itemIndex, required this.currentInventory})
      : super(key: key);

  @override
  State<VehicleItem> createState() => _VehicleItemState();
}

class _VehicleItemState extends State<VehicleItem> {
  bool? isSelectMode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InventoryBloc, InventoryState>(
      builder: (context, state) {
        if (state.inventoryPageStatus is ChangeSelectModeStatus) {
          ChangeSelectModeStatus changeSelectMode =
              state.inventoryPageStatus as ChangeSelectModeStatus;
          isSelectMode = changeSelectMode.isSelectMode;
        }
        return isSelectMode ?? false
            ? Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor:
                        Theme.of(context).colorScheme.onTertiaryContainer,
                    value: widget.currentInventory.isActive != 1,
                    shape: const CircleBorder(),
                    onChanged: (bool? value) {},
                  ),
                  Expanded(child: _card(context))
                ],
              )
            : _card(context);
      },
    );
  }

  Widget _card(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 12.w),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return InventoryDetailPage(
              currentInventory: widget.currentInventory,
            );
          }));
        },
        onLongPress: () {
          BlocProvider.of<InventoryBloc>(context)
              .add(ChangeSelectModeEvent(isSelectMode: true));
        },
        child: Container(
          width:
              isSelectMode ?? false ? 318.w : MediaQuery.of(context).size.width,
          height: 136.h,
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
          child: Column(
            children: [
              SizedBox(
                height: 99.h,
                child: Row(
                  children: [
                    _cardPicture(),
                    SizedBox(
                      width: 5.w,
                    ),
                    _cardDetail(context),
                  ],
                ),
              ),
              _moreInformation(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _moreInformation(BuildContext context) {
    return Container(
      height: 34.h,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _moreInfoItem(
              context: context,
              icon: Icons.credit_score,
              title: 'Total Cost:',
              value: AppUtils.dollarFormat(
                  widget.currentInventory.totalCost.toString())),
          SizedBox(
              height: 20.h,
              width: 10.w,
              child: VerticalDivider(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
                thickness: 0.5,
              )),
          _moreInfoItem(
              context: context,
              icon: Icons.format_color_fill,
              title: 'Color:',
              value: widget.currentInventory.vehicles
                          ?.colorsVehiclesFrkExteriorColorToColors !=
                      null
                  ? widget.currentInventory.vehicles
                      ?.colorsVehiclesFrkExteriorColorToColors['name']
                  : '-'),

          SizedBox(
              height: 20.h,
              width: 10.w,
              child: VerticalDivider(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
                thickness: 0.5,
              )),

          Icon(
            Icons.build,
            size: 16.r,
          ),

          SizedBox(
            width: 15.w,
          ),

          isSelectMode ?? false
              ? const SizedBox()
              : Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                      color:
                          Theme.of(context).colorScheme.shadow.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 1),
                    )
                  ]),
                  child: Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      activeColor: AppColors.activeColor,
                      value: widget.currentInventory.isActive == 1,
                      onChanged: (bool value) {},
                    ),
                  ),
                ),

          // Switch(
          //     value: widget.currentInventory.isActive == 1,
          //     onChanged: (isActive) {})),
        ],
      ),
    );
  }

  Widget _moreInfoItem(
      {required BuildContext context,
      required IconData icon,
      required String title,
      required String value}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15.r,
          color: Theme.of(context).colorScheme.primary,
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    );
  }

  Widget _cardDetail(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: isSelectMode ?? false
                      ? 118.w
                      : MediaQuery.of(context).size.width / 3 + 20.w,
                  height: 22.h,
                  child: Text(
                    '${widget.currentInventory.vehicles?.modelYear} ${widget.currentInventory.vehicles?.make} ${widget.currentInventory.vehicles?.model}',
                    style: Theme.of(context).textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
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
                  'Odometer: ${widget.currentInventory.odometer} ${widget.currentInventory.odometerType == 2 ? 'KM' : 'MI'}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 90.w,
                child: Padding(
                  padding: EdgeInsets.only(top: 8.h, right: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (widget.currentInventory.specialPrice != 0)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _editButton(context),
                            if (AppUtils.dollarFormat(
                                        '${widget.currentInventory.specialPrice}')
                                    .length >
                                10)
                              SizedBox(
                                height: 15.h,
                                width: 60.w,
                                child: Text(
                                  AppUtils.dollarFormat(
                                      '${widget.currentInventory.specialPrice}'),
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.fade,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              )
                            else
                              SizedBox(
                                child: Text(
                                  AppUtils.dollarFormat(
                                      '${widget.currentInventory.specialPrice}'),
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.fade,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                          ],
                        )
                      else
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _editButton(context),
                            if (AppUtils.dollarFormat(
                                        '${widget.currentInventory.sellPrice}')
                                    .length >
                                10)
                              SizedBox(
                                height: 15.h,
                                width: 60.w,
                                child: Text(
                                  AppUtils.dollarFormat(
                                      '${widget.currentInventory.sellPrice}'),
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.fade,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              )
                            else
                              SizedBox(
                                child: Text(
                                  AppUtils.dollarFormat(
                                      '${widget.currentInventory.sellPrice}'),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                          ],
                        ),
                      if (widget.currentInventory.specialPrice != 0)
                        SizedBox(
                          width: 60.w,
                          child: Text(
                              AppUtils.dollarFormat(
                                  '${widget.currentInventory.sellPrice}'),
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.fade,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    decoration: TextDecoration.lineThrough,
                                  )),
                        )
                    ],
                  ),
                ),
              ),
              // isSelectMode ?? false
              //     ? const SizedBox()
              //     : SizedBox(
              //         height: 20.h,
              //         width: 20.w,
              //         child: Switch(
              //             value: widget.currentInventory.isActive == 1,
              //             onChanged: (isActive) {})),
              _options(context)
            ],
          )
        ],
      ),
    );
  }

  Widget _editButton(BuildContext context) {
    return SizedBox(
      height: 15.h,
      width: 15.w,
      child: GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.edit,
          size: 15,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }

  Widget _options(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.h, bottom: 5.h, right: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSelectMode ?? false
              ? const SizedBox()
              : GestureDetector(
                  onTap: () {
                    showModalBottomSheet(

                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(36),
                          ),
                        ),
                        isScrollControlled : true ,
                        context: context,
                        builder: (context) {
                          return _moreBottomSheet(context);
                        });
                  },
                  child: SvgPicture.asset(AppImages.more)),
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
            backgroundColor:
                Theme.of(context).colorScheme.secondary.withOpacity(0.5),
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
          // Container(
          //   height: 10.h,
          //   width: 10.w,
          //   decoration: BoxDecoration(
          //       color: Theme.of(context).primaryColor, shape: BoxShape.circle),
          // ),
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

  Widget _moreBottomSheet(BuildContext context) {
    return Container(
      // height: 360.h ,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(36.r),
            topLeft: Radius.circular(36.r),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _topDesignWidget(context),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bottomSheetItem(context: context, title: 'View Listing'),
                // _divider(context),
                _bottomSheetItem(context: context, title: 'Edit Listing'),
                // _divider(context),
                _bottomSheetItem(
                    context: context, title: 'Create Windows Sticker'),
                // _divider(context),
                _bottomSheetItem(context: context, title: 'Start Deal'),
                // _divider(context),
                _subMenuExpansion(context),
                // _divider(context),
                _bottomSheetItem(context: context, title: 'Appraisal'),
                _bottomSheetItem(context: context, title: 'Coming Soon'),
                _bottomSheetItem(context: context, title: 'Pending'),
                _bottomSheetItem(context: context, title: 'Mark As Sold'),
                _bottomSheetItem(context: context, title: 'Delete Listing'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Center _divider(BuildContext context) {
    return Center(
                child: Container(
                    width: 330.w
                    ,
                    child: Divider(color: Theme.of(context).colorScheme.shadow, thickness: 0.5,)),
              );
  }

  Widget _bottomSheetItem(
          {required BuildContext context, required String title}) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
        child: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      );

  Widget _topDesignWidget(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
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
          width: 100,
          height: 100,
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.r),
              ),
              child: widget.currentInventory.midVDSMedia!.isNotEmpty
                  ? Image.network(
                      '$imageBaseUrl${widget.currentInventory.midVDSMedia?[0].mediaSrc}',
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Icon(
                          Icons.directions_car_filled,
                          size: 50,
                          color: Theme.of(context)
                              .colorScheme
                              .onTertiaryContainer
                              .withOpacity(0.3),
                        );
                      },
                      cacheWidth: 100,
                      cacheHeight: 100,
                    )
                  : const Icon(Icons.directions_car_filled)
              // Image.asset(
              //   AppImages.inventoryTest,
              //   fit: BoxFit.cover,
              // ),
              ),
        ),
        _carAge(),
        if (widget.currentInventory.isComingSoon  == true || widget.currentInventory.vehicleStatus == 5 )
          Positioned(
            bottom: 6,
            child: SizedBox(
              width: 100.w,
              height: 20.h,
              child: Container(
                decoration:
                    BoxDecoration(color: AppColors.errorColor.withOpacity(0.5)),
                child: Center(
                    child: widget.currentInventory.isComingSoon == true
                        ? Text(
                            'Coming Soon',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        : Text('Pending' ,
                      style: Theme.of(context).textTheme.bodyMedium,),
                ),
              ),
            ),
          )
      ],
    );
  }

  Widget _carAge() {
    return Positioned(
      top: 0,
      left: 20,
      child: Container(
        height: 24.h,
        width: 20.w,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5),
                  offset: const Offset(0, 2),
                  spreadRadius: 1,
                  blurRadius: 3)
            ],
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(4.r),
              bottomRight: Radius.circular(4.r),
            )),
        child: Center(child: Text(widget.currentInventory.age.toString())),
      ),
    );
  }
}
