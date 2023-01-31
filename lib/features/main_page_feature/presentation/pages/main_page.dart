import 'package:flutter/material.dart';
import 'package:global_bottom_navigation_bar/widgets/bottom_navigation_item.dart';
import 'package:global_bottom_navigation_bar/widgets/scaffold_bottom_navigation.dart';

import '../../../menu_feature/presentation/pages/menu_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScaffoldGlobalBottomNavigation(
      floatingActionButtonAnimator: null,
      endDrawerEnableOpenDragGesture: false,
      drawerEnableOpenDragGesture: false,
      listOfChild: [const MenuPage(), Container(), Container(), Container()],
      listOfBottomNavigationItem: buildBottomNavigationItemList(),
    ));
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
