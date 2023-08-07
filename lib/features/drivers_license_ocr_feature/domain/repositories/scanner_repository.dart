import 'package:dartz/dartz.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/input_image_drivers_license.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/object_detect_entity.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/vin_number_entity.dart';

abstract class ScannerRepository {

  Future<Either<ResponseError,ObjectDetectEntity>> detectDriversLicense({required InputObjectDetectPropertyParams inputImageDetectionProperty});
  Future<Either<ResponseError,ObjectDetectEntity>> detectDriversLicenseFromSingleImage({required InputImage inputImage});
  // Future<Either<ResponseError,VinNumberEntity>> detectVinNumber({required InputImage inputImage});


}