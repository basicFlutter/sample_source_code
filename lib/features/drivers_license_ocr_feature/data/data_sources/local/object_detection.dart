import 'package:flutter/services.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:new_panel/core/constants/constants.dart';
import 'package:new_panel/main.dart';
import 'dart:io'as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
class ObjectDetection{

  static String? modelPath;
  ObjectDetector? objectDetector;

  List<DetectedObject> ? objects;
  Future<List<DetectedObject>> processImage({required InputImage inputImage,required DetectionMode modeProcess}) async {

    objects = [];

    try{
      if(modeProcess == DetectionMode.single){
        await  closeDetector();
      }

      objectDetector = await init(modeProcess);

      objects = await objectDetector!.processImage(inputImage);
      logger.w(objects);
      return objects!;
    }catch(e){
      logger.e(e);
      await  closeDetector();
      throw Exception("error is : $e");
    }


  }



  Future<void> closeDetector()async{

    if(objectDetector != null){
      logger.i("close detector");
      await objectDetector!.close();
      objectDetector = null;
    }

  }


  Future<ObjectDetector?> init(DetectionMode detectionMode)async{
    const path = Constants.pathOfMlKitModel;
    List<DetectedObject> ? objects;
    modelPath ??= await _getModel(path);

    final options = LocalObjectDetectorOptions(
      mode: detectionMode,
      modelPath: modelPath!,
      classifyObjects: true,
      multipleObjects: true,
      // maximumLabelsPerObject: 1,
      confidenceThreshold: 0.05,
    );

    objectDetector =  ObjectDetector(options: options);


    return objectDetector;
  }

  static Future<String> _getModel(String assetPath) async {
    if (io.Platform.isAndroid) {
      return 'flutter_assets/$assetPath';
    }
    final path = '${(await getApplicationSupportDirectory()).path}/$assetPath';
    await io.Directory(dirname(path)).create(recursive: true);
    final file = io.File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }


}