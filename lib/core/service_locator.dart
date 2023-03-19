import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../features/theme_switcher/presentation/manager/theme_switcher_bloc.dart';


GetIt locator = GetIt.instance;

serviceLocator() async {
  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton<ThemeSwitcherBloc>(ThemeSwitcherBloc());
}
