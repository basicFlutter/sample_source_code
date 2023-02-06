import 'package:dartz/dartz.dart';
import 'package:new_panel/features/forgot_pass_feature/data/models/forget_pass_map_model.dart';
import 'package:new_panel/features/forgot_pass_feature/domain/entities/forget_pass_entity.dart';

import '../../../../core/exceptions/failure.dart';

abstract class ForgetPassRepository {
  Future<Either<ResponseError, ForgetPassResponseEntity>> forgetPass(
      ForgetPassMapModel data);
}
