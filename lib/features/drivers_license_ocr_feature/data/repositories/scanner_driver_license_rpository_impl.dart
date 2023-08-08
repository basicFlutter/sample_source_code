import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:new_panel/core/constants/constants.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/input_image_drivers_license.dart';
import 'package:new_panel/core/utils/coordinates_translator.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/data_sources/local/object_detection.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/data_sources/local/process_scanner.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/object_detect_entity.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/vin_number_entity.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/repositories/scanner_repository.dart';

import 'package:new_panel/main.dart';

class ScannerDriverLicenseRepositoryImpl extends ScannerRepository{
  ObjectDetection objectDetection = ObjectDetection();
  // ProcessOcr processOcr;
  // ScannerRepositoryImpl({required this.processOcr});
  bool isBusy = false;
  @override
  Future<Either<ResponseError, ObjectDetectEntity>> detectDriversLicense({required InputObjectDetectPropertyParams inputImageDetectionProperty})async {
   // List<DetectedObject> objects = await objectDetection.processImage(inputImage: inputImageDetectionProperty.inputImage, modeProcess: DetectionMode.stream);
    List<DetectedObject>? objects;
    // List<DetectedObject> ? objects;
    DetectedObject? driversLicenceObject;

    if (!isBusy) {

      isBusy = true;

      try {
        //   logger.i("before process objects value is : $objects");
        //    objects = [];


        if(objects != null ){
          objects.clear();
          objects = [];
        }
        objects = await objectDetection.processImage(
            inputImage: inputImageDetectionProperty.inputImage,
            modeProcess: DetectionMode.stream);



        List<String> labelList = [];
        for(var obj in objects){

          for(var label in obj.labels){
            labelList.add(label.text);
          }
        }



        for (final object in objects) {

          if(labelList.contains("Driver's license") ||
              labelList.contains("Driver's license") ||
              labelList.contains('(Driver"s license)') ||
              labelList.contains('Business card') ||
              labelList.contains('Poster') ||
              labelList.contains('Receipt') ||
              labelList.contains("(Driver's license)")){


            // await CheckDriversLicence.objectDetector!.close();

            InputImageRotation inputImageRotation = InputImageRotation.rotation90deg;

            if (inputImageDetectionProperty.isLandscape) {
              inputImageRotation = InputImageRotation.rotation0deg;
            }

            if (inputImageDetectionProperty.inputImage.metadata?.rotation != null && inputImageDetectionProperty.inputImage.metadata?.size != null) {

              final leftSide = translateX(
                  object.boundingBox.left,
                  // inputImageRotation,
                  inputImageDetectionProperty.sizeScreen,
                  inputImageDetectionProperty.inputImage.metadata!.size,
                  inputImageDetectionProperty.inputImage.metadata!.rotation,
                inputImageDetectionProperty.cameraLensDirection
              );


              final topSide = translateY(
                  object.boundingBox.top,
                  inputImageDetectionProperty.sizeScreen,
                  inputImageDetectionProperty.inputImage.metadata!.size,
                  inputImageDetectionProperty.inputImage.metadata!.rotation,
                  inputImageDetectionProperty.cameraLensDirection
              );

              final rightSide = translateX(
                  object.boundingBox.right,
                  inputImageDetectionProperty.sizeScreen,
                  inputImageDetectionProperty.inputImage.metadata!.size,
                  inputImageDetectionProperty.inputImage.metadata!.rotation,
                  inputImageDetectionProperty.cameraLensDirection
              );

              final bottomSide = translateY(
                  object.boundingBox.bottom,
                  inputImageDetectionProperty.sizeScreen,
                  inputImageDetectionProperty.inputImage.metadata!.size,
                  inputImageDetectionProperty.inputImage.metadata!.rotation,
                  inputImageDetectionProperty.cameraLensDirection
              );

              if (inputImageDetectionProperty.isLandscape) {
                if (topSide.toInt() <= inputImageDetectionProperty.overLayRect.top.toInt() + 35 &&
                    topSide.toInt() >= inputImageDetectionProperty.overLayRect.top.toInt() - 35 &&
                    bottomSide <= inputImageDetectionProperty.overLayRect.bottom.toInt() + 35 &&
                    bottomSide >= inputImageDetectionProperty.overLayRect.bottom.toInt() - 35) {
                //  ObjectDetectEntity objectDetectEntity = ObjectDetectEntity(boundingRect: object.boundingBox);

                  objects = [];
                  labelList = [];
                  await objectDetection.closeDetector();
                  ObjectDetectEntity objectDetectEntity = ObjectDetectEntity(boundingRect: object.boundingBox);

                  return Right(objectDetectEntity);
                  // driversLicenceObject = object;
                  // break;
                }

              } else {
              //  logger.w("top : ${topSide.toInt()} ==> ${inputImageDetectionProperty.overLayRect.top.toInt()} \n bottom : ${bottomSide.toInt()} ==> ${inputImageDetectionProperty.overLayRect.bottom.toInt()} \n left : ${leftSide.toInt()} ==> ${inputImageDetectionProperty.overLayRect.left.toInt()} \n right : ${rightSide.toInt()} ==> ${inputImageDetectionProperty.overLayRect.right.toInt()}");
                if (
                // top.toInt() <= screenPropertyInputParam.overLayRect.top.toInt() + 80 &&
                //     top.toInt() >= screenPropertyInputParam.overLayRect.top.toInt() - 80 &&
                //     bottom <= screenPropertyInputParam.overLayRect.bottom.toInt() + 80 &&
                //     bottom >= screenPropertyInputParam.overLayRect.bottom.toInt() - 80 &&
                topSide.toInt() <= inputImageDetectionProperty.overLayRect.top.toInt() + 80 &&
                    topSide.toInt() >= inputImageDetectionProperty.overLayRect.top.toInt() - 80 &&

                    bottomSide.toInt() >= inputImageDetectionProperty.overLayRect.bottom.toInt() - 80 &&
                    bottomSide.toInt() <= inputImageDetectionProperty.overLayRect.bottom.toInt() + 80 &&


                leftSide.toInt() <= inputImageDetectionProperty.overLayRect.left.toInt() + 80 &&
                leftSide.toInt() >= inputImageDetectionProperty.overLayRect.left.toInt() - 80 &&
               // left >= inputImageDetectionProperty.overLayRect.left.toInt() - 40 &&
                   // bottom <= inputImageDetectionProperty.overLayRect.left.toInt() + 40 &&
                    rightSide.toInt() <= inputImageDetectionProperty.overLayRect.right.toInt() + 80 &&
                    rightSide.toInt() >= inputImageDetectionProperty.overLayRect.right.toInt() - 80
                ) {

                  inputImageDetectionProperty.overLayRect = const Rect.fromLTRB(0,0,0,0);
                  ObjectDetectEntity objectDetectEntity = ObjectDetectEntity(boundingRect: object.boundingBox);

                  objects = [];
                  labelList = [];
                  await objectDetection.closeDetector();
                  return Right(objectDetectEntity);
                  // driversLicenceObject = object;
                  // break;
                }
              }
            }
          }else{
            logger.w("not found");
          }

        }
        isBusy = false;
        objects = [];
        labelList = [];
        return Left(ResponseError(
            message: "Drivers License No Detect",
            alertType: null ,
            act: null,
            data: null,
            entity: null,
            reason: null,
            type: null
        ));
      } catch (e) {
        driversLicenceObject = null;
        objects = [];
        await objectDetection.closeDetector();
        isBusy = false;

        return Left(ResponseError(
            message: "Drivers License Scanner has error : $e",
            alertType: null ,
            act: null,
            data: null,
            entity: null,
            reason: null,
            type: null
        ));
      }
    } else {
      driversLicenceObject = null;
      objects = [];
      isBusy = false;
      return Left(ResponseError(
          message: "Drivers License Scanner is Busy",
          alertType: null ,
          act: null,
          data: null,
          entity: null,
          reason: null,
          type: null
      ));
    }

  }

