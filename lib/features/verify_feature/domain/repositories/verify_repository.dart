
import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failure.dart';
import '../entities/verify_response_entity.dart';

abstract class VerifyRepository{
  Future<Either<Failure, VerifyResponseEntity>> verifyCode(Map<String , dynamic > data );
}