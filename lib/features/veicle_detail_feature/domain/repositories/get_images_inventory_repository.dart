import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/veicle_detail_feature/domain/entities/inventory_image_entity.dart';

abstract class GetImageInventoryRepository {

  Future<Either<ResponseError , List<InventoryImageEntity>>> getImageListSlider({required int vehicleId});


}