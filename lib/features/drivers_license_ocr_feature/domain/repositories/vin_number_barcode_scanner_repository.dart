import 'package:dartz/dartz.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/input_image_drivers_license.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/barcode_entity.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/vin_number_entity.dart';

abstract class VinNumberBarcodeScannerRepository{
  Future<Either<ResponseError , VinNumberEntity>> scanVinNumber({required InputObjectDetectPropertyParams inputObjectDetectPropertyParams});
  Future<Either<ResponseError , BarcodeEntity>> scanBarcode({required InputObjectDetectPropertyParams inputObjectDetectPropertyParams});
}