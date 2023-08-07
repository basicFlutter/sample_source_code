import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_panel/core/data/error_handling/error_handling.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/veicle_detail_feature/data/data_sources/inventory_image_data_provider.dart';
import 'package:new_panel/features/veicle_detail_feature/data/models/inventory_image_model.dart';
import 'package:new_panel/features/veicle_detail_feature/domain/entities/inventory_image_entity.dart';
import 'package:new_panel/features/veicle_detail_feature/domain/repositories/get_images_inventory_repository.dart';

class GetImagesInventoryRepositoryImpl implements GetImageInventoryRepository{
  InventoryImageDataProvider inventoryImageDataProvider;
  GetImagesInventoryRepositoryImpl({required this.inventoryImageDataProvider});
  @override
  Future<Either<ResponseError, List<InventoryImageEntity>>> getImageListSlider({required int vehicleId}) async{

    try{

      Response response = await inventoryImageDataProvider.callImageInventory(vehicleId: vehicleId);
      List<dynamic> dynamicList = response.data;
      List<InventoryImageEntity> inventoryImageList = [];

      for(var item in dynamicList){
        inventoryImageList.add(InventoryImageModel.fromJson(item));
      }

      return Right(inventoryImageList);

    }on DioError catch(error){
      ResponseError responseError = ErrorHandling().getResponseError(response: error, fromMethod: "getImageListSlider");
      return left(responseError);
    }

  }

}