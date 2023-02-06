import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:new_panel/features/forgot_pass_feature/domain/repositories/forget_pass_repository.dart';
import 'package:new_panel/features/forgot_pass_feature/domain/use_cases/forget_pass_use_case.dart';
import 'package:new_panel/features/login_feature/domain/use_cases/auth_google_use_case.dart';
import 'package:new_panel/features/login_feature/domain/use_cases/login_use_case.dart';
import 'package:new_panel/features/theme_switcher/presentation/manager/theme_switcher_bloc.dart';
import 'package:new_panel/features/verify_feature/domain/repositories/verify_repository.dart';
import 'package:new_panel/features/verify_feature/domain/use_cases/verify_use_case.dart';
import '../features/forgot_pass_feature/data/data_sources/forget_pass_remote_data.dart';
import '../features/forgot_pass_feature/data/repositories/forget_pass_repository_imp.dart';
import '../features/forgot_pass_feature/presentation/manager/forget_pass_bloc.dart';
import '../features/login_feature/data/data_sources/login_remote_data.dart';
import '../features/login_feature/data/repositories/login_repository_imp.dart';
import '../features/login_feature/domain/repositories/login_repository.dart';
import '../features/login_feature/presentation/manager/login_bloc.dart';
import '../features/verify_feature/data/data_sources/verify_remote_data.dart';
import '../features/verify_feature/data/repositories/verify_repository_imp.dart';
import '../features/verify_feature/presentation/manager/verify_bloc.dart';

GetIt locator = GetIt.instance;

serviceLocator() async {
  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton<VerifyRemoteData>(VerifyRemoteData());
  locator.registerSingleton<LoginRemoteData>(LoginRemoteData());
  locator.registerSingleton<ForgetPassRemoteData>(ForgetPassRemoteData());

  /// /// *******************************     Register Repository      ***********************************
  locator.registerSingleton<VerifyRepository>(
      VerifyRepositoryImp(verifyRemoteData: locator()));

  locator.registerSingleton<LoginRepository>(
      LoginRepositoryImp(loginRemoteData: locator()));

  locator.registerSingleton<ForgetPassRepository>(
      ForgetPassRepositoryImp(forgetPassRemoteData: locator()));

  /// /// *********************************    Register Use Case      *******************

  locator.registerSingleton<VerifyUseCase>(
      VerifyUseCase(verifyRepository: locator()));

  locator.registerSingleton<LoginUseCase>(
      LoginUseCase(loginRepository: locator()));

  locator.registerSingleton<AuthGoogleUseCase>(
      AuthGoogleUseCase(loginRepository: locator()));

  locator.registerSingleton<ForgetPassUseCase>(
      ForgetPassUseCase(forgetPassRepository: locator()));

  ///  *********************************    Register bloc      *******************

  locator.registerSingleton<ThemeSwitcherBloc>(ThemeSwitcherBloc());

  locator.registerSingleton<VerifyBloc>(VerifyBloc(verifyUseCase: locator()));

  locator.registerSingleton<ForgetPassBloc>(
      ForgetPassBloc(forgetPassUseCase: locator()));

  locator.registerSingleton<LoginBloc>(
      LoginBloc(loginUseCase: locator(), authGoogleUseCase: locator()));
}
