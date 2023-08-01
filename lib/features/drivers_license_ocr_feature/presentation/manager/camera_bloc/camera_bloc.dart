import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/camera_image_converter_params.dart';
import 'package:new_panel/core/params/crop_image_input_params.dart';
import 'package:new_panel/core/params/input_image_drivers_license.dart';
import 'package:new_panel/core/params/no_params.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/image_crop_file_entity.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/object_detect_entity.dart';

import 'package:new_panel/features/drivers_license_ocr_feature/domain/use_cases/cameraImage_to_InputImage_UseCase.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/use_cases/camera_useCase.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/use_cases/crop_image_useCase.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/use_cases/detect_driver_license_singleImage_useCase.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/use_cases/scanner_drivers_license_useCase.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/presentation/manager/camera_bloc/status/camera_status.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/presentation/manager/camera_bloc/status/crop_image_status.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/presentation/manager/camera_bloc/status/driver_license_detection_status.dart';

import 'package:new_panel/main.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  InitCameraUseCase initCameraUseCase;
  CameraImageToInputImageUseCase cameraImageToInputImageUseCase;
  ScannerDriversLicenseUseCase detectDriversLicenseUseCase;
  DetectDriverLicenseSingleImageUseCase detectDriverLicenseSingleImageUseCase;
  CropImageUseCase cropImageUseCase;
  Offset? centerOffset ;
  Size? sizeScreen;
  double? ratio;
  bool? isLandscape ;
  Rect? overLayRect;
  double? scale;
  bool isDetected = false;
  bool isStreamImageRunning = false;
  bool captureImage = false;
  CameraBloc({required this.initCameraUseCase , required this.detectDriverLicenseSingleImageUseCase,required this.cropImageUseCase,required this.cameraImageToInputImageUseCase , required this.detectDriversLicenseUseCase}) : super(CameraState(cameraStatus: CameraInit() , driverLicenseDetectionStatus: DriverLicenseDetectionInit() , cropImageStatus: CropImageInit())) {

    on<InitCameraEvent>((event, emit) async{
      logger.w("init");

      emit(state.copyWith(newCameraStatus: CameraInitLoading()));

      Either<ResponseError , CameraController> response = await initCameraUseCase(NoParams());

      response.fold((ResponseError responseError){

        emit(state.copyWith(newCameraStatus: CameraInitError(responseError: responseError)));

      }, (CameraController cameraController){


        emit(state.copyWith(newCameraStatus: CameraInitCompleted(cameraController: cameraController)));

      });


    });

    on<StartDetectDriverLicense>((event, emit) async{
      CameraController cameraController = event.cameraController;
      if(event.overLayRect != null){
        isLandscape = event.isLandscape;
        overLayRect = event.overLayRect;
        scale = event.scale;
        sizeScreen = event.sizeScreen;
        ratio = event.ratio;
        centerOffset = event.centerOffset;
      }

      logger.w(event.overLayRect);

      await cameraController.startImageStream((image) async {

        // emit(state.copyWith(newDriverLicenseDetectionStatus: DriverLicenseDetectionLoading()));
        isStreamImageRunning = true;
        InputImage? inputImage;
        Either<ResponseError ,InputImage? > inputImageResponse =
        await cameraImageToInputImageUseCase(CameraImageConverterParams(inputImage: image,indexCamera: cameraIndexGlobal));

        inputImageResponse.fold((l){

        }, (InputImage? input){
          inputImage  = input;
        });

        /// ########################################

        if (inputImage != null) {
          if (!isDetected) {
            Either<ResponseError,
                ObjectDetectEntity> result = await detectDriversLicenseUseCase(
                InputObjectDetectPropertyParams(
                    inputImage: inputImage!,
                    centerOffset: event.centerOffset ?? centerOffset!,
                    ratio: event.ratio ?? ratio!,
                    sizeScreen: event.sizeScreen ?? sizeScreen!,
                    isLandscape: event.isLandscape ?? isLandscape!,
                    overLayRect: event.overLayRect ?? overLayRect !,
                    scale: event.scale ?? scale!,
                  cameraLensDirection: event.cameraController.description.lensDirection
                )
            );

            result.fold((ResponseError responseError) {



            }, (ObjectDetectEntity objectDetectEntity) async {
              isDetected = true;
              try {
                if (isStreamImageRunning) {
                  await cameraController.stopImageStream();
                  for (int i = 10; i > 0; i--) {
                    await HapticFeedback.vibrate();
                  }
                  await Future.delayed(const Duration(milliseconds: 1000));
                  await cameraController.setFocusMode(FocusMode.locked);
                  await cameraController.setFlashMode(FlashMode.off);
                  add(DriverLicenseDetected(cameraController: cameraController , objectDetectEntity: objectDetectEntity));

                }
              } catch (e) {
                logger.e('from StartScanEvent error is $e');
              }
            });

            //
          }
        }
      });


    });



    on<DriverLicenseDetected>((event, emit) async{

      final cameraImage = await event.cameraController.takePicture();
      emit(state.copyWith(newCameraStatus: CameraInitLoading()));
      add(CropImageEvent(cropImageInputParam: CropImageInputParam(
          file: File(cameraImage.path),
          width: 1.sw.toInt(),
          aspectRatio: 1.59,
          quality: 100,
          boundingRect: event.objectDetectEntity.boundingRect,
          fromGallery: false
      ),));



      await event.cameraController.dispose();
      event.cameraController.removeListener(() { });
      imageCache.clear();
      imageCache.clearLiveImages();
      await event.cameraController.dispose();
      isDetected = false;

    });

    on<CropImageEvent>((event, emit) async{
      emit(state.copyWith(newCropImageStatus: CropImageLoading()));

      Either<ResponseError , ImageCropFileEntity> response = await cropImageUseCase(event.cropImageInputParam);

      response.fold((ResponseError responseError) {
        emit(state.copyWith(newCropImageStatus: CropImageError(responseError: responseError)));
      }, (ImageCropFileEntity imageCropFileEntity){
        logger.w(imageCropFileEntity.imageCropFile);

        emit(state.copyWith(newCropImageStatus: CropImageCompleted(imageFile: imageCropFileEntity.imageCropFile)));

      });

    });

    on<DetectDriverLicenseFromImageGallery>((event, emit) async {
      InputImage inputImage = InputImage.fromFile(event.imageFile);
      var decodedImage = await decodeImageFromList(event.imageFile.readAsBytesSync());
     Either< ResponseError , ObjectDetectEntity> response = await detectDriverLicenseSingleImageUseCase(inputImage);

     response.fold((ResponseError responseError){
       logger.e("eeeee");
       add(CropImageEvent(cropImageInputParam: CropImageInputParam(
           file: event.imageFile,
           width: decodedImage.width,
           aspectRatio: decodedImage.width / decodedImage.height,
           quality: 100,
           boundingRect: null,
           fromGallery: true
       ),));

     }, (ObjectDetectEntity objectDetectEntity){
       add(CropImageEvent(cropImageInputParam: CropImageInputParam(
           file: event.imageFile,
           width: decodedImage.width,
           aspectRatio: decodedImage.width / decodedImage.height,
           quality: 100,
           boundingRect: objectDetectEntity.boundingRect,
           fromGallery: true
       ),));
     });


    });


    on<DisposeCamera>((event, emit) async{
      emit(state.copyWith(newCameraStatus: CameraInitLoading()));
      try{
        await event.cameraController.dispose();
        await event.cameraController.stopImageStream();
        event.cameraController.removeListener(() { });
        imageCache.clear();
        imageCache.clearLiveImages();
        await event.cameraController.dispose();
        isDetected = false;
      }catch (e){
        logger.e(e);
      }

    });


  }
}
