import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:image/image.dart' as img;

import 'dart:ui' as ui;
import 'package:logger/logger.dart';
import 'package:new_panel/core/params/crop_image_input_params.dart';
import 'package:new_panel/core/params/crop_resize_argument.dart';
import 'package:new_panel/main.dart';
class CropImageClass {


  Rect? objectRect;
  Rect? overLayRect;
  Size? overLaySize;
  bool fromGallery = false;


  Rectangle<int> _getCropRect({
    required int sourceWidth,
    required int sourceHeight,
    required double aspectRatio,
    required bool rectISNull
  }) {
    var left = 0;
    var top = 0;
    var width = sourceWidth;
    var height = sourceHeight;








    if (aspectRatio < sourceWidth / sourceHeight) {
      // crop horizontally, from width
      // width = (sourceHeight * aspectRatio).toInt(); // set new cropped width
      // left = (sourceWidth - width) ~/ 2;

      width = ( sourceHeight * 0.85).toInt();/// این میگه که مستطیل تا کجا ادامه داشته باشه
      left = (sourceWidth - width) ~/2; /// این میگه که نقظه سمت چپ مستطیل از کجا شروع بشه
    }
    else if (aspectRatio > sourceWidth / sourceHeight) {
      // crop vertically, from height
      height = sourceWidth ~/ aspectRatio; // set new cropped height
      top = (sourceHeight - height) ~/ 2;
      // top = (sourceHeight - height) ~/ 2;
      width = (sourceWidth *0.8).toInt();/// این میگه که مستطیل تا کجا ادامه داشته باشه
      left = (sourceWidth - width) ~/1.8 ; /// این میگه که نقظه سمت چپ مستطیل از کجا شروع بشه
    }


    /* if (aspectRatio < sourceWidth / sourceHeight) {
        // crop horizontally, from width
        // width = (sourceHeight * aspectRatio).toInt(); // set new cropped width
        // left = (sourceWidth - width) ~/ 2;

        width = ( objectRect!.width).toInt();/// این میگه که مستطیل تا کجا ادامه داشته باشه
        left = (sourceWidth - objectRect!.width) ~/2; /// این میگه که نقظه سمت چپ مستطیل از کجا شروع بشه

      }
      else if (aspectRatio > sourceWidth / sourceHeight) {
        // crop vertically, from height
        top = (sourceHeight - overLaySize!.height) ~/ overLaySize!.aspectRatio;
        // top = objectRect!.top.toInt();
        width = (sourceWidth - (overLaySize!.width.toInt())*2);/// این میگه که مستطیل تا کجا ادامه داشته باشه
        height = (sourceHeight-objectRect!.height).toInt(); // set new cropped height
        left = (overLaySize!.width.toInt()).toInt()  ; /// این میگه که نقظه سمت چپ مستطیل از کجا شروع بشه

      }*/


    return Rectangle<int>(left, top, width, height);

  }

  /// Center crop the source image with given aspectRatio
  img.Image _centerCrop(img.Image source, double aspectRatio){

    // final rect = _getCropRect(
    //     sourceWidth: source.width,
    //     sourceHeight: source.height,
    //     aspectRatio: aspectRatio);
    // return img.copyCrop(source, rect.left, rect.top, rect.width, rect.height);


    if(fromGallery ){
      logger.w("fromGallery");
      return cropImageFromRect(inputImageFile: source , cropRect: objectRect);
    }


    final rect = _getCropRect(
        sourceWidth: source.width,
        sourceHeight: source.height,
        aspectRatio: aspectRatio,
        rectISNull: false
    );
    return img.copyCrop(source,x: rect.left,y:rect.top,width:rect.width,height: rect.height);



  }






  /// Crops and resize the image with given aspectRatio and width
  img.Image _cropAndResize(img.Image src, double aspectRatio, int width) {
    final cropped = _centerCrop(src, aspectRatio);
    final croppedResized = img.copyResize(
      cropped,
      width: width,
      interpolation: img.Interpolation.average,
    );
    return croppedResized;
  }

