import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/no_params.dart';
import 'package:new_panel/core/use_case/base_use_case.dart';
import 'package:new_panel/main.dart';
import 'package:permission_handler/permission_handler.dart';

int cameraIndexGlobal= 0;
class InitCameraUseCase extends BaseUseCase<CameraController , NoParams>{
  int cameraIndex = 0;
  CameraController? controller;
  @override
  Future<Either<ResponseError, CameraController>> call(NoParams params) async{
// await Permission.ignoreBatteryOptimizations.request();

  try{
    await Permission.camera.request();
    var status = await Permission.camera.status;
    if (status.isGranted) {

      final cameras = await availableCameras();
      if (cameras.any(
            (element) =>
        element.lensDirection == CameraLensDirection.back &&
            element.sensorOrientation == 90,
      )) {
        cameraIndex = cameras.indexOf(
          cameras.firstWhere((element) =>
          element.lensDirection == CameraLensDirection.back &&
              element.sensorOrientation == 90),
        );
      } else {
        cameraIndex = cameras.indexOf(
          cameras.firstWhere(
                (element) => element.lensDirection == CameraLensDirection.back,
          ),
        );
      }
      cameraIndexGlobal = cameraIndex;
      final camera = cameras[cameraIndex];
      controller  = CameraController(
        camera,
        ResolutionPreset.max,
        enableAudio: false,
        imageFormatGroup: Platform.isAndroid
            ? ImageFormatGroup.nv21
            : ImageFormatGroup.bgra8888,
      );



      await controller?.initialize();
      await controller?.setFocusMode(FocusMode.auto);
     // await controller?.setFlashMode(FlashMode.off);
      final minZoomLevel = await controller?.getMinZoomLevel();
      await controller?.setZoomLevel(minZoomLevel ?? 1);

      return Right(controller!);

    }

    return Left(ResponseError(
        message: "Camera Permission is Denied",
        alertType: null ,
        act: null,
        data: null,
        entity: null,
        reason: null,
        type: null
    ));

  }catch (e){
    return Left(ResponseError(
        message: "Camera Initialize has Error And Error is $e",
        alertType: null ,
        act: null,
        data: null,
        entity: null,
        reason: null,
        type: null
    ));
  }

  }






}