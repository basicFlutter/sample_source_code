import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/widgets/searchbar_widget.dart';
import 'package:new_panel/features/home_page_feature/presentation/pages/home_page.dart';
import 'package:new_panel/features/inventory_page/presentation/pages/new_inventory.dart';
import 'package:new_panel/features/main_page_feature/presentation/widgets/custom_buttom_navigation.dart';

import '../constants/app_images.dart';
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>() ;
class CustomBody extends StatelessWidget {
  final TextEditingController searchbarController;

  final Widget body;
  final bool? showBottomNavigation;

  CustomBody(
      {Key? key, required this.searchbarController, required this.body , this.showBottomNavigation})
      : super(key: key);

  List<Widget> pageList = [
    const HomePage(),
     NewInventory(),
    Container(),
    Container()
  ];
  int indexPageSelected = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: false,
      drawerEnableOpenDragGesture: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      // drawer: Drawer(
      //
      //   child: Column(
      //     children: [
      //       Container(
      //         width: MediaQuery.of(context).size.width,
      //         height: MediaQuery.of(context).size.height,
      //         decoration: BoxDecoration(
      //           image: DecorationImage(image: AssetImage(AppImages.drawerBackground)
      //
      //           )
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false ,
      //   // actions: [],
      //   // backgroundColor: Theme.of(context).colorScheme.background,
      //   backgroundColor: Colors.grey,
      //   toolbarHeight: 93.h,
      //   elevation: 0,
      //
      //
      //   title:Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //     SizedBox(
      //       height: 10.h,
      //     ),
      //   _topOptions(context),
      //   SizedBox(
      //     height: 10.h,
      //   ),
      //   SearchbarWidget(
      //     searchbarController: searchbarController,
      //   ),
      // ],) ,),

      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 11.h),
                height: 92.h,
                width: 358.w,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    _topOptions(context),
                    SizedBox(
                      height: 4.h,
                    ),

                    SearchbarWidget(
                      searchbarController: searchbarController,
                    ),
                  ],),
              ),
              body,
            ],
          ),
        ),
      ),
    );
  }

  Widget _topOptions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: (){
                scaffoldKey.currentState?.openDrawer();
              },
              child: Container(
                width: 35.r,
                height: 35.r,
                padding: EdgeInsets.all(9.75.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor
                ),
                child: SvgPicture.asset(
                  AppImages.menu,
                  height: 16.5.r,
                  width: 16.5.r,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Container(
              width: 35.r,
              height: 35.r,
              padding: EdgeInsets.all(9.r),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor
              ),
              child: SvgPicture.asset(
                AppImages.ring,
                height: 15.r,
                width: 15.r,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),

          ],
        ),
        SvgPicture.asset(AppImages.lorem),
        Row(
          children: [
            Container(
              width: 35.r,
              height: 35.r,
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor
              ),
              child: SvgPicture.asset(
                AppImages.add,
                height: 16.5.r,
                width: 16.5.r,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),

            SizedBox(
              width: 10.w,
            ),
            Container(
              width: 48.r,
              height: 48.r,

              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(50.r),
                  border: Border.all(color: Theme.of(context).primaryColor)),
              child: Padding(
                padding:  EdgeInsets.all(2.r),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: Image.asset(
                      AppImages.profileTest,
                      fit: BoxFit.cover,
                      width: 40.r,
                      height: 40.r,
                    )),
              ),
            )
          ],
        )
      ],
    );
  }
}
