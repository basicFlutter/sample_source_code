import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/inventory_page/domain/entities/inventory_entity.dart';


abstract class InventoryRepository {
  Future<Either<Failure , List<InventoryEntity>>> getInventories({required String stateType });
  Future<Either<Failure , List<InventoryEntity>>> getWholeInventories();
}