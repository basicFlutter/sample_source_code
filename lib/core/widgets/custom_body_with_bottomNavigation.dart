import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:global_bottom_navigation_bar/widgets/bottom_navigation_item.dart';
import 'package:new_panel/core/constants/blurMenu.dart';
import 'package:new_panel/core/constants/blurMenuItem.dart';
import 'package:new_panel/core/data/cache/cache_provider.dart';
import 'package:new_panel/core/enums/app_enums.dart';
import 'package:new_panel/core/widgets/appBar.dart';
import 'package:new_panel/core/widgets/searchbar_widget.dart';
import 'package:new_panel/features/home_page_feature/presentation/pages/home_page.dart';
import 'package:new_panel/features/inventory_page/presentation/pages/new_inventory.dart';
import 'package:new_panel/features/login_feature/data/models/login_map_model.dart';
import 'package:new_panel/features/login_feature/presentation/pages/login_page.dart';
import 'package:new_panel/features/main_page_feature/presentation/pages/main_page.dart';
import 'package:new_panel/features/main_page_feature/presentation/widgets/custom_buttom_navigation.dart';
import 'package:new_panel/main.dart';
import 'package:page_transition/page_transition.dart';

import '../constants/app_images.dart';
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>() ;
class CustomBodyWithBottomNavigation extends StatelessWidget {
  final TextEditingController searchbarController;

  final Widget body;
  final AppBarCustom? appBarCustom;
  final  Function(BlurMenuItem item)? onClickedItemMenu;
  List<BlurMenuItem>? menuItemList;


  int indexPageSelected;
  CustomBodyWithBottomNavigation(
      {Key? key, required this.searchbarController ,required this.body , required this.indexPageSelected , this.menuItemList , this.onClickedItemMenu , this.appBarCustom })
      : super(key: key);

  List<Widget> pageList = [
    const HomePage(),
     NewInventory(),
    Container(),
    Container()
  ];
  bool menuIsOpen = false;
  OverlayEntry? overlayEntry;



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: false,
      drawerEnableOpenDragGesture: false,
      bottomNavigationBar: CustomBottomNavigation(
        onSelected: (index) {

          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder) {
          return  const MainPage(
          );
          }));


        },
        indexSelected: indexPageSelected,
      ),

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
              // if(appBarCustom!= null)
              //   SizedBox(
              //     height: 8.h,
              //   ),
              if(appBarCustom!= null)
                appBarCustom!,
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: body),
            ],
          ),
        ),
      ),
    );
  }

  void _showBlurMenu(BuildContext context) {
    final overlayState = Overlay.of(context);


    if(overlayEntry != null){
      overlayEntry?.remove();
      overlayEntry = null;
    }else{
      overlayEntry = OverlayEntry(

          builder: (context) {
            return Positioned(
              top: 95.h,
              right: 16.w,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  overlayEntry?.remove();
                  overlayEntry = null;
                },
                child: BlurMenu(
                    width: 190.w,
                    height: 210.h,
                    itemHeight: 45.h,
                    onSelect: (BlurMenuItem item){
                      logger.i("on Selected Function called ${item.text}");
                      if(item.partName == "profile"){
                        // Navigator.push(
                        //   context,
                        //   PageTransition(
                        //       type: PageTransitionType.fade,
                        //       duration: const Duration(milliseconds: 200),
                        //       child:   ProfileSettingPage(
                        //         userInformation: Constants.customerInformation!,
                        //       )
                        //   ),
                        // );
                      }else if(item.partName == "Password and security"){
                        // Navigator.push(
                        //   context,
                        //   PageTransition(
                        //       type: PageTransitionType.fade,
                        //       duration: const Duration(milliseconds: 200),
                        //       child:   PasswordAndSecurityPage(
                        //         userInformation: Constants.customerInformation!,
                        //       )
                        //   ),
                        // );
                      }else if(item.partName == "trade"){

                      }else if(item.partName == "credit"){

                      }else if(item.partName == "LogOut"){

                        /// need add event logOut in login feature and call this event for logout and clear userName and Password
                        CacheProvider.saveString('userName',"");
                        CacheProvider.saveString('password',"");
                        //Constants.customerInformation?.password = "";

                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 200),
                              child:   LoginPage(loginMapModel: LoginMapModel())
                          ),
                        );

                      }
                      if(onClickedItemMenu != null){
                        onClickedItemMenu!(item);
                      }
                      Future.delayed(
                        const Duration(milliseconds: 150),
                            () {
                          overlayEntry?.remove();
                          overlayEntry = null;
                          menuIsOpen = false;
                        },
                      );
                    },

                    items: menuItemList??[
                      BlurMenuItem(text: "John Bee",imagePath: AppImages.profileTest , partName: "profileOne",),
                      const BlurMenuItem(text: "My Profile", icon: Icons.settings, partName: "profile",),
                      BlurMenuItem(text: "Password and security", imageSvgPath: AppImages.passwordIcon, partName: "Password and security",),
                      BlurMenuItem(text: "My Trade",imageSvgPath: AppImages.tradeIcon,partName: "trade"),
                      BlurMenuItem(text: "My Credit Application",imageSvgPath: AppImages.creditIcon,partName: "credit"),
                      BlurMenuItem(text: "Log Out",imageSvgPath: AppImages.creditIcon,partName: "LogOut"),
                    ]

                ),
              ),
            );
          });
      overlayState.insert(overlayEntry!);
    }


    // if(menuIsOpen){
    //   overlayEntry?.remove();
    //   menuIsOpen = true;
    // }else{
    // overlayState.insert(overlayEntry!);
    // menuIsOpen = true;
    // }
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
            InkWell(
              onTap: (){
                _showBlurMenu(context);
              },
              child: Container(
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
              ),
            )
          ],
        )
      ],
    );
  }
}
