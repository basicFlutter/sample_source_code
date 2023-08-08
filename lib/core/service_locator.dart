import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:new_panel/core/suggestions/data/data_sources/remote/suggestions_api_provider.dart';
import 'package:new_panel/core/suggestions/data/repositories/suggestions_repository_impl.dart';
import 'package:new_panel/core/suggestions/domain/repositories/suggestions_rpository.dart';
import 'package:new_panel/core/suggestions/domain/use_cases/suggestions_usecase.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/data_sources/local/crop_image_class.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/data_sources/local/object_detection.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/data_sources/local/process_scanner.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/data_sources/remote.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/improve_image_driver_license.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/repositories/crop_image_repository_impl.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/repositories/ocr_driver_license_repository_impl.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/repositories/scanner_driver_license_rpository_impl.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/repositories/vin_number_barcode_repository_impl.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/repositories/crop_image_repository.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/repositories/ocr_driver_license_repository.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/repositories/scanner_repository.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/repositories/vin_number_barcode_scanner_repository.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/use_cases/barcode_scanner_useCase.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/use_cases/cameraImage_to_InputImage_UseCase.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/use_cases/camera_useCase.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/use_cases/crop_image_useCase.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/use_cases/detect_driver_license_singleImage_useCase.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/use_cases/ocr_driver_license_useCase.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/use_cases/scanner_drivers_license_useCase.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/use_cases/vin_number_scanner_useCase.dart';
import 'package:new_panel/features/forgotPassword_feature/data/data_sources/forgot_password_data_provider.dart';
import 'package:new_panel/features/forgotPassword_feature/data/repositories/forgot_password_repostitory_impl.dart';
import 'package:new_panel/features/forgotPassword_feature/domain/repositories/forgot_password_repository.dart';
import 'package:new_panel/features/forgotPassword_feature/domain/use_cases/forgot_password_useCase.dart';
import 'package:new_panel/features/inventory_page/domain/use_cases/get_whole_inventory_use_case.dart';
import 'package:new_panel/features/login_feature/data/data_sources/login_remote_data.dart';
import 'package:new_panel/features/login_feature/data/repositories/login_repository_imp.dart';
import 'package:new_panel/features/login_feature/domain/repositories/login_repository.dart';
import 'package:new_panel/features/login_feature/domain/use_cases/auth_google_use_case.dart';
import 'package:new_panel/features/login_feature/domain/use_cases/login_use_case.dart';
import 'package:new_panel/features/login_feature/presentation/manager/login_bloc.dart';
import 'package:new_panel/features/veicle_detail_feature/data/data_sources/inventory_image_data_provider.dart';
import 'package:new_panel/features/veicle_detail_feature/data/repositories/get_images_inventory_repository_impl.dart';
import 'package:new_panel/features/veicle_detail_feature/domain/repositories/get_images_inventory_repository.dart';
import 'package:new_panel/features/veicle_detail_feature/domain/use_cases/get_image_slider_useCase.dart';

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
  locator.registerSingleton<ForgotPasswordDataProvider>(ForgotPasswordDataProvider());
  locator.registerSingleton<InventoryImageDataProvider>(InventoryImageDataProvider());
  locator.registerSingleton<CropImageClass>(CropImageClass());
  locator.registerSingleton<ProcessScanner>(ProcessScanner());
  locator.registerSingleton<ImproveImageDriverLicense>(ImproveImageDriverLicense());
  locator.registerSingleton<AddressProvider>(AddressProvider());


  ///############################################## Repository #############################

  locator.registerSingleton<SuggestionsRepository>(
      SuggestionsRepositoryImpl(suggestionApiProvider: locator()));

  locator.registerSingleton<InventoryRepository>(
      InventoryRepositoryImp(inventoryRemoteData: locator()));

  locator.registerSingleton<LoginRepository>(
      LoginRepositoryImp(loginRemoteData: locator()));
  locator.registerSingleton<ForgotPasswordRepository>(
      ForgotPasswordRepositoryImpl(forgotPasswordDataProvider: locator()));

  locator.registerSingleton<GetImageInventoryRepository>(
      GetImagesInventoryRepositoryImpl(inventoryImageDataProvider: locator()));


  locator.registerSingleton<ScannerRepository>(
      ScannerDriverLicenseRepositoryImpl());

  locator.registerSingleton<CropImageRepository>(
      CropImageRepositoryImpl(cropImageClass: locator()));


  locator.registerSingleton<OcrDriverLicenseRepository>(
      OcrDriverLicenseRepositoryImpl(improveImageDriverLicense: locator(),processOcr: locator(),addressProvider: locator()));


  locator.registerSingleton<VinNumberBarcodeScannerRepository>(
      VinNumberScannerRepositoryImpl(processScanner: locator()));



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

  locator.registerSingleton<ForgotPasswordUseCase>(
      ForgotPasswordUseCase(forgotPasswordRepository: locator()));

  locator.registerSingleton<GetImageSliderUseCase>(
      GetImageSliderUseCase(getImageInventoryRepository: locator()));


  locator.registerSingleton<InitCameraUseCase>(
      InitCameraUseCase());

  locator.registerSingleton<ScannerDriversLicenseUseCase>(
      ScannerDriversLicenseUseCase(scannerRepository: locator()));

  locator.registerSingleton<CameraImageToInputImageUseCase>(
      CameraImageToInputImageUseCase());

  locator.registerSingleton<CropImageUseCase>(
      CropImageUseCase(cropImageRepository: locator()));

  locator.registerSingleton<OcrDriverLicenseUseCase>(
      OcrDriverLicenseUseCase(ocrDriverLicenseRepository: locator()));

  locator.registerSingleton<DetectDriverLicenseSingleImageUseCase>(
      DetectDriverLicenseSingleImageUseCase(scannerRepository: locator()));

  locator.registerSingleton<VinNumberScannerUseCase>(
      VinNumberScannerUseCase(vinNumberScannerRepository: locator()));

  locator.registerSingleton<BarcodeScannerUseCase>(
      BarcodeScannerUseCase( vinNumberBarcodeScannerRepository: locator()));


  ///############################################## Bloc #############################

  locator.registerSingleton<LoginBloc>(
      LoginBloc(loginUseCase: locator() , authGoogleUseCase: locator()));

  locator.registerSingleton<InventoryBloc>(
      InventoryBloc(getInventoryUseCase: locator() , getWholeInventoriesUseCase: locator()));





}
