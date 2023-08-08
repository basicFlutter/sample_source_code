import 'package:dartz/dartz.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/input_image_drivers_license.dart';
import 'package:new_panel/core/use_case/base_use_case.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/barcode_entity.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/repositories/vin_number_barcode_scanner_repository.dart';

class BarcodeScannerUseCase extends BaseUseCase<BarcodeEntity , InputObjectDetectPropertyParams>{

  VinNumberBarcodeScannerRepository vinNumberBarcodeScannerRepository;
  BarcodeScannerUseCase({required this.vinNumberBarcodeScannerRepository});


  @override
  Future<Either<ResponseError, BarcodeEntity>> call(InputObjectDetectPropertyParams  params) async{

    return await vinNumberBarcodeScannerRepository.scanBarcode(inputObjectDetectPropertyParams: params);

  }

}