import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/use_case/base_use_case.dart';
import 'package:new_panel/features/veicle_detail_feature/domain/entities/inventory_image_entity.dart';
import 'package:new_panel/features/veicle_detail_feature/domain/repositories/get_images_inventory_repository.dart';

class GetImageSliderUseCase extends BaseUseCase<List<InventoryImageEntity> , int>{

  GetImageInventoryRepository getImageInventoryRepository;
  GetImageSliderUseCase({required this.getImageInventoryRepository});

  @override
  Future<Either<ResponseError, List<InventoryImageEntity>>> call(int params) async{
    return getImageInventoryRepository.getImageListSlider(vehicleId: params);
  }

}