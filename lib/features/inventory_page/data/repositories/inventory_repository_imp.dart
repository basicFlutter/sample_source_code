import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_panel/core/data/error_handling/error_handling.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/inventory_page/data/data_sources/inventory_remote_data.dart';
import 'package:new_panel/features/inventory_page/data/models/inventory_model.dart';
import 'package:new_panel/features/inventory_page/domain/entities/inventory_entity.dart';
import 'package:new_panel/features/inventory_page/domain/repositories/inventory_repository.dart';


class InventoryRepositoryImp implements InventoryRepository {
  InventoryRemoteData inventoryRemoteData;

  InventoryRepositoryImp({required this.inventoryRemoteData});

  @override
  Future<Either<ResponseError, List<InventoryEntity>>> getInventories(
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
    } on DioError catch (error) {
      ResponseError responseError =  ErrorHandling().getResponseError(
          response: error,
          fromMethod: "getInventories"
      );
      return Left(responseError);
    }
  }

  @override
  Future<Either<ResponseError, List<InventoryEntity>>> getWholeInventories()async {
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
    } on DioError catch (error) {
      ResponseError responseError =  ErrorHandling().getResponseError(
          response: error,
          fromMethod: "getWholeInventories"
      );
      return Left(responseError);
    }
  }
}