  @override
  Future<Either<ResponseError, ObjectDetectEntity>> detectDriversLicenseFromSingleImage({required InputImage inputImage}) async{
    List<DetectedObject>? objects;
    objects = await objectDetection.processImage(
        inputImage: inputImage,
        modeProcess: DetectionMode.single);

    List<String> labelList = [];
    for(var obj in objects){
      for(var label in obj.labels){
        labelList.add(label.text);
      }
    }
    logger.i(labelList);

    for (final object in objects) {
      if(labelList.contains("Driver's license") ||
          labelList.contains("Driver's license") ||
          labelList.contains('(Driver"s license)') ||
          labelList.contains('Business card') ||
          labelList.contains('Poster') ||
          labelList.contains('Receipt') ||
          labelList.contains("(Driver's license)")) {
        objectDetection.closeDetector();
        ObjectDetectEntity objectDetectEntity = ObjectDetectEntity(boundingRect: object.boundingBox);

        return Right(objectDetectEntity);
      }
    }

    return Left(ResponseError(
        message: "Drivers License Not Found",
        alertType: null ,
        act: null,
        data: null,
        entity: null,
        reason: null,
        type: null
    ));



      }

  // @override
  // Future<Either<ResponseError, VinNumberEntity>> detectVinNumber({required InputImage inputImage}) async{
  //   List<TextBlock> textBlock = [];
  //   try{
  //     textBlock = await processOcr.imageToTextProcess(imageAdjusted ?? imageFile);
  //
  //   }catch (e){
  //
  //   }
  // }



}