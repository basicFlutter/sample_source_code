
import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/use_case/base_use_case.dart';
import 'package:new_panel/features/login_feature/data/models/login_map_model.dart';
import 'package:new_panel/features/login_feature/domain/entities/customer_login_entity.dart';

import '../entities/login_response_entity.dart';
import '../repositories/login_repository.dart';

class LoginUseCase extends BaseUseCase<CustomerLoginEntity, LoginMapModel> {
  LoginRepository loginRepository ;


  LoginUseCase({required this.loginRepository});

  @override
  Future<Either<ResponseError, CustomerLoginEntity>> call(LoginMapModel params) {
   return loginRepository.login(params) ;
  }
 }