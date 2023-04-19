import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:global_bottom_navigation_bar/widgets/bottom_navigation_item.dart';
import 'package:global_bottom_navigation_bar/widgets/scaffold_bottom_navigation.dart';
import 'package:new_panel/core/constants/app_theme.dart';
import 'package:new_panel/features/inventory_page/presentation/pages/inventory_page.dart';
import 'package:new_panel/features/main_page_feature/presentation/widgets/custom_buttom_navigation.dart';
import 'package:new_panel/features/theme_switcher/presentation/manager/theme_switcher_bloc.dart';
import 'package:new_panel/main.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/custom_body.dart';
import '../../../home_page_feature/presentation/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  List<Widget> pageList = [
    const HomePage(),
    const InventoryPage(),
    Container(),
    Container()
  ];
  int indexPageSelected = 0;
  ThemeMode themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitcherBloc, ThemeSwitcherState>(
      builder: (context, state) {
        if (state is AppThemeSwitchState) {
          themeMode = state.themeMode;
        }
        return Scaffold(
          key:scaffoldKey ,

          drawer: ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20.r) , bottomRight:Radius.circular(20.r) ),
            child: Drawer(
              elevation:0,
              backgroundColor: Colors.white.withOpacity(0.3),
              child: Container(

                decoration: BoxDecoration(color: Colors.transparent,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20.r) , bottomRight:Radius.circular(20.r) ),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AppImages.drawerBackground )) ,


                ),
                  child: Column(children: [
                    
                  ],)
              ),
            ),
          ),
          body: pageList[indexPageSelected],
          bottomNavigationBar: CustomBottomNavigation(
            onSelected: (index) {
              logger.w(index);
              indexPageSelected = index;
              setState(() {});
            },
            indexSelected: indexPageSelected,
          ),
        ) ;

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