  Future<File> cropAndResizeFile({
    required CropImageInputParam cropImageInputParam
  }) async {

    // overLaySize = cropImageInputParam.overLaySize;
    // objectRect = cropImageInputParam.boundingRect;
    // overLayRect = cropImageInputParam.overLayRect;
    fromGallery = cropImageInputParam.fromGallery;

    if(fromGallery && cropImageInputParam.boundingRect != null){

      objectRect = cropImageInputParam.boundingRect;
      logger.w("fromGallery");
      // ObjectDetection objectDetection = ObjectDetection();
      //
      // List<DetectedObject> objectList = await objectDetection.processImage(inputImage:InputImage.fromFile(cropImageInputParam.file) , modeProcess: DetectionMode.stream);
      // for(var obj in objectList){
      //
      //   for(var label in obj.labels){
      //     if(
      //     label.text.contains("Driver's license")||
      //         label.text.contains('Driver"s licence')||
      //         label.text.contains("Business card")||
      //         label.text.contains("(Driver's license)")
      //     ){
      //       objectRect = obj.boundingBox;
      //     }
      //   }
      // }
  //    objectRect = await detectObjectForCrop.detectObject(cropImageInputParam.file);

    }


    // if(cropImageInputParam.overLaySize != null){
    //
    //   overLaySize = cropImageInputParam.overLaySize;
    //   rect = cropImageInputParam.overLayRect;
    //
    // }else{
    //   DetectObjectForCrop detectObjectForCrop = DetectObjectForCrop();
    //   rect = await detectObjectForCrop.detectObject(cropImageInputParam.file);
    // }



    return compute<CropResizeArgs, File>(
        _cropAndResizeFile,
        CropResizeArgs(
          sourcePath: cropImageInputParam.file.path,
          destPath: '${cropImageInputParam.file.path}_compressed.jpg',
          aspectRatio: cropImageInputParam.aspectRatio,
          width: cropImageInputParam.width,
          quality: cropImageInputParam.quality ?? 100,

        ));

  }





  Future<File> _cropAndResizeFile(CropResizeArgs args) async {
    final image = img.decodeImage(await File(args.sourcePath).readAsBytes());

    if (image == null) throw Exception('Unable to decode image from file');

    final croppedResized = _cropAndResize(image, args.aspectRatio, args.width);

    // Encoding image to jpeg to compress the image.
    // final jpegBytes = img.encodeJpg(croppedResized, quality: args.quality);
    final jpegBytes = img.encodePng(croppedResized, level: 0);

    final croppedImageFile = await File(args.destPath).writeAsBytes(jpegBytes);
    return croppedImageFile;
  }



  Future<File> cropImageFromRectReturnFile({required File inputImageFile,required ui.Rect cropRect}) async {
    Uint8List inputBytes = await inputImageFile.readAsBytes();
    img.Image? image = img.decodeImage(inputBytes);
    if(image == null){
      throw Exception("image for crop is null");
    }
    int cropX = cropRect.left.toInt();
    int cropY = cropRect.top.toInt();
    int cropWidth = cropRect.width.toInt();
    int cropHeight = cropRect.height.toInt();
    img.Image croppedImage = img.copyCrop(image,x: cropX,y: cropY,width:  cropWidth,height: cropHeight);
    /// inja az jpg be png tabdil kardam
    Uint8List croppedBytes = Uint8List.fromList(img.encodePng(croppedImage,level: 0));
    String inputPath = inputImageFile.path;
    String outputPath = '${inputPath.substring(0, inputPath.lastIndexOf('.'))}_cropped.jpg';
    File outputImageFile = File(outputPath);
    await outputImageFile.writeAsBytes(croppedBytes);
    return outputImageFile;
  }


  img.Image cropImageFromRect({required img.Image inputImageFile,required ui.Rect? cropRect})  {

    img.Image image = inputImageFile;
    int cropX = 0;
    int cropY = (cropRect?.top.toInt() ?? 20 )-20;
    int cropWidth = inputImageFile.width;
    int cropHeight =cropRect?.height.toInt() == null ? inputImageFile.height: cropRect!.height.toInt()+20;
    img.Image croppedImage = img.copyCrop(image,x: cropX,y: cropY,width:  cropWidth,height: cropHeight);

    return croppedImage;
  }

}
