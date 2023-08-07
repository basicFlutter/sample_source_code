import 'package:dartz/dartz.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/vin_number_entity.dart';

abstract class VinNumberScannerRepository{
  Future<Either<ResponseError , VinNumberEntity>> scanVinNumber({required InputImage inputImage});
}