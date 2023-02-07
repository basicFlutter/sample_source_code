import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/exceptions/error_model.dart';
import 'package:new_panel/core/widgets/custom_alert_dialog.dart';
import 'package:new_panel/core/widgets/custom_space.dart';
import 'package:new_panel/features/menu_feature/presentation/widgets/custom_title_widget.dart';
import 'package:new_panel/features/menu_feature/presentation/widgets/inventory_List_widget.dart';
import 'package:new_panel/features/menu_feature/presentation/widgets/lead_list_widget.dart';
import 'package:new_panel/features/menu_feature/presentation/widgets/menu_item_widget.dart';
import 'package:new_panel/features/menu_feature/presentation/widgets/menu_list_widget.dart';
import '../../../../core/constants/app_enum.dart';
import '../../../../core/widgets/searchbar_widget.dart';
import '../../data/models/menu_item_model.dart';
import '../manager/menu_bloc.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ErrorModel alert = ErrorModel(
          alertType: 'INFO',
          type: 'ON_FORM',
          message: 'this is a temporary message i dont have any idea about it take it easy!');
      showDialog(
          context: context,
          builder: (builder) {
            return CustomAlertDialog(
              alert: alert,
            );
          });
    });
  }

  TextEditingController searchbarController = TextEditingController();

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
      body: BlocProvider(
        create: (context) => MenuBloc(),
        child: BlocConsumer<MenuBloc, MenuState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomVerticalSpace(
                      space: 19.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(AppImages.lorem),
                    ),
                    CustomVerticalSpace(
                      space: 11.h,
                    ),
                    SearchbarWidget(
                      searchbarController: searchbarController,
                    ),
                    CustomVerticalSpace(
                      space: 19.h,
                    ),
                    const MenuListWidget(),
                    CustomVerticalSpace(
                      space: 20.h,
                    ),
                    CustomTitleWidget(
                      title: 'Inventory',
                      onTap: () {},
                    ),
                    const InventoryListWidget(),
                    CustomTitleWidget(
                      title: 'Leads',
                      onTap: () {},
                    ),
                    const LeadListWidget(),
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
            );
          },
        ),
      ),
    );
  }
}
