import 'package:dartz/dartz.dart';
import 'package:google_mlkit_commons/src/input_image.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/extenstions/app_extension.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/data_sources/local/process_ocr.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/vin_number_model.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/vin_number_entity.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/repositories/vin_number_scanner_repository.dart';
import 'package:new_panel/main.dart';

class VinNumberScannerRepositoryImpl implements VinNumberScannerRepository{
  ProcessOcr processOcr;
  bool isBusy = false;
  VinNumberScannerRepositoryImpl({required this.processOcr});
  @override
  Future<Either<ResponseError, VinNumberEntity>> scanVinNumber({required InputImage inputImage}) async{


    if (!isBusy) {
      isBusy = true;
      try{
        List<TextBlock> textBloc = [];
        textBloc = await processOcr.inputImageToTextProcess(inputImage);

        VinNumberModel vinNumberModel = VinNumberModel();
        String? vinNumber = await vinNumberModel.parsTextBlocAndGetVinNumber(textBloc);

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

    logger.e("is Busy");

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

}