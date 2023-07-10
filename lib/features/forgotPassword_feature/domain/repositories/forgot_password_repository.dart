import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/forgot_password_params.dart';
import 'package:new_panel/features/forgotPassword_feature/domain/entities/forgot_password_entity.dart';


abstract class ForgotPasswordRepository {
  Future<Either<ResponseError , ForgotPasswordEntity>> submitForgotPassword({required ForgotPasswordParams forgotPasswordParams});
}