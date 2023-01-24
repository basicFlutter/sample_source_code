

import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failure.dart';
import '../../../../core/exceptions/server_exception.dart';
import '../../domain/entities/verify_response_entity.dart';
import '../../domain/repositories/verify_repository.dart';
import '../data_sources/verify_remote_data.dart';
import '../models/verify_response_model.dart';

class VerifyRepositoryImp implements VerifyRepository {
  VerifyRemoteData verifyRemoteData ;


  VerifyRepositoryImp({required this.verifyRemoteData});
  @override
  Future<Either<Failure, VerifyResponseEntity>> verifyCode(Map<String , dynamic > data ) async {
    try {
      final result = await verifyRemoteData.verifyCode(data);

      VerifyResponseEntity response = VerifyResponseModel(statusCode: result.data, description: result.data);

      return Right(response);
    } on ServerException catch (error) {
      return Left(ServerFailure(error: error));
    }
  }




}