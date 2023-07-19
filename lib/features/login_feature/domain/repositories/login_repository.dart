import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/login_feature/data/models/login_map_model.dart';
import 'package:new_panel/features/login_feature/domain/entities/assign_google_response_entity.dart';




import '../entities/login_response_entity.dart';

abstract class LoginRepository {
  Future<Either<ResponseError, LoginResponseEntity>> login(LoginMapModel data);
  Future<Either<ResponseError, LoginResponseEntity>> authGoogle(String googleId);
  Future<Either<ResponseError, AssignGoogleResponseEntity>> assignGoogleAccount(String googleId);
}
