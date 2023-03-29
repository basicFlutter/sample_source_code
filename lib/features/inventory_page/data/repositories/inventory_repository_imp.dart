import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/inventory_page/data/data_sources/inventory_remote_data.dart';
import 'package:new_panel/features/inventory_page/data/models/inventory_model.dart';
import 'package:new_panel/features/inventory_page/domain/entities/inventory_entity.dart';
import 'package:new_panel/features/inventory_page/domain/repositories/inventory_repository.dart';

import '../../../../core/exceptions/server_exception.dart';

class InventoryRepositoryImp implements InventoryRepository {
  InventoryRemoteData inventoryRemoteData;

  InventoryRepositoryImp({required this.inventoryRemoteData});

  @override
  Future<Either<Failure, List<InventoryEntity>>> getInventories(
      {required String stateType}) async {
    try {
      final result =
          await inventoryRemoteData.getInventories(stateType: stateType);
      List<dynamic> dynamicList = [];
      dynamicList = result.data;

      List<InventoryEntity> inventories = [];
      for (var e in dynamicList) {
        inventories.add(InventoryModel.fromJson(e));
      }

      return Right(inventories);
    } on ServerException catch (error) {
      return Left(ServerFailure(error: error));
    }
  }

  @override
  Future<Either<Failure, List<InventoryEntity>>> getWholeInventories()async {
    try {
      final result =
      await inventoryRemoteData.getWholeInventories();
      List<dynamic> dynamicList = [];
      dynamicList = result.data;

      List<InventoryEntity> inventories = [];
      for (var e in dynamicList) {
        inventories.add(InventoryModel.fromJson(e));
      }

      return Right(inventories);
    } on ServerException catch (error) {
      return Left(ServerFailure(error: error));
    }
  }
}
