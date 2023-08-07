import 'package:flutter/material.dart';
import 'package:new_panel/features/veicle_detail_feature/presentation/widgets/custom_item_expansion.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [

        CustomItemExpansion(title: "TRIM", value: "ZRFWEFRERGTRYHGTRUHRFURUHYU"),
        CustomItemExpansion(title: "ENGIN", value: "8 Cylinder"),
        CustomItemExpansion(title: "ENGINE SIZE", value: "4.2 L"),
        CustomItemExpansion(title: "DRIVETRAIN", value: "AWD"),
        CustomItemExpansion(title: "PASSENGERS", value: "2"),
        CustomItemExpansion(title: "FUEL TYPE", value: "Gasoline Fuel"),
        CustomItemExpansion(title: "DOORS", value: "4"),
        CustomItemExpansion(title: "STOCK NUMBER", value: "98761234243552"),
        CustomItemExpansion(title: "VIN NUMBER", value: "98761234243552"),
        CustomItemExpansion(title: "INTERIOR COLOR", value: "Gray"),


      ],
    );
  }
}
