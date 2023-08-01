import 'dart:io';
import 'dart:ui';

class CropImageInputParam{

  File file;
  double aspectRatio;
  int width;
  int? quality ;

  Rect? boundingRect ;

  bool fromGallery;




  CropImageInputParam({
    required this.file , required this.aspectRatio , required this.width , required this.quality , this.boundingRect ,
    required this.fromGallery

  });

}