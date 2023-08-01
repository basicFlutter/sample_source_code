import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:global_bottom_navigation_bar/widgets/bottom_navigation_item.dart';
import 'package:global_bottom_navigation_bar/widgets/scaffold_bottom_navigation.dart';
import 'package:new_panel/core/constants/app_theme.dart';
import 'package:new_panel/features/inventory_page/presentation/pages/new_inventory.dart';
import 'package:new_panel/features/main_page_feature/presentation/widgets/custom_buttom_navigation.dart';
import 'package:new_panel/features/theme_switcher/presentation/manager/theme_switcher_bloc.dart';
import 'package:new_panel/main.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/custom_body.dart';
import '../../../home_page_feature/presentation/pages/home_page.dart';
import '../widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
   const MainPage({Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  List<Widget> pageList = [
    const HomePage(),
     NewInventory(),
    Container(),
    Container()
  ];

  ThemeMode themeMode = ThemeMode.light;
  int indexPageSelected = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitcherBloc, ThemeSwitcherState>(
      builder: (context, state) {
        if (state is AppThemeSwitchState) {
          themeMode = state.themeMode;
        }
        return Scaffold(
          key: scaffoldKey,
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          drawer:const CustomDrawer() ,
          body: Stack(
            alignment: Alignment.topCenter,
              children: [
                pageList[indexPageSelected],
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 1.sw,
                    height: 60.h,
                    decoration:  BoxDecoration(
                      // color: Color(0xff00A1F0)
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.background,
                          Colors.transparent,
                        ],
                        begin:  Alignment.bottomCenter,
                        end:  Alignment.topCenter,
                        stops: [1, 0],
                        // tileMode: TileMode.clamp
                      ),
                    ),

                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomBottomNavigation(
                    onSelected: (index) {
                     indexPageSelected = index;
                      setState(() {});
                    },
                    indexSelected: indexPageSelected,
                  ),
                ),


              ],


          ),
          // bottomNavigationBar: CustomBottomNavigation(
          //   onSelected: (index) {
          //     indexPageSelected = index;
          //     setState(() {});
          //   },
          //   indexSelected: indexPageSelected,
          // ),
        );

        //   MaterialApp(
        //   debugShowCheckedModeBanner: false,
        //   theme: Style.lightTheme,
        //   darkTheme: Style.darkTheme,
        //   themeMode: themeMode,
        //   home: ,
        // );
      },
    );
  }











  List<BottomNavigationItem> buildBottomNavigationItemList() => [
        BottomNavigationItem(
          activeIcon: const Icon(
            Icons.dashboard,
          ),
          inActiveIcon: const Icon(
            Icons.dashboard,
          ),
          title: 'more',
          color: Colors.white,
          vSync: this,
        ),
        BottomNavigationItem(
          activeIcon: const Icon(
            Icons.add_box,
          ),
          inActiveIcon: const Icon(
            Icons.add_box_rounded,
          ),
          title: 'more',
          color: Colors.white,
          vSync: this,
        ),
        BottomNavigationItem(
          activeIcon: const Icon(
            Icons.notifications_rounded,
          ),
          inActiveIcon: const Icon(
            Icons.notifications_rounded,
          ),
          title: 'learn',
          color: Colors.white,
          vSync: this,
        ),
        BottomNavigationItem(
          activeIcon: const Icon(
            Icons.person,
          ),
          inActiveIcon: const Icon(
            Icons.person,
          ),
          title: 'more',
          color: Colors.white,
          vSync: this,
        ),
      ];
}
