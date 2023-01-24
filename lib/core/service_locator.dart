
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:new_panel/features/theme_switcher/presentation/manager/theme_switcher_bloc.dart';

GetIt locator = GetIt.instance;

serviceLocator() async {
  locator.registerSingleton<Dio>(Dio());


  /// /// *******************************     Register Repository      ***********************************


  /// /// *********************************    Register Use Case      *******************


  ///  *********************************    Register bloc      *******************

  locator.registerSingleton<ThemeSwitcherBloc>(ThemeSwitcherBloc());
}
