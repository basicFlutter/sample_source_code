
import 'package:dartz/dartz.dart';
import 'package:new_panel/features/login_feature/data/models/login_map_model.dart';


import '../../../../core/exceptions/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../entities/login_response_entity.dart';
import '../repositories/login_repository.dart';

class AuthGoogleUseCase extends BaseUseCase<LoginResponseEntity, String> {
  LoginRepository loginRepository ;


  AuthGoogleUseCase({required this.loginRepository});

  @override
  Future<Either<ResponseError, LoginResponseEntity>> call(String params) {
    return loginRepository.authGoogle(params) ;
  }
}