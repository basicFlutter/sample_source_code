import 'package:dartz/dartz.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:google_mlkit_commons/src/input_image.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/input_image_drivers_license.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/data_sources/local/process_scanner.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/barcode_model.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/vin_number_model.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/barcode_entity.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/vin_number_entity.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/repositories/vin_number_barcode_scanner_repository.dart';

class VinNumberScannerRepositoryImpl implements VinNumberBarcodeScannerRepository{
  ProcessScanner processScanner;
  bool isBusy = false;
  VinNumberScannerRepositoryImpl({required this.processScanner});
  @override
  Future<Either<ResponseError, VinNumberEntity>> scanVinNumber({required InputObjectDetectPropertyParams inputObjectDetectPropertyParams}) async{


    if (!isBusy) {
      isBusy = true;
      try{
        List<TextBlock> textBloc = [];
        textBloc = await processScanner.inputImageToTextProcess(inputObjectDetectPropertyParams.inputImage);

        VinNumberModel vinNumberModel = VinNumberModel();
        String? vinNumber = await vinNumberModel.parsTextBlocAndGetVinNumber(textBlockList: textBloc , inputObjectDetectPropertyParams: inputObjectDetectPropertyParams);

        if(vinNumber != null){
          VinNumberEntity vinNumberEntity = VinNumberEntity(vinNumber: vinNumber.toUpperCase());

          isBusy = false;
          return Right(vinNumberEntity);
        }else{
          isBusy = false;
          return Left(
              ResponseError(
                  message: "Vin Number No Detect",
                  alertType: null ,
                  act: null,
                  data: null,
                  entity: null,
                  reason: null,
                  type: null
              )

          );
        }

      }catch (e){
        isBusy = false;
        return Left(
            ResponseError(
                message: e.toString(),
                alertType: null ,
                act: null,
                data: null,
                entity: null,
                reason: null,
                type: null
            )

        );
      }

    }


    return Left(
        ResponseError(
            message: "Processor is Busy",
            alertType: null ,
            act: null,
            data: null,
            entity: null,
            reason: null,
            type: null
        )

    );
  }

  @override
  Future<Either<ResponseError, BarcodeEntity>> scanBarcode({required InputObjectDetectPropertyParams inputObjectDetectPropertyParams}) async{
    if (!isBusy) {
      isBusy = true;
      try{
        List<Barcode> barcodeList = [];
        barcodeList = await processScanner.inoutImageProcessBarcode(inputObjectDetectPropertyParams.inputImage);

        BarcodeModel barcodeModel = BarcodeModel();
        List<String> barcodes = await barcodeModel.parseBarcode(barcodeList: barcodeList , inputObjectDetectPropertyParams: inputObjectDetectPropertyParams);

        if(barcodes.isNotEmpty){
          BarcodeEntity vinNumberEntity = BarcodeEntity(barcodeList:barcodes );

          isBusy = false;
          return Right(vinNumberEntity);
        }else{
          isBusy = false;
          return Left(
              ResponseError(
                  message: "Barcode No Detect",
                  alertType: null ,
                  act: null,
                  data: null,
                  entity: null,
                  reason: null,
                  type: null
              )

          );
        }

      }catch (e){
        isBusy = false;
        return Left(
            ResponseError(
                message: e.toString(),
                alertType: null ,
                act: null,
                data: null,
                entity: null,
                reason: null,
                type: null
            )

        );
      }

    }



    return Left(
        ResponseError(
            message: "Processor Barcode is Busy",
            alertType: null ,
            act: null,
            data: null,
            entity: null,
            reason: null,
            type: null
        )

    );
  }

}