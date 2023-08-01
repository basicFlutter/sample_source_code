import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/crop_image_input_params.dart';

import 'package:flutter/material.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/data_sources/local/crop_image_class.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/image_crop_file_entity.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/repositories/crop_image_repository.dart';

class CropImageRepositoryImpl implements CropImageRepository{

  CropImageClass cropImageClass;
  CropImageRepositoryImpl({required this.cropImageClass});
  @override
  Future<Either<ResponseError, ImageCropFileEntity>> cropImage({required CropImageInputParam cropImageInputParam}) async{
    try {
      File imageFile = await cropImageClass.cropAndResizeFile(cropImageInputParam: cropImageInputParam );

      var decodedImage = await decodeImageFromList(imageFile.readAsBytesSync());

      ImageCropFileEntity cropFileEntity = ImageCropFileEntity(
        imageCropFile: imageFile,
        width: decodedImage.width,
        height: decodedImage.height,);

      return Right(cropFileEntity);
    } catch (e) {
      return Left(ResponseError(
          message: "Crop image has error and error is $e",
          alertType: null ,
          act: null,
          data: null,
          entity: null,
          reason: null,
          type: null
      ));
    }
  }





}