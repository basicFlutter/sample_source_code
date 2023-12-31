import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/widgets/blurMenu.dart';
import 'package:new_panel/core/widgets/blurMenuItem.dart';
import 'package:new_panel/core/data/cache/cache_provider.dart';
import 'package:new_panel/core/widgets/appBar.dart';
import 'package:new_panel/core/widgets/searchbar_widget.dart';
import 'package:new_panel/features/inventory_page/presentation/pages/new_inventory.dart';
import 'package:new_panel/main.dart';
import '../constants/app_images.dart';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>() ;
class CustomBody extends StatelessWidget {
  final TextEditingController searchbarController;

  final Widget body;
  final bool? showBottomNavigation;
  final AppBarCustom? appBarCustom;
  final  Function(BlurMenuItem item)? onClickedItemMenu;
  List<BlurMenuItem>? menuItemList;

  CustomBody(
      {Key? key, required this.searchbarController, required this.body , this.showBottomNavigation , this.appBarCustom , this.onClickedItemMenu , this.menuItemList})
      : super(key: key);

  List<Widget> pageList = [
     NewInventory(),
    Container(),
    Container()
  ];
  int indexPageSelected = 0;
  bool menuIsOpen = false;
  OverlayEntry? overlayEntry;


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: false,
      drawerEnableOpenDragGesture: false,
      backgroundColor: Theme.of(context).colorScheme.background,
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
              if(appBarCustom!= null)
                appBarCustom!,
              body,
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

                      }else if(item.partName == "Password and security"){

                      }else if(item.partName == "trade"){

                      }else if(item.partName == "credit"){

                      }else if(item.partName == "LogOut"){




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
