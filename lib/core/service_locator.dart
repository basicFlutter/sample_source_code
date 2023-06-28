import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:new_panel/core/suggestions/data/data_sources/remote/suggestions_api_provider.dart';
import 'package:new_panel/core/suggestions/data/repositories/suggestions_repository_impl.dart';
import 'package:new_panel/core/suggestions/domain/repositories/suggestions_rpository.dart';
import 'package:new_panel/core/suggestions/domain/use_cases/suggestions_usecase.dart';
import 'package:new_panel/features/inventory_page/domain/use_cases/get_whole_inventory_use_case.dart';
import 'package:new_panel/features/login_feature/data/data_sources/login_remote_data.dart';
import 'package:new_panel/features/login_feature/data/repositories/login_repository_imp.dart';
import 'package:new_panel/features/login_feature/domain/repositories/login_repository.dart';
import 'package:new_panel/features/login_feature/domain/use_cases/auth_google_use_case.dart';
import 'package:new_panel/features/login_feature/domain/use_cases/login_use_case.dart';
import 'package:new_panel/features/login_feature/presentation/manager/login_bloc.dart';

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
  locator.registerSingleton<LoginRemoteData>(LoginRemoteData());
  locator.registerSingleton<SuggestionApiProvider>(SuggestionApiProvider());


  ///############################################## Repository #############################

  locator.registerSingleton<SuggestionsRepository>(
      SuggestionsRepositoryImpl(suggestionApiProvider: locator()));

  locator.registerSingleton<InventoryRepository>(
      InventoryRepositoryImp(inventoryRemoteData: locator()));

  locator.registerSingleton<LoginRepository>(
      LoginRepositoryImp(loginRemoteData: locator()));

  ///############################################## UseCase #############################
  locator.registerSingleton<SuggestionsUseCase>(
      SuggestionsUseCase(suggestionsRepository: locator()));

  locator.registerSingleton<LoginUseCase>(
      LoginUseCase(loginRepository: locator()));

  locator.registerSingleton<AuthGoogleUseCase>(
      AuthGoogleUseCase(loginRepository: locator()));

  locator.registerSingleton<GetInventoryUseCase>(
      GetInventoryUseCase(inventoryRepository: locator()));

  locator.registerSingleton<GetWholeInventoryUseCase>(
      GetWholeInventoryUseCase(inventoryRepository: locator()));


  ///############################################## Bloc #############################

  locator.registerSingleton<LoginBloc>(
      LoginBloc(loginUseCase: locator() , authGoogleUseCase: locator()));

  locator.registerSingleton<InventoryBloc>(
      InventoryBloc(getInventoryUseCase: locator() , getWholeInventoriesUseCase: locator()));





}
