import 'dart:io';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class ProcessOcr {

  Future<List<TextBlock>> imageToTextProcess(File inputImage) async {
    final textDetector = TextRecognizer(script: TextRecognitionScript.latin, );
    final recognisedText = await textDetector.processImage(InputImage.fromFilePath(inputImage.path));
    return recognisedText.blocks;
  }

}