
import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/use_case/base_use_case.dart';
import 'package:new_panel/core/params/login_input_params.dart';

import '../entities/login_response_entity.dart';
import '../repositories/login_repository.dart';

class LoginUseCase extends BaseUseCase<LoginResponseEntity, LoginInputParams> {
  LoginRepository loginRepository ;


  LoginUseCase({required this.loginRepository});

  @override
  Future<Either<ResponseError, LoginResponseEntity>> call(LoginInputParams params) {
   return loginRepository.login(params) ;
  }
 }