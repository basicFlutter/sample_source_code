import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_panel/core/exceptions/error_model.dart';
import 'package:new_panel/features/forgot_pass_feature/data/models/forget_pass_map_model.dart';
import 'package:new_panel/features/forgot_pass_feature/domain/entities/forget_pass_entity.dart';
import 'package:new_panel/features/login_feature/data/models/assign_google_response_model.dart';
import 'package:new_panel/features/login_feature/domain/entities/assign_google_response_entity.dart';
import '../../../../core/exceptions/failure.dart';

import '../../domain/repositories/forget_pass_repository.dart';
import '../data_sources/forget_pass_remote_data.dart';
import '../models/forget_pass_response_model.dart';


class ForgetPassRepositoryImp implements ForgetPassRepository {
  ForgetPassRemoteData forgetPassRemoteData;

  ForgetPassRepositoryImp({required this.forgetPassRemoteData});



  @override
  Future<Either<ResponseError, ForgetPassResponseEntity>> forgetPass(ForgetPassMapModel data) async{

    try {
      Response result = await forgetPassRemoteData.forgetPass(data);
      // if(result.statusCode == 200 || result.statusCode == 201){

        ForgetPassResponseEntity response =  ForgetPassResponseModel(statusCode: result.statusCode! ,description: 'your new password sent to your Email' );
        return Right(response);
      // }
    } on DioError catch (error) {
      ErrorModel errorModel = ErrorModel.fromJson(error.response?.data);
      if (error.response?.statusCode == 400) {
        return Left(ResponseError(
            data: errorModel.data,
            message: errorModel.message,
            act: errorModel.act,
            alertType: errorModel.alertType,
            type: errorModel.type,
            entity: errorModel.entity,
            reason: errorModel.reason));
      } else if (error.response?.statusCode == 404) {
        return Left(ResponseError(
            data: errorModel.data,
            message: errorModel.message,
            act: errorModel.act,
            alertType: errorModel.alertType,
            type: errorModel.type,
            entity: errorModel.entity,
            reason: errorModel.reason));
      }
      return Left(ResponseError(
          data: errorModel.data,
          message: errorModel.message,
          act: errorModel.act,
          alertType: errorModel.alertType,
          type: errorModel.type,
          entity: errorModel.entity,
          reason: errorModel.reason));
    }

  }

}
