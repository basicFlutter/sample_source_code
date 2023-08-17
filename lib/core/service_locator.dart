import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:new_panel/core/suggestions/data/data_sources/remote/suggestions_api_provider.dart';
import 'package:new_panel/core/suggestions/data/repositories/suggestions_repository_impl.dart';
import 'package:new_panel/core/suggestions/domain/repositories/suggestions_rpository.dart';
import 'package:new_panel/core/suggestions/domain/use_cases/suggestions_usecase.dart';
import 'package:new_panel/features/veicle_detail_feature/data/data_sources/inventory_image_data_provider.dart';
import 'package:new_panel/features/veicle_detail_feature/data/repositories/get_images_inventory_repository_impl.dart';
import 'package:new_panel/features/veicle_detail_feature/domain/repositories/get_images_inventory_repository.dart';
import 'package:new_panel/features/veicle_detail_feature/domain/use_cases/get_image_slider_useCase.dart';

import '../features/inventory_page/data/data_sources/inventory_remote_data.dart';
import '../features/inventory_page/data/repositories/inventory_repository_imp.dart';
import '../features/inventory_page/domain/repositories/inventory_repository.dart';
import '../features/inventory_page/domain/use_cases/get_inventory_usecase.dart';


GetIt locator = GetIt.instance;

serviceLocator() async {

  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton<InventoryRemoteData>(InventoryRemoteData());
  locator.registerSingleton<SuggestionApiProvider>(SuggestionApiProvider());
  locator.registerSingleton<InventoryImageDataProvider>(InventoryImageDataProvider());


  ///############################################## Repository #############################

  locator.registerSingleton<SuggestionsRepository>(
      SuggestionsRepositoryImpl(suggestionApiProvider: locator()));

  locator.registerSingleton<InventoryRepository>(
      InventoryRepositoryImp(inventoryRemoteData: locator()));


  locator.registerSingleton<GetImageInventoryRepository>(
      GetImagesInventoryRepositoryImpl(inventoryImageDataProvider: locator()));



  ///############################################## UseCase #############################
  locator.registerSingleton<SuggestionsUseCase>(
      SuggestionsUseCase(suggestionsRepository: locator()));


  locator.registerSingleton<GetInventoryUseCase>(
      GetInventoryUseCase(inventoryRepository: locator()));


  locator.registerSingleton<GetImageSliderUseCase>(
      GetImageSliderUseCase(getImageInventoryRepository: locator()));







}
