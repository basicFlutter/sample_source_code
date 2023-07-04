
import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/use_case/base_use_case.dart';



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