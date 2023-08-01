import 'dart:io';
import 'package:image/image.dart' as img;
import 'dart:math' as math;

import 'package:path_provider/path_provider.dart';

class ImproveImageDriverLicense {


  Future<File?> adjustBrightnessAndContrast(File imageFile, {double brightness = 0, double contrast = 0}) async{
    img.Image? image = img.decodeImage(imageFile.readAsBytesSync());
    if(image == null){
      throw Exception("image is null");
    }

    int brightnessValue = (brightness * 255).round();

    int contrastValue = (contrast * 100).round();

    for(var pixel in image){
      int r = pixel.r.toInt()+ brightnessValue;
      int g = pixel.g.toInt() + brightnessValue;
      int b = pixel.b.toInt() + brightnessValue;

      r = math.max(0, math.min(255, r));
      g = math.max(0, math.min(255, g));
      b = math.max(0, math.min(255, b));

      r = ((r - 128) * (100 + contrastValue) / 100).round() + 128;
      g = ((g - 128) * (100 + contrastValue) / 100).round() + 128;
      b = ((b - 128) * (100 + contrastValue) / 100).round() + 128;

      r = math.max(0, math.min(255, r));
      g = math.max(0, math.min(255, g));
      b = math.max(0, math.min(255, b));

      if(r>240 && g > 240 && b > 240){
        r = r*0.5.round();
        g = g*0.5.round();
        b = b*0.5.round();
      }
       pixel.setRgb(r, g, b);
    }

      final tempDir = await getTemporaryDirectory();
      final tempFile = await File('${tempDir.path}/${DateTime.now()}temp.jpg').create();
    final png = img.encodePng(image,level: 0);
      tempFile.writeAsBytesSync(png);

      return tempFile;

  }





}