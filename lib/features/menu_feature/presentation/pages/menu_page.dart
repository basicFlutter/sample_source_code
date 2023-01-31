import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/widgets/custom_space.dart';
import 'package:new_panel/features/menu_feature/presentation/widgets/custom_title_widget.dart';
import 'package:new_panel/features/menu_feature/presentation/widgets/menu_item_widget.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/widgets/searchbar_widget.dart';
import '../widgets/inventory_item_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSpace(
              space: 19.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(AppImages.lorem),
            ),
            CustomSpace(
              space: 11.h,
            ),
            const SearchbarWidget(),
            CustomSpace(
              space: 19.h,
            ),
            MenuItemWidget(
              title: 'Dashboard',
              imageUrl: AppImages.dashboardLogo,
            ),
            MenuItemWidget(
              title: 'Inventory',
              imageUrl: AppImages.inventoryLogo,
            ),
            MenuItemWidget(
              title: 'Customers',
              imageUrl: AppImages.customerLogo,
            ),
            MenuItemWidget(
              title: 'Leads',
              imageUrl: AppImages.leadLogo,
            ),
            MenuItemWidget(
              title: 'Deals',
              imageUrl: AppImages.dealLogo,
            ),
            CustomSpace(
              space: 20.h,
            ),
            CustomTitleWidget(
              title: 'Inventory',
              onTap: () {},
            ),

            InventoryItemWidget()



          ],
        ),
      ),
    );
  }
}
