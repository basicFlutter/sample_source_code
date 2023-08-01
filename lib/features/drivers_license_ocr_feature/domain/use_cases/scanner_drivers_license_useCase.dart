import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/input_image_drivers_license.dart';
import 'package:new_panel/core/use_case/base_use_case.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/object_detect_entity.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/repositories/scanner_repository.dart';

class ScannerDriversLicenseUseCase extends BaseUseCase<ObjectDetectEntity , InputObjectDetectPropertyParams>{
  ScannerRepository scannerRepository;
  ScannerDriversLicenseUseCase({required this.scannerRepository});
  @override
  Future<Either<ResponseError, ObjectDetectEntity>> call(InputObjectDetectPropertyParams params) async {
    return await scannerRepository.detectDriversLicense(inputImageDetectionProperty: params);
  }
}