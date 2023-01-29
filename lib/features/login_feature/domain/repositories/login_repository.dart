import 'package:dartz/dartz.dart';
import 'package:new_panel/features/login_feature/data/models/login_map_model.dart';
import 'package:new_panel/features/login_feature/domain/entities/google_response_entity.dart';
import 'package:new_panel/features/verify_feature/domain/entities/verify_response_entity.dart';

import '../../../../core/exceptions/failure.dart';
import '../entities/login_response_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponseEntity>> login(LoginMapModel data);
  Future<Either<Failure, GoogleResponseEntity>> authGoogle(String googleId);
  // Future<Either<Failure, LoginResponseEntity>> verifyGoogle();
}
