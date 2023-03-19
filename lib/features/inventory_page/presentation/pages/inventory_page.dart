import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_body.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  TextEditingController searchbarController = TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomBody(searchbarController: searchbarController , body: Container(),),
    );
  }
}
