import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:new_panel/core/params/input_image_drivers_license.dart';
import 'package:new_panel/core/utils/coordinates_translator.dart';
import 'package:new_panel/main.dart';

class BarcodeModel{
  Future<List<String>> parseBarcode({required List<Barcode> barcodeList , required InputObjectDetectPropertyParams inputObjectDetectPropertyParams}) async{
    List<String> result = [];


    for (final barcode in barcodeList) {


      if(barcode.displayValue != null){
        String? vinNumber= RegExp( r"\s([A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{9}|[^\SA-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{10})([A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{3}|[A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{4})(\d{5}|[\d\s]{6})\b", caseSensitive: false).firstMatch(barcode.displayValue!)?.group(0);

        vinNumber ??= RegExp(r"\s([A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{8,9}|[A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{9,10})([A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{2,3}|[A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{3,4})(\d{4,5}|[\d\s]{5,6})\b", caseSensitive: false).firstMatch(barcode.displayValue!)?.group(0);

        vinNumber ??= RegExp( r"([A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{8,9}|[A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{9,10})([A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{2,3}|[A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{3,4})(\d{4,5}|[\d\s]{5,6})\b", caseSensitive: false).firstMatch(barcode.displayValue!)?.group(0);

        vinNumber ??= RegExp( r"\s([A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{8,10}|[A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{9,11})([A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{2,4}|[A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{3,5})(\d{3,4}|[\d\s]{5,7})\b", caseSensitive: false).firstMatch(barcode.displayValue!)?.group(0);

        vinNumber ??= RegExp( r"([A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{8,10}|[A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{9,11})([A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{2,4}|[A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{3,5})(\d{3,4}|[\d\s]{5,7})\b", caseSensitive: false).firstMatch(barcode.displayValue!)?.group(0);

        if(vinNumber != null){
          result.add(barcode.displayValue!);
        }
      }

      // result += 'Barcode: ${barcode.rawValue}\n\n';
      // logger.w("${barcode.boundingBox}     overlay is ${inputObjectDetectPropertyParams.overLayRect}");

      // final leftSide = translateX(
      //     barcode.boundingBox.left,
      //     // inputImageRotation,
      //     inputObjectDetectPropertyParams.sizeScreen,
      //     inputObjectDetectPropertyParams.inputImage.metadata!.size,
      //     inputObjectDetectPropertyParams.inputImage.metadata!.rotation,
      //     inputObjectDetectPropertyParams.cameraLensDirection
      // );
      //
      //
      // final topSide = translateY(
      //     barcode.boundingBox.top,
      //     inputObjectDetectPropertyParams.sizeScreen,
      //     inputObjectDetectPropertyParams.inputImage.metadata!.size,
      //     inputObjectDetectPropertyParams.inputImage.metadata!.rotation,
      //     inputObjectDetectPropertyParams.cameraLensDirection
      // );
      //
      // final rightSide = translateX(
      //     barcode.boundingBox.right,
      //     inputObjectDetectPropertyParams.sizeScreen,
      //     inputObjectDetectPropertyParams.inputImage.metadata!.size,
      //     inputObjectDetectPropertyParams.inputImage.metadata!.rotation,
      //     inputObjectDetectPropertyParams.cameraLensDirection
      // );
      //
      // final bottomSide = translateY(
      //     barcode.boundingBox.bottom,
      //     inputObjectDetectPropertyParams.sizeScreen,
      //     inputObjectDetectPropertyParams.inputImage.metadata!.size,
      //     inputObjectDetectPropertyParams.inputImage.metadata!.rotation,
      //     inputObjectDetectPropertyParams.cameraLensDirection
      // );
      // if(
      // topSide.toInt() <= inputObjectDetectPropertyParams.overLayRect.top.toInt() + 80 &&
      //     topSide.toInt() >= inputObjectDetectPropertyParams.overLayRect.top.toInt() - 80 &&
      //
      //     bottomSide.toInt() >= inputObjectDetectPropertyParams.overLayRect.bottom.toInt() - 80 &&
      //     bottomSide.toInt() <= inputObjectDetectPropertyParams.overLayRect.bottom.toInt() + 80 &&
      //
      //
      //     leftSide.toInt() <= inputObjectDetectPropertyParams.overLayRect.left.toInt() + 80 &&
      //     leftSide.toInt() >= inputObjectDetectPropertyParams.overLayRect.left.toInt() - 80 &&
      //     // left >= inputImageDetectionProperty.overLayRect.left.toInt() - 40 &&
      //     // bottom <= inputImageDetectionProperty.overLayRect.left.toInt() + 40 &&
      //     rightSide.toInt() <= inputObjectDetectPropertyParams.overLayRect.right.toInt() + 80 &&
      //     rightSide.toInt() >= inputObjectDetectPropertyParams.overLayRect.right.toInt() - 80)
      //   {
      //
      //     if(barcode.displayValue != null){
      //       String? vinNumber= RegExp( r"\s([A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{9}|[^\SA-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{10})([A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{3}|[A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{4})(\d{5}|[\d\s]{6})\b", caseSensitive: false).firstMatch(barcode.displayValue!)?.group(0);
      //
      //       vinNumber ??= RegExp(r"\s([A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{8,9}|[A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{9,10})([A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{2,3}|[A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{3,4})(\d{4,5}|[\d\s]{5,6})\b", caseSensitive: false).firstMatch(barcode.displayValue!)?.group(0);
      //
      //       vinNumber ??= RegExp( r"([A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{8,9}|[A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{9,10})([A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{2,3}|[A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{3,4})(\d{4,5}|[\d\s]{5,6})\b", caseSensitive: false).firstMatch(barcode.displayValue!)?.group(0);
      //
      //       vinNumber ??= RegExp( r"\s([A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{8,10}|[A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{9,11})([A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{2,4}|[A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{3,5})(\d{3,4}|[\d\s]{5,7})\b", caseSensitive: false).firstMatch(barcode.displayValue!)?.group(0);
      //
      //       vinNumber ??= RegExp( r"([A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{8,10}|[A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{9,11})([A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{2,4}|[A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{3,5})(\d{3,4}|[\d\s]{5,7})\b", caseSensitive: false).firstMatch(barcode.displayValue!)?.group(0);
      //
      //       if(vinNumber != null){
      //         result.add(barcode.displayValue!);
      //       }
      //     }
      //
      //
      //   }





    }
    return result;

  }
}