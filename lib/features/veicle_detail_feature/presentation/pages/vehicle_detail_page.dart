import 'package:flutter/material.dart';
import 'package:new_panel/core/widgets/appBar.dart';
import 'package:new_panel/core/widgets/custom_body.dart';
import 'package:new_panel/features/veicle_detail_feature/presentation/widgets/slider_detail.dart';

class VehicleDetailPage extends StatelessWidget {
   VehicleDetailPage({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomBody(
        searchbarController: searchController,
        appBarCustom : AppBarCustom(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),

          child: Column(
            children: [
              SliderDetail()
            ],

          ),
        )
    );
  }
}
