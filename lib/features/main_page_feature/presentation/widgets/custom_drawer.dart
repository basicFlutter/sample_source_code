import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/features/main_page_feature/presentation/widgets/custom_submenu.dart';
import 'package:new_panel/features/main_page_feature/presentation/widgets/drawerItem.dart';
import 'package:new_panel/features/main_page_feature/presentation/widgets/expansion_item_menu.dart';
import 'package:new_panel/features/main_page_feature/presentation/widgets/sub_menu.dart';
import 'package:new_panel/features/main_page_feature/presentation/widgets/submenu_model.dart';
import 'package:new_panel/main.dart';

import '../../../../core/constants/app_images.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return _drawer(context);
  }


  Widget _drawer(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r), bottomRight: Radius.circular(20.r)),
      child: Drawer(
        elevation: 0,
        width: 267.w,
        // backgroundColor: Colors.white.withOpacity(0.3),
        child: Container(
          width: 267.w,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r)),
              image: DecorationImage(
                  fit: BoxFit.cover,

                  image: AssetImage(AppImages.drawerBackground)),
            ),
            child: Column(
              children: [
                _backButton(context),

                Expanded(
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          DrawerItem(
                            imageSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.dashboard : AppImages.dashboardDark,
                            title: 'Dashboard',
                          ),


                          ExpansionItemMenu(
                            title: "Inventory",
                            onTap: (SubmenuModel itemClicked){
                              logger.e(itemClicked.title);
                            },
                            iconSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.inventory : AppImages.inventoryDark,
                            children: [
                              SubmenuModel(title: 'Customer Reports'),
                              SubmenuModel(title: 'Add New Prospect'),
                              SubmenuModel(title: 'Quick Credit'),
                              SubmenuModel(title: 'Appointments'),
                              SubmenuModel(title: 'Send Bulk Email'),
                              SubmenuModel(title: 'Send Bulk Sms'),

                            ],


                          ),


                          DrawerItem(
                            imageSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.testDrive : AppImages.testDriveDark,
                            title: 'Test Drive',
                          ),

                          DrawerItem(
                            imageSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.customers : AppImages.customersDark,
                            title: 'Customers',
                          ),

                          DrawerItem(
                            imageSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.leads : AppImages.leadsDark,
                            title: 'Leads',
                          ),


                          ExpansionItemMenu(
                            title: "Deal",
                            onTap: (SubmenuModel itemClicked){

                            },
                            iconSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.dealIcon : AppImages.dealIconDark,
                            children: [
                              SubmenuModel(title: 'test')
                            ],

                          ),

                          DrawerItem(
                            imageSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.bhph : AppImages.bhphDark,
                            title: 'BHPH',
                          ),

                          ExpansionItemMenu(
                            title: "Marketing",
                            onTap: (SubmenuModel itemClicked){

                            },
                            iconSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.marketing : AppImages.makeIconDark,
                            children:[
                              SubmenuModel(title: 'test')
                            ],

                          ),

                          // _expansionItem(
                          //     context: context,
                          //     title: 'Marketing',
                          //     child: [],
                          //     imageUrl: AppImages.marketing),



                          DrawerItem(
                            imageSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.accounting : AppImages.accountingDark,
                            title: 'Accounting',
                          ),

                          DrawerItem(
                            imageSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.vendor : AppImages.vendorDark,
                            title: 'Vendor',
                          ),

                          DrawerItem(
                            imageSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.user : AppImages.userDark,
                            title: 'User',
                          ),

                          DrawerItem(
                            imageSvgPath: Theme.of(context).brightness == Brightness.light ? AppImages.billing : AppImages.billingDark,
                            title: 'Billing',
                          ),

                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }





  Widget _expansionItem(
      {required BuildContext context,
        required String title,
        required String imageUrl,
        required List<Widget> child}) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(6.r)),
      child: Theme(
        data: ThemeData(
          dividerColor:
          Theme.of(context).colorScheme.background.withOpacity(0.4),
        ),
        child: ExpansionTile(
            children: child,
            backgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(0.3),
            iconColor: Theme.of(context).colorScheme.background,
            collapsedIconColor: Theme.of(context).colorScheme.background,
            tilePadding: EdgeInsets.zero,
            title: _drawerItem(
                context: context, imageUrl: imageUrl, title: title)),
      ),
    );
  }

  Widget _drawerItem(
      {required BuildContext context,
        required String imageUrl,
        required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          SvgPicture.asset(imageUrl),
          SizedBox(
            width: 20.w,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 10.w,top: 0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon:  Icon(Icons.arrow_back,
                  color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark
              ))
        ],
      ),
    );
  }
}
