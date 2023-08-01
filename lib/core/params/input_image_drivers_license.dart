import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

class InputObjectDetectPropertyParams{

  InputImage inputImage;
  Offset centerOffset ;
  Size sizeScreen;
  double ratio;
  bool isLandscape ;
  Rect overLayRect;
  double scale;
  CameraLensDirection cameraLensDirection;
  InputObjectDetectPropertyParams({required this.inputImage ,required this.cameraLensDirection,required this.centerOffset , required this.ratio , required this.sizeScreen , required this.isLandscape  , required this.overLayRect , required this.scale});

}