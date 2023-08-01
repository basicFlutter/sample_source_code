import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/ocr_entitiy.dart';

abstract class OcrDriverLicenseRepository {



  Future<Either<ResponseError , OcrEntity>> processImageDriverLicense({required File imageFile});


}