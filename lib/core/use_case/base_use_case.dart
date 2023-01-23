import 'package:dartz/dartz.dart';

import '../exceptions/failure.dart';

abstract class BaseUseCase<Type, Map> {
  Future<Either<Failure, Type>> call(Map params);
}
