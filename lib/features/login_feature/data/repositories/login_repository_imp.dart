import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_panel/features/login_feature/data/models/login_map_model.dart';
import 'package:new_panel/features/login_feature/domain/entities/google_response_entity.dart';
import 'package:new_panel/features/verify_feature/domain/entities/verify_response_entity.dart';
import 'package:new_panel/main.dart';

import '../../../../core/exceptions/failure.dart';
import '../../../../core/exceptions/server_exception.dart';
import '../../domain/entities/login_response_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/login_remote_data.dart';
import '../models/google_response_model.dart';
import '../models/login_response_model.dart';

class LoginRepositoryImp implements LoginRepository {
  LoginRemoteData loginRemoteData;

  LoginRepositoryImp({required this.loginRemoteData});

  @override
  Future<Either<Failure, LoginResponseEntity>> login(LoginMapModel data) async {
    try {
      Response result = await loginRemoteData.login(data.toJson());
      LoginResponseEntity response = LoginResponseModel.fromJson(result.data);

      return Right(response);
    } on DioError catch (error) {
      if (error.response?.statusCode == 400) {
        logger.e(error);
        LoginResponseEntity response =
            LoginResponseModel.fromJson(error.response!.data);
        return Right(response);
      } else if (error.response?.statusCode == 404) {
        logger.e("404");
        LoginResponseEntity response =
            LoginResponseModel.fromJson(error.response!.data);
        return Right(response);
      }
      return Left(ServerFailure(error: error));
    }
  }

  @override
  Future<Either<Failure, LoginResponseEntity>> authGoogle(
      String googleId) async {
    try {
      Response result = await loginRemoteData.authGoogle(googleId);
      LoginResponseEntity response = LoginResponseModel.fromJson(result.data);

      return Right(response);
    } on DioError catch (error) {
      if (error.response?.statusCode == 400) {
        return Left(ServerFailure(error: error));
      } else if (error.response?.statusCode == 404) {
        return Left(ServerFailure(error: error));
      }
      return Left(ServerFailure(error: error));
    }

  }
}
