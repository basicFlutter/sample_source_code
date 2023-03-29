import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../features/inventory_page/data/data_sources/inventory_remote_data.dart';
import '../features/inventory_page/data/repositories/inventory_repository_imp.dart';
import '../features/inventory_page/domain/repositories/inventory_repository.dart';
import '../features/inventory_page/domain/use_cases/get_inventory_usecase.dart';
import '../features/inventory_page/presentation/manager/inventory_bloc.dart';
import '../features/theme_switcher/presentation/manager/theme_switcher_bloc.dart';

GetIt locator = GetIt.instance;

serviceLocator() async {

  locator.registerSingleton<Dio>(Dio());
locator.registerSingleton<ThemeSwitcherBloc>(ThemeSwitcherBloc());


  locator.registerSingleton<InventoryRemoteData>(InventoryRemoteData());

  locator.registerSingleton<InventoryRepository>(
      InventoryRepositoryImp(inventoryRemoteData: locator()));

  locator.registerSingleton<GetInventoryUseCase>(
      GetInventoryUseCase(inventoryRepository: locator()));

  locator.registerSingleton<InventoryBloc>(
      InventoryBloc(getInventoryUseCase: locator()));



}
