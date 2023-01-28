import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:new_panel/features/theme_switcher/presentation/manager/theme_switcher_bloc.dart';
import 'package:new_panel/features/verify_feature/domain/repositories/verify_repository.dart';
import 'package:new_panel/features/verify_feature/domain/use_cases/verify_use_case.dart';

import '../features/verify_feature/data/data_sources/verify_remote_data.dart';
import '../features/verify_feature/data/repositories/verify_repository_imp.dart';
import '../features/verify_feature/presentation/manager/verify_bloc.dart';

GetIt locator = GetIt.instance;

serviceLocator() async {
  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton<VerifyRemoteData>(VerifyRemoteData());

  /// /// *******************************     Register Repository      ***********************************
  locator.registerSingleton<VerifyRepository>(
      VerifyRepositoryImp(verifyRemoteData: locator()));

  /// /// *********************************    Register Use Case      *******************

  locator.registerSingleton<VerifyUseCase>(
      VerifyUseCase(verifyRepository: locator()));

  ///  *********************************    Register bloc      *******************

  locator.registerSingleton<ThemeSwitcherBloc>(ThemeSwitcherBloc());

  locator.registerSingleton<VerifyBloc>(VerifyBloc(verifyUseCase: locator()));
}
