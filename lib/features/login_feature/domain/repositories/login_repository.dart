import 'package:dartz/dartz.dart';
import 'package:new_panel/features/login_feature/data/models/login_map_model.dart';


import '../../../../core/exceptions/failure.dart';
import '../entities/login_response_entity.dart';

abstract class LoginRepository {
  Future<Either<ResponseError, LoginResponseEntity>> login(LoginMapModel data);
  Future<Either<ResponseError, LoginResponseEntity>> authGoogle(String googleId);
}
