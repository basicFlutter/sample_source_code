import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/change_password_params.dart';
import 'package:new_panel/core/params/no_params.dart';
import 'package:new_panel/core/params/success_response.dart';
import 'package:new_panel/core/use_case/base_use_case.dart';
import 'package:new_panel/features/verification_feature/domain/repositories/verification_repository.dart';


class ResendVerificationUseCase extends BaseUseCase<SuccessResponse , NoParams>{
  VerificationRepository verificationRepository;
  ResendVerificationUseCase({required this.verificationRepository});

  @override
  Future<Either<ResponseError, SuccessResponse>> call(NoParams params) async {
   return await verificationRepository.resendVerificationChangePassword();
  }

}