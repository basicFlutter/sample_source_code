import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/widgets/custom_body.dart';
import '../../../inventory_page/domain/entities/inventory_entity.dart';
import '../widgets/custom_slider.dart';
import '../widgets/vehicle_information_view.dart';

class InventoryDetailPage extends StatefulWidget {
  final InventoryEntity currentInventory;

  const InventoryDetailPage({Key? key, required this.currentInventory})
      : super(key: key);

  @override
  State<InventoryDetailPage> createState() => _InventoryDetailPageState();
}

class _InventoryDetailPageState extends State<InventoryDetailPage>
    with TickerProviderStateMixin {
  TextEditingController searchbarController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animateTo(2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBody(
      searchbarController: searchbarController,
      body: _detailBody(),
    );
  }

  Widget _detailBody() {


    return SingleChildScrollView(
      child: Column(
        children: [
          _backButton(),
          SizedBox(
            height: 20.h,
          ),
          CustomSlider(
            carImages: widget.currentInventory.midVDSMedia ?? [],
          ),
          _priceAndName(),
          _editButton(),
          const VehicleInformationView()
        ],
      ),
    );
  }

  Widget _editButton() {
    return Stack(
          children: [
            Container(
              height: 39.h,
              width: 358.w,
              decoration:
                  BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100.r)),
                      color: Theme.of(context).colorScheme.primary),
            ),
            Positioned(
              bottom: 1,
              child: Container(
                height: 39.h,
                width: 358.w,
                decoration: BoxDecoration(    borderRadius: BorderRadius.all(Radius.circular(100.r)),
                    color: Theme.of(context).colorScheme.secondary),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.edit), Text('Edit')],
                ),
              ),
            )
          ],
        );
  }

  Widget _priceAndName() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientText(
                '${widget.currentInventory.vehicles!.modelYear} ${widget.currentInventory.vehicles!.make}${widget.currentInventory.vehicles!.model}',
                style: Theme.of(context).textTheme.titleMedium,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.onTertiaryContainer,
                  Theme.of(context).colorScheme.primary
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                '${widget.currentInventory.vehicles!.vinNumber}',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
          Column(
            children: [
              widget.currentInventory.specialPrice.toString() != '0'
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppUtils.dollarFormat(widget
                                .currentInventory.specialPrice
                                .toString()),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiaryContainer),
                          ),
                          Text(
                            AppUtils.dollarFormat(
                                widget.currentInventory.sellPrice.toString()),
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiaryContainer),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Text(
                        AppUtils.dollarFormat(
                            widget.currentInventory.sellPrice.toString()),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer),
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }

  Widget _tabs(List<Tab> tabs) {
    return SizedBox(
      height: 600.h,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  // strokeAlign: StrokeAlign.center,
                  color: Theme.of(context).colorScheme.primary,
                  width: 1,
                ),
              ),
            ),
            child: TabBar(
                unselectedLabelStyle: TextStyle(
                    decorationThickness: 2,
                    decorationColor: Theme.of(context).colorScheme.primary),
                controller: _tabController,
                tabs: tabs),
          ),
          Expanded(
            child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  const VehicleInformationView(),
                  Container(),
                  Container(),
                  Container(),
                ]),
          )
        ],
      ),
    );
  }

  Widget _backButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(AppImages.back))),
    );
  }
}
