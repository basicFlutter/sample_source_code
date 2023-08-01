import 'package:dartz/dartz.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/use_case/base_use_case.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/object_detect_entity.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/repositories/scanner_repository.dart';

class DetectDriverLicenseSingleImageUseCase extends BaseUseCase<ObjectDetectEntity , InputImage>{
  ScannerRepository scannerRepository;
  DetectDriverLicenseSingleImageUseCase({required this.scannerRepository});

  @override
  Future<Either<ResponseError, ObjectDetectEntity>> call(InputImage params) async{

    return await scannerRepository.detectDriversLicenseFromSingleImage(inputImage: params);

  }

}