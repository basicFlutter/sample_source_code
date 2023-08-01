import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/crop_image_input_params.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/image_crop_file_entity.dart';

abstract class CropImageRepository{

  Future<Either<ResponseError , ImageCropFileEntity>> cropImage({required CropImageInputParam cropImageInputParam});

}