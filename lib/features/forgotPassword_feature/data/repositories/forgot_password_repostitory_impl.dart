import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_panel/core/data/error_handling/error_handling.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/forgot_password_params.dart';
import 'package:new_panel/features/forgotPassword_feature/data/data_sources/forgot_password_data_provider.dart';
import 'package:new_panel/features/forgotPassword_feature/domain/entities/forgot_password_entity.dart';
import 'package:new_panel/features/forgotPassword_feature/domain/repositories/forgot_password_repository.dart';


class ForgotPasswordRepositoryImpl extends ForgotPasswordRepository{
  ForgotPasswordDataProvider forgotPasswordDataProvider;
  ForgotPasswordRepositoryImpl({required this.forgotPasswordDataProvider});

  @override
  Future<Either<ResponseError, ForgotPasswordEntity>> submitForgotPassword({required ForgotPasswordParams forgotPasswordParams}) async{
    try {

      final response =await forgotPasswordDataProvider.callForgotPassword(forgotPasswordParams);
      ForgotPasswordEntity forgotPasswordEntity = ForgotPasswordEntity();
      forgotPasswordEntity.passwordReset = true;


      return Right(forgotPasswordEntity);

    }  on DioError catch (error) {

      ResponseError responseError =  ErrorHandling().getResponseError(
          response: error,
          fromMethod: "submitForgotPassword"
      );
      return Left(responseError);

    }
  }




}