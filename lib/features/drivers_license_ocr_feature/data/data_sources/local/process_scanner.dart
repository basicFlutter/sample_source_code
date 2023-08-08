import 'dart:io';

import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class ProcessScanner {



  Future<List<TextBlock>> imageToTextProcess(File inputImage) async {
    final textDetector = TextRecognizer(script: TextRecognitionScript.latin, );
    final recognisedText = await textDetector.processImage(InputImage.fromFilePath(inputImage.path));
    await textDetector.close();
    return recognisedText.blocks;
  }

  Future<List<TextBlock>> inputImageToTextProcess(InputImage inputImage) async {
    final textDetector = TextRecognizer(script: TextRecognitionScript.latin, );

    final recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    return recognisedText.blocks;
  }

  Future<List<Barcode>> inoutImageProcessBarcode(InputImage inputImage) async{
    final BarcodeScanner barcodeScanner = BarcodeScanner();
    await barcodeScanner.close();
   return await barcodeScanner.processImage(inputImage);
  }



}