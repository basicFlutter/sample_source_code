import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../core/constants/app_images.dart';
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

class _InventoryDetailPageState extends State<InventoryDetailPage> with TickerProviderStateMixin {
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
    return  CustomBody(
        searchbarController: searchbarController,
        body: _detailBody(),

    );
  }

  Widget _detailBody() {

    List<Tab> tabs = [
      Tab( child:  Text('Vehicle Information' , textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleSmall!.copyWith(
        fontSize: 10.sp
      ),)),
      Tab( child:  Text('Comment', style: Theme.of(context).textTheme.titleSmall,)),
      Tab( child:  Text('Option', style: Theme.of(context).textTheme.titleSmall,)),
      Tab( child:  Text('Warranty', style: Theme.of(context).textTheme.titleSmall,)),

    ];

        return SingleChildScrollView(
          child: Column(

            children: [
              _backButton(),
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
              SizedBox(
                height: 20.h,
              ),
              CustomSlider(
                carImages: widget.currentInventory.midVDSMedia ?? [],
                specialPrice: widget.currentInventory.sellPrice.toString(),
                sellPrice: widget.currentInventory.specialPrice.toString(),
              ) ,
              _tabs(tabs)
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
                   width:1,
                 ),
               ),
             ) ,
             child: TabBar(
               unselectedLabelStyle:  TextStyle(

                 decorationThickness: 2,

                 decorationColor: Theme.of(context).colorScheme.primary
               ),
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
         ],),
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
