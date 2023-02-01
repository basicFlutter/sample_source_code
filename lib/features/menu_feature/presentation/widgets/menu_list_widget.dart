import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/custom_space.dart';
import 'custom_title_widget.dart';
import 'menu_item_widget.dart';

class MenuListWidget extends StatelessWidget {
  const MenuListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
