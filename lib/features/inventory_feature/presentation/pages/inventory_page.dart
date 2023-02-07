import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/custom_space.dart';
import '../../../../core/widgets/searchbar_widget.dart';
import '../widgets/inventory_list_widget.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  TextEditingController searchBarController = TextEditingController() ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      body: _inventoryBody(),
    );
  }

  Widget _inventoryBody() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomVerticalSpace(
            space: 19.h,
          ),
          Align(
            alignment: Alignment.topLeft ,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(AppImages.lorem),
            ),
          ),
          CustomVerticalSpace(
            space: 11.h,
          ),
          SearchbarWidget(searchbarController: searchBarController,) ,
          const InventoryListWidget()
        ],
      ),
    );
  }
}
