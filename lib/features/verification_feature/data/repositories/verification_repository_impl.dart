import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_panel/core/data/error_handling/error_handling.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/success_response.dart';
import 'package:new_panel/features/verification_feature/data/data_sources/verification_api_provider.dart';
import 'package:new_panel/features/verification_feature/domain/repositories/verification_repository.dart';

class VerificationRepositoryImpl extends VerificationRepository{
  VerificationApiProvider verificationApiProvider;
  VerificationRepositoryImpl({required this.verificationApiProvider});


  @override
  Future<Either<ResponseError, SuccessResponse>> sendVerificationChangePassword() async  {
    try{

      await verificationApiProvider.callSendVerificationChangePassword();

      return Right(SuccessResponse());

    }on DioError catch(error){
      ResponseError responseError =  ErrorHandling().getResponseError(
          response: error,
          fromMethod: "sendVerificationChangePassword"
      );
      return Left(responseError);
    }

  }


  @override
  Future<Either<ResponseError, SuccessResponse>> resendVerificationChangePassword() async {

    try{

      await verificationApiProvider.callSendVerificationChangePassword();

      return Right(SuccessResponse());

    }on DioError catch(error){
      ResponseError responseError =  ErrorHandling().getResponseError(
          response: error,
          fromMethod: "resendVerificationChangePassword"
      );
      return Left(responseError);
    }
    }






}