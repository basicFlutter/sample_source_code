import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:new_panel/core/data/cache/cache_provider.dart';
import 'package:new_panel/features/login_feature/data/models/login_map_model.dart';
import 'package:new_panel/features/login_feature/domain/entities/login_response_entity.dart';
import 'package:new_panel/features/login_feature/presentation/manager/status/login_status.dart';

import '../../../../core/exceptions/failure.dart';
import '../../domain/use_cases/login_use_case.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginState()) {
    on<DoLoginEvent>((event, emit) async {
      emit(state.copyWith(newLoginStatus: LoadingLoginStatus()));

      Either<Failure, LoginResponseEntity> response =
          await loginUseCase.call(event.loginInfo);

      response.fold((error) {

        emit(state.copyWith(newLoginStatus: FailedLoginStatus()));

      }, (LoginResponseEntity data) {

        emit(state.copyWith(newLoginStatus: SuccessLoginStatus( )));
        CacheProvider.saveString('accessToken', data.accessToken!);
        CacheProvider.saveString('refreshToken', data.refreshToken!);
      });
    });


    on<ChooseGoogleAccountEvent>((event, emit) {
      if(event.isLoading){
        emit(state.copyWith(newLoginStatus: LoadingGoogleStatus()));
      }else{
        emit(state.copyWith(newLoginStatus: SuccessLoginStatus()));
      }

    });

  }
}
