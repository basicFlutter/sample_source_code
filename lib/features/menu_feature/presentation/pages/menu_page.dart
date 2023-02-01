import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/widgets/custom_space.dart';
import 'package:new_panel/features/menu_feature/presentation/widgets/custom_title_widget.dart';
import 'package:new_panel/features/menu_feature/presentation/widgets/menu_item_widget.dart';
import '../../../../core/widgets/searchbar_widget.dart';
import '../../data/models/menu_item_model.dart';
import '../widgets/inventory_item_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<MenuItemModel> menuItems = [
    MenuItemModel(
        text: 'salam 1',
        svg: AppImages.leadLogo,
        isVisible: true,
        isEnable: true),
    MenuItemModel(
        text: 'salam 2 ',
        svg: AppImages.dealLogo,
        isVisible: true,
        isEnable: false),
    MenuItemModel(
        text: 'salam 3 ',
        svg: AppImages.dealLogo,
        isVisible: false,
        isEnable: false),
    MenuItemModel(
        text: 'salam 4 ',
        svg: AppImages.inventoryLogo,
        isVisible: true,
        isEnable: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
              for (var item in menuItems)
                if (item.isVisible)
                  MenuItemWidget(
                    title: item.text,
                    imageUrl: item.svg,
                    isEnable: item.isEnable,
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
              const InventoryItemWidget()
,
              CustomTitleWidget(
                title: 'Leads',
                onTap: () {},
              ),

              CustomTitleWidget(
                title: 'Deals',
                onTap: () {},
              ),

              CustomTitleWidget(
                title: 'Customers',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
