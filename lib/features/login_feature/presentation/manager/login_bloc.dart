import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:new_panel/core/data/cache/cache_provider.dart';
import 'package:new_panel/core/utils/app_utils.dart';
import 'package:new_panel/features/login_feature/data/models/login_map_model.dart';
import 'package:new_panel/features/login_feature/domain/entities/login_response_entity.dart';
import 'package:new_panel/features/login_feature/presentation/manager/status/login_status.dart';
import 'package:new_panel/features/menu_feature/presentation/pages/menu_page.dart';
import '../../../../core/exceptions/failure.dart';
import '../../domain/use_cases/auth_google_use_case.dart';
import '../../domain/use_cases/login_use_case.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase loginUseCase;
  AuthGoogleUseCase authGoogleUseCase;

  LoginBloc({required this.loginUseCase, required this.authGoogleUseCase})
      : super(LoginState()) {
    on<DoLoginEvent>((event, emit) async {
      emit(state.copyWith(newLoginStatus: LoadingLoginStatus()));

      Either<ResponseError, LoginResponseEntity> response =
          await loginUseCase.call(event.loginInfo);

      response.fold((ResponseError error) {
        emit(state.copyWith(newLoginStatus: FailedLoginStatus(error: error)));
      }, (LoginResponseEntity data) {
        Navigator.of(event.context).push(MaterialPageRoute(builder: (builder) {
          return const MenuPage();
        }));
        emit(state.copyWith(newLoginStatus: SuccessLoginStatus()));
        if (event.isRememberMe) {
          CacheProvider.saveString('refreshToken', data.refreshToken!);
          CacheProvider.saveString('accessToken', data.accessToken!);
        }
      });
    });

    on<LoginWithGoogleEvent>((event, emit) async {
      emit(state.copyWith(newLoginStatus: LoadingGoogleStatus()));
      Either<ResponseError, LoginResponseEntity> response =
          await authGoogleUseCase.call(event.googleId);

      response.fold((error) {
        emit(state.copyWith(newLoginStatus: FailedLoginStatus(error: error)));
        log('LOG ERROR ${error.message}');
      }, (LoginResponseEntity data) {
        Navigator.of(event.context).push(MaterialPageRoute(builder: (builder) {
          return const MenuPage();
        }));
        emit(state.copyWith(newLoginStatus: SuccessLoginStatus()));
        if (event.isRememberMe) {
          CacheProvider.saveString('refreshToken', data.refreshToken!);
          CacheProvider.saveString('accessToken', data.accessToken!);
        }
      });
    });
  }
}
