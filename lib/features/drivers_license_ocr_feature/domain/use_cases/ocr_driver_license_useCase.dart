import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/use_case/base_use_case.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/ocr_entitiy.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/repositories/ocr_driver_license_repository.dart';

class OcrDriverLicenseUseCase extends BaseUseCase<OcrEntity , File>{
  final OcrDriverLicenseRepository ocrDriverLicenseRepository;
   OcrDriverLicenseUseCase({required this.ocrDriverLicenseRepository});
  @override
  Future<Either<ResponseError, OcrEntity>> call(File params) async{
    return await ocrDriverLicenseRepository.processImageDriverLicense(imageFile: params);
  }

}