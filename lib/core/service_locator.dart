
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

serviceLocator() async {
  locator.registerSingleton<Dio>(Dio());


  /// /// *******************************     Register Repository      ***********************************


  /// /// *********************************    Register Use Case      *******************


  ///  *********************************    Register bloc      *******************


}
