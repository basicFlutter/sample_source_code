import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_panel/features/main_page_feature/presentation/widgets/sub_menu.dart';

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
        backgroundColor: Colors.white.withOpacity(0.3),
        child: Container(
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
                          _drawerItem(
                              context: context,
                              title: 'Dashboard',
                              imageUrl: AppImages.dashboard),
                          _expansionItem(
                              context: context,
                              title: 'Inventpry',
                              child: [const SubMenu()],
                              imageUrl: AppImages.inventory),
                          _drawerItem(
                              context: context,
                              title: 'Test Drive',
                              imageUrl: AppImages.testDrive),
                          _drawerItem(
                              context: context,
                              title: 'Customers',
                              imageUrl: AppImages.customers),
                          _drawerItem(
                              context: context,
                              title: 'Leads',
                              imageUrl: AppImages.leads),
                          _expansionItem(
                              context: context,
                              title: 'Deal',
                              child: [

                              ],
                              imageUrl: AppImages.deal),
                          _drawerItem(
                              context: context,
                              title: 'BHPH',
                              imageUrl: AppImages.bhph),
                          _expansionItem(
                              context: context,
                              title: 'Marketing',
                              child: [],
                              imageUrl: AppImages.marketing),
                          _drawerItem(
                              context: context,
                              title: 'Accounting',
                              imageUrl: AppImages.accounting),
                          _drawerItem(
                              context: context,
                              title: 'Vendor',
                              imageUrl: AppImages.vendor),
                          _drawerItem(
                              context: context,
                              title: 'User',
                              imageUrl: AppImages.user),
                          _drawerItem(
                              context: context,
                              title: 'Billing',
                              imageUrl: AppImages.billing),
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
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back, color: Colors.white))
        ],
      ),
    );
  }
}
