import 'package:flutter/material.dart';
import 'package:new_panel/features/veicle_detail_feature/presentation/widgets/custom_item_expansion.dart';

class ItemPurchasesPrice extends StatelessWidget {
  const ItemPurchasesPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomItemExpansion(
          title: "PURCHASE PRICE",
          value: "10000",
        ),
      ],
    );
  }
}
