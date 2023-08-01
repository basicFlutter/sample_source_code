import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/change_password_params.dart';
import 'package:new_panel/core/params/success_response.dart';


abstract class VerificationRepository {

  Future<Either<ResponseError , SuccessResponse>> sendVerificationChangePassword();
  Future<Either<ResponseError , SuccessResponse>> resendVerificationChangePassword();

}


