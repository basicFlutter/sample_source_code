import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:new_panel/core/extenstions/app_extension.dart';
import 'package:new_panel/core/params/input_image_drivers_license.dart';

class VinNumberModel{

  Future<String?> parsTextBlocAndGetVinNumber(
      {required List<TextBlock> textBlockList , required InputObjectDetectPropertyParams inputObjectDetectPropertyParams}) async{
    String result = "";
    for (final block in textBlockList) {
      for (final line in block.lines) {
        for (final element in line.elements) {
          result += "${element.text} ";
        }
      }
    }


    result = result.replaceAll(RegExp(r"CARFAX" , caseSensitive:  false), "");
    result = result.replaceAll(RegExp(r"\s+" , caseSensitive:  false), " ");
    result = result.replaceAll(RegExp(r"[o0]",caseSensitive: false), "0");





    String? vinNumber= RegExp( r"\s([A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{9}|[^\SA-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{10})([A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{3}|[A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{4})(\d{5}|[\d\s]{6})\b", caseSensitive: false).firstMatch(result)?.group(0);

    vinNumber ??= RegExp(r"\s([A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{8,9}|[A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{9,10})([A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{2,3}|[A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{3,4})(\d{4,5}|[\d\s]{5,6})\b", caseSensitive: false).firstMatch(result)?.group(0);

    vinNumber ??= RegExp( r"([A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{8,9}|[A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{9,10})([A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{2,3}|[A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{3,4})(\d{4,5}|[\d\s]{5,6})\b", caseSensitive: false).firstMatch(result)?.group(0);

    vinNumber ??= RegExp( r"\s([A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{8,10}|[A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{9,11})([A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{2,4}|[A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{3,5})(\d{3,4}|[\d\s]{5,7})\b", caseSensitive: false).firstMatch(result)?.group(0);

    vinNumber ??= RegExp( r"([A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{8,10}|[A-HJ-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{9,11})([A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d]{2,4}|[A-HI-NPR-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ\d\s]{3,5})(\d{3,4}|[\d\s]{5,7})\b", caseSensitive: false).firstMatch(result)?.group(0);


    if(vinNumber != null){
      vinNumber = vinNumber.replaceFrenchCharacters;
    }

    vinNumber = vinNumber?.replaceAll(RegExp(r'\s+'), "");

    return vinNumber;

  }

}