
import 'package:dartz/dartz.dart';
import 'package:new_panel/features/forgot_pass_feature/data/models/forget_pass_map_model.dart';
import 'package:new_panel/features/forgot_pass_feature/domain/entities/forget_pass_entity.dart';
import '../../../../core/exceptions/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../repositories/forget_pass_repository.dart';

class ForgetPassUseCase extends BaseUseCase<ForgetPassResponseEntity, ForgetPassMapModel> {
  ForgetPassRepository forgetPassRepository ;


  ForgetPassUseCase({required this.forgetPassRepository});

  @override
  Future<Either<ResponseError, ForgetPassResponseEntity>> call(ForgetPassMapModel params) {
   return forgetPassRepository.forgetPass(params) ;
  }
 }