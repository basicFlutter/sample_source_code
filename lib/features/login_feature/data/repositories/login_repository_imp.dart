import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_panel/core/data/error_handling/error_handling.dart';
import 'package:new_panel/core/exceptions/error_model.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/login_feature/data/models/assign_google_response_model.dart';
import 'package:new_panel/core/params/login_input_params.dart';
import 'package:new_panel/features/login_feature/domain/entities/assign_google_response_entity.dart';

import 'package:new_panel/main.dart';


import '../../domain/entities/login_response_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/login_remote_data.dart';
import '../models/login_response_model.dart';

class LoginRepositoryImp implements LoginRepository {
  LoginRemoteData loginRemoteData;

  LoginRepositoryImp({required this.loginRemoteData});

  @override
  Future<Either<ResponseError, LoginResponseEntity>> login(LoginInputParams data) async {
    try {
      Response result = await loginRemoteData.login(data.toJson());
      LoginResponseEntity response = LoginResponseModel.fromJson(result.data);

      return Right(response);
    } on DioError catch (error) {
      ResponseError responseError =  ErrorHandling().getResponseError(
          response: error,
          fromMethod: "login"
      );
      return Left(responseError);
    }
  }

  @override
  Future<Either<ResponseError, LoginResponseEntity>> authGoogle(
      String googleId) async {
    try {
      Response result = await loginRemoteData.authGoogle(googleId);
      LoginResponseEntity response = LoginResponseModel.fromJson(result.data);

      return Right(response);
    } on DioError catch (error) {
      ResponseError responseError =  ErrorHandling().getResponseError(
          response: error,
          fromMethod: "authGoogle"
      );
      return Left(responseError);
    }
  }


  @override
  Future<Either<ResponseError, AssignGoogleResponseEntity>> assignGoogleAccount(String googleId ) async{
    try {
      Response result = await loginRemoteData.assignGoogleAccount(googleId);
      AssignGoogleResponseEntity response = AssignGoogleResponseModel.fromJson(result.data);

      return Right(response);
    } on DioError catch (error) {
      ResponseError responseError =  ErrorHandling().getResponseError(
          response: error,
          fromMethod: "assignGoogleAccount"
      );
      return Left(responseError);
    }
  }

}
