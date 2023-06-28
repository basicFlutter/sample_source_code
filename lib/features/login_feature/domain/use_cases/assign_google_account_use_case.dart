import 'package:dartz/dartz.dart';
import 'package:new_panel/features/login_feature/data/models/login_map_model.dart';
import 'package:new_panel/features/login_feature/domain/entities/assign_google_response_entity.dart';


import '../../../../core/exceptions/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../entities/login_response_entity.dart';
import '../repositories/login_repository.dart';

class AssignGoogleAccountUseCase extends BaseUseCase<AssignGoogleResponseEntity, String> {
  LoginRepository loginRepository ;


  AssignGoogleAccountUseCase({required this.loginRepository});

  @override
  Future<Either<ResponseError, AssignGoogleResponseEntity>> call(String params) {
    return loginRepository.assignGoogleAccount(params) ;
  }
}