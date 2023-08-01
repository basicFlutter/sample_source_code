import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/crop_image_input_params.dart';
import 'package:new_panel/core/use_case/base_use_case.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/image_crop_file_entity.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/repositories/crop_image_repository.dart';

class CropImageUseCase extends BaseUseCase<ImageCropFileEntity , CropImageInputParam>{
  CropImageRepository cropImageRepository;
  CropImageUseCase({required this.cropImageRepository});
  @override
  Future<Either<ResponseError, ImageCropFileEntity>> call(CropImageInputParam params) async{
    return await cropImageRepository.cropImage(cropImageInputParam: params);
  }

}