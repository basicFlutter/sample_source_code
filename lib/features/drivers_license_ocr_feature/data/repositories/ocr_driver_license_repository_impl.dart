
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:new_panel/core/data/error_handling/error_handling.dart';
import 'package:new_panel/core/enums/app_enums.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/data_sources/local/process_ocr.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/data_sources/remote.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/drivers_license/alberta_drivers_license.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/drivers_license/british_drivers_license.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/drivers_license/ontario_drivers_license.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/improve_image_driver_license.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/ocr_detail_model.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/postal_code_search_model/postal_code_model.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/ocr_entitiy.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/repositories/ocr_driver_license_repository.dart';

import 'package:new_panel/main.dart';
import 'package:string_similarity/string_similarity.dart';

class OcrDriverLicenseRepositoryImpl implements OcrDriverLicenseRepository{
  ProcessOcr processOcr;
  ImproveImageDriverLicense improveImageDriverLicense;
  AddressProvider addressProvider;
  OcrDriverLicenseRepositoryImpl({required this.processOcr , required this.improveImageDriverLicense , required this.addressProvider});
  @override
  Future<Either<ResponseError, OcrEntity>> processImageDriverLicense({required File imageFile}) async {

    List<TextBlock> textBlock = [];
    DriversLicenceModel driversLicenceModel = DriversLicenceModel.unKnowDriversLicence;

    File? imageAdjusted =await improveImageDriverLicense.adjustBrightnessAndContrast(imageFile, brightness: -0.01 , contrast: 0.4);

    try{
      textBlock = await processOcr.imageToTextProcess(imageAdjusted ?? imageFile);

      String mainResultStringOcr = '';
      driversLicenceModel =  checkDriverLicenseModel(textBlock);
      OcrEntity ocrEntity = ProcessOcrDetailModel();

      for (TextBlock block in textBlock) {
        for (TextLine line in block.lines) {
          for (TextElement element in line.elements) {

            mainResultStringOcr += "${element.text} ";
          }
        }
      }
      logger.w(mainResultStringOcr);

      switch(driversLicenceModel){

        case DriversLicenceModel.ontarioDriversLicence:
          OntarioDriversLicense ontarioDriversLicense = OntarioDriversLicense();
          ocrEntity =  ontarioDriversLicense.getProcessOcrResult(textBlock);
          break;
        case DriversLicenceModel.britishDriversLicence:
          BritishDriversLicense britishDriversLicense = BritishDriversLicense();
           ocrEntity =  britishDriversLicense.getProcessOcrResult(textBlock);
          break;
        case DriversLicenceModel.albertaDriversLicence:
          AlbertaDriversLicense albertaDriversLicense = AlbertaDriversLicense();
           ocrEntity =  albertaDriversLicense.getProcessOcrResult(textBlock);
          break;
        case DriversLicenceModel.unKnowDriversLicence:
          return Left(ResponseError(
              message: "UnKnow Drivers Licence",
              alertType: null ,
              act: null,
              data: null,
              entity: null,
              reason: null,
              type: null
          ));
          break;
      }

      if(ocrEntity.postalCode != null){
        try{
        Response response =  await addressProvider.callPostalCodDecoder(PostalCodeModel().toJson(postalCode: ocrEntity.postalCode!));
        PostalCodeModel postalCodeModel = PostalCodeModel.fromJson(response.data);

        ocrEntity.cityName = postalCodeModel.cityData?.city;
        ocrEntity.provinceName = postalCodeModel.cityData?.province?.province;
        }on DioError catch (error) {
          ResponseError responseError =  ErrorHandling().getResponseError(
              response: error,
              fromMethod: "processImageDriverLicense/get postal code"
          );
          return Left(responseError);
        }
      }

      ocrEntity.imageFile = imageAdjusted ?? imageFile;

      return Right(ocrEntity);






    }catch(e){
      return Left(ResponseError(
          message: "$e",
          alertType: null ,
          act: null,
          data: null,
          entity: null,
          reason: null,
          type: null
      ));
    }

  }



  DriversLicenceModel checkDriverLicenseModel(List<TextBlock> textBlock){
    DriversLicenceModel driversLicenceModel = DriversLicenceModel.unKnowDriversLicence;
    String mainResult = '';
    for (TextBlock block in textBlock) {
      for (TextLine line in block.lines) {
        for (TextElement element in line.elements) {
          if("ALBERTA".similarityTo(element.text.toUpperCase()) > 0.5){
            driversLicenceModel = DriversLicenceModel.albertaDriversLicence;
            logger.i("Driver License is Alberta");
            return driversLicenceModel;
          }else if("ONTARIO".similarityTo(element.text.toUpperCase()) > 0.5){
            driversLicenceModel = DriversLicenceModel.ontarioDriversLicence;
            logger.i("Driver License is Ontario");
            return driversLicenceModel;
          }else if("BRITISH COLUMBIA".similarityTo(element.text.toUpperCase()) > 0.5 ||"BRITISH".similarityTo(element.text.toUpperCase()) > 0.5 || "COLUMBIA".similarityTo(element.text.toUpperCase()) > 0.5){
            driversLicenceModel = DriversLicenceModel.britishDriversLicence;
            logger.i("Driver License is BC");
            return driversLicenceModel;
          }
        }
      }
    }
    return driversLicenceModel;
  }


}