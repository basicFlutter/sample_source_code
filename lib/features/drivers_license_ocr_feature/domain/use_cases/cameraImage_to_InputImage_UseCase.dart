import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/camera_image_converter_params.dart';
import 'package:new_panel/core/use_case/base_use_case.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/use_cases/camera_useCase.dart';

class CameraImageToInputImageUseCase extends BaseUseCase<InputImage? , CameraImageConverterParams >{

  @override
  Future<Either<ResponseError, InputImage?>> call(CameraImageConverterParams params) async{
    final cameras = await availableCameras();
    final camera = cameras[cameraIndexGlobal];
    final rotation =
    InputImageRotationValue.fromRawValue(camera.sensorOrientation);
    if (rotation == null){
      return Left(ResponseError(
          message: "Image Rotation is null",
          alertType: null ,
          act: null,
          data: null,
          entity: null,
          reason: null,
          type: null
      ));
    }


    final format = InputImageFormatValue.fromRawValue(params.inputImage.format.raw);
    if (format == null ||
        (Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) {
      return Left(ResponseError(
          message: "Invalid Format Image",
          alertType: null ,
          act: null,
          data: null,
          entity: null,
          reason: null,
          type: null
      ));
    }


    final plane = params.inputImage.planes.first;

    InputImage inputImage = InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(params.inputImage.width.toDouble(), params.inputImage.height.toDouble()),
        rotation: rotation,
        format:format,
        bytesPerRow: plane.bytesPerRow,
      ),
    );

    return Right(inputImage);

  }

}