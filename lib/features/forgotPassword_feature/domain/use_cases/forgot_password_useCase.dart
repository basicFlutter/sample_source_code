import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/forgot_password_params.dart';
import 'package:new_panel/core/use_case/base_use_case.dart';
import 'package:new_panel/features/forgotPassword_feature/domain/entities/forgot_password_entity.dart';
import 'package:new_panel/features/forgotPassword_feature/domain/repositories/forgot_password_repository.dart';


class ForgotPasswordUseCase extends BaseUseCase<ForgotPasswordEntity , ForgotPasswordParams>{
  ForgotPasswordRepository forgotPasswordRepository ;
  ForgotPasswordUseCase({required this.forgotPasswordRepository});
  @override
  Future<Either<ResponseError, ForgotPasswordEntity>> call(ForgotPasswordParams params) async{
    return await forgotPasswordRepository.submitForgotPassword(forgotPasswordParams: params);
  }

}