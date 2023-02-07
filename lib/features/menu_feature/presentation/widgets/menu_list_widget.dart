import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/custom_space.dart';
import '../../../inventory_feature/presentation/pages/inventory_page.dart';
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
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (builder){
              return const InventoryPage() ;
            })) ;
          },
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


      ],
    );
  }
}
