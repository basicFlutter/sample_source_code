
import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../entities/verify_response_entity.dart';
import '../repositories/verify_repository.dart';

class VerifyUseCase extends BaseUseCase<VerifyResponseEntity, Map> {
  VerifyRepository verifyRepository ;


  VerifyUseCase({required this.verifyRepository});

  @override
  Future<Either<Failure, VerifyResponseEntity>> call(Map params) {
    Map<String , dynamic > data = params['data'] ;
   return verifyRepository.verifyCode(data) ;
  }
 }