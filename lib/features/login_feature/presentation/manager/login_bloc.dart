import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:new_panel/core/constants/constants.dart';
import 'package:new_panel/core/data/cache/cache_provider.dart';
import 'package:new_panel/core/data/network/api_provider.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/login_feature/data/models/login_map_model.dart';
import 'package:new_panel/features/login_feature/domain/entities/login_response_entity.dart';
import 'package:new_panel/features/login_feature/presentation/manager/status/check_login_status.dart';
import 'package:new_panel/features/login_feature/presentation/manager/status/login_status.dart';


import '../../domain/use_cases/auth_google_use_case.dart';
import '../../domain/use_cases/login_use_case.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase loginUseCase;
  AuthGoogleUseCase authGoogleUseCase;

  Codec<String, String> stringToBase64 = utf8.fuse(base64);

  LoginBloc({required this.loginUseCase, required this.authGoogleUseCase})
      : super(LoginState(checkLoginStatus: CheckLoginLoading() ,loginStatus: LoginStatusInit())) {

    on<CheckLoginRemember>((event, emit) async {
      String? userName = await CacheProvider.getString("userName");
      String? password = await CacheProvider.getString("password");


      if(( userName!= null && userName != "" ) && (password != null && password.trim() != "") ){

        LoginMapModel loginMapModel = LoginMapModel();
        loginMapModel.setUserName = userName;
        loginMapModel.setPassword = password;
        add(DoLoginEvent(isRememberMe: true , loginInfo: loginMapModel));
      }

    });


    on<DoLoginEvent>((event, emit) async {
      emit(state.copyWith(newLoginStatus: LoadingLoginStatus()));

      Either<ResponseError, LoginResponseEntity> response =
          await loginUseCase.call(event.loginInfo);
      // Either<ResponseError, CustomerLoginEntity> response =
      //     await loginUseCase.call(event.loginInfo);

      response.fold((ResponseError error) {
        emit(state.copyWith(newLoginStatus: FailedLoginStatus(error: error)));
      }, (LoginResponseEntity data) {

        //     Constants.accessToken = data.token??"";
        //     Constants.customerInformation = data.user;
        //     // CacheProvider.saveString('refreshToken', data.refreshToken!);
        //     if(event.isRememberMe){
        //       CacheProvider.saveString('userName',event.loginInfo.username!);
        //       CacheProvider.saveString('password',event.loginInfo.password!);
        //     }
        //     ApiProvider().setToken();
        
        Constants.accessToken = data.accessToken!;
        CacheProvider.saveString('refreshToken', data.refreshToken!);
        CacheProvider.saveString('accessToken', data.accessToken!);
        ApiProvider().setToken();
        if(event.isRememberMe){
              CacheProvider.saveString('userName',event.loginInfo.username!);
              CacheProvider.saveString('password',event.loginInfo.password!);
        }else{
          CacheProvider.saveString('userName','');
          CacheProvider.saveString('password','');
        }
        
      
        emit(state.copyWith(newLoginStatus: SuccessLoginStatus()));
        if (event.isRememberMe) {
          CacheProvider.saveString('refreshToken', data.refreshToken!);
          CacheProvider.saveString('accessToken', data.accessToken!);
        }
      });
    });


    // response.fold((ResponseError error) {
    //     emit(state.copyWith(newLoginStatus: FailedLoginStatus(error: error)));
    //   }, (CustomerLoginEntity data) {
    //     Constants.accessToken = data.token??"";
    //     Constants.customerInformation = data.user;
    //     // CacheProvider.saveString('refreshToken', data.refreshToken!);
    //     if(event.isRememberMe){
    //       CacheProvider.saveString('userName',event.loginInfo.username!);
    //       CacheProvider.saveString('password',event.loginInfo.password!);
    //     }
    //     ApiProvider().setToken();
    //
    //     emit(state.copyWith(newLoginStatus: SuccessLoginStatus()));
    //
    //   });
    // });

    on<LoginWithGoogleEvent>((event, emit) async {
      emit(state.copyWith(newLoginStatus: LoadingGoogleStatus()));
      Either<ResponseError, LoginResponseEntity> response =
          await authGoogleUseCase.call(event.googleId);

      response.fold((error) {
        emit(state.copyWith(newLoginStatus: FailedLoginStatus(error: error)));

      }, (LoginResponseEntity data) async{
        Constants.accessToken = data.accessToken!;

         CacheProvider.saveString('refreshToken', data.refreshToken!);
          CacheProvider.saveString('accessToken', data.accessToken!);
        ApiProvider().setToken();
        // Navigator.of(event.context).push(MaterialPageRoute(builder: (builder) {
        //   return  MainPage();
        // }));
        emit(state.copyWith(newLoginStatus: SuccessLoginStatus()));
        if (event.isRememberMe) {
          Constants.accessToken = data.accessToken!;
          CacheProvider.saveString('refreshToken', data.refreshToken!);
          CacheProvider.saveString('accessToken', data.accessToken!);
        }
      });
    });
  }
}
