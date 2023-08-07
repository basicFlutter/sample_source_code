import 'package:dartz/dartz.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/use_case/base_use_case.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/object_detect_entity.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/vin_number_entity.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/repositories/scanner_repository.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/repositories/vin_number_scanner_repository.dart';

class VinNumberScannerUseCase extends BaseUseCase<VinNumberEntity , InputImage>{
  VinNumberScannerRepository vinNumberScannerRepository;
  VinNumberScannerUseCase({required this.vinNumberScannerRepository});
  @override
  Future<Either<ResponseError, VinNumberEntity>> call(InputImage params) async{
    return await vinNumberScannerRepository.scanVinNumber(inputImage: params);
  }

}