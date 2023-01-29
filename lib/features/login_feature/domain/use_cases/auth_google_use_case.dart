
import 'package:dartz/dartz.dart';
import 'package:new_panel/features/login_feature/data/models/login_map_model.dart';
import 'package:new_panel/features/login_feature/domain/entities/google_response_entity.dart';

import '../../../../core/exceptions/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../entities/login_response_entity.dart';
import '../repositories/login_repository.dart';

class AuthGoogleUseCase extends BaseUseCase<GoogleResponseEntity, String> {
  LoginRepository loginRepository ;


  AuthGoogleUseCase({required this.loginRepository});

  @override
  Future<Either<Failure, GoogleResponseEntity>> call(String params) {
    return loginRepository.authGoogle(params) ;
  }
}