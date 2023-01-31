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
          endDrawerEnableOpenDragGesture: false ,
      drawerEnableOpenDragGesture: false ,
      listOfChild: [
        const MenuPage() ,
        Container() ,
        Container() ,
        Container()
      ],
      listOfBottomNavigationItem: buildBottomNavigationItemList(),
    ));
  }

  List<BottomNavigationItem> buildBottomNavigationItemList() => [
    BottomNavigationItem(
      activeIcon: Icon(
        Icons.dashboard,
        color: Theme.of(context).primaryColor,
        size: 35,
      ),
      inActiveIcon: Icon(
        Icons.dashboard,
        color:  Theme.of(context).secondaryHeaderColor,
        size: 25,
      ),
      title: 'more',
      color: Colors.white,
      vSync: this,
    ),
    BottomNavigationItem(
      activeIcon: Icon(
        Icons.add_box,
        color: Theme.of(context).primaryColor,
        size: 35,
      ),
      inActiveIcon: Icon(
        Icons.add_box_rounded,
        color:  Theme.of(context).secondaryHeaderColor,
        size: 35,
      ),
      title: 'more',
      color: Colors.white,
      vSync: this,
    ),
        BottomNavigationItem(
          activeIcon: Icon(
            Icons.notifications_rounded,
            color: Theme.of(context).primaryColor,
            size: 35,
          ),
          inActiveIcon: Icon(
            Icons.notifications_rounded,
            color:  Theme.of(context).secondaryHeaderColor,
            size: 35,
          ),
          title: 'learn',
          color: Colors.white,
          vSync: this,
        ),

        BottomNavigationItem(
          activeIcon: Icon(
            Icons.person,
            color: Theme.of(context).primaryColor,
            size: 35,
          ),
          inActiveIcon: Icon(
            Icons.person,
            color:  Theme.of(context).secondaryHeaderColor,
            size: 35,
          ),
          title: 'more',
          color: Colors.white,
          vSync: this,
        ),
      ];
}
