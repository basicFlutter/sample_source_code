import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/date_class_model.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/drivers_license/drivers_license.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/full_name_class.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/license_number_model.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/ocr_detail_model.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/postal_code_model.dart';

abstract class DriversLicenseRepository{


  ProcessOcrDetailModel getProcessOcrResult(List<TextBlock> textBlock);
  List<String> getCleanTex(List<TextBlock> textBlock);
  MyDataClass getDate(String ocrResult);
  String? fixDate(String element);
  PostalCodeModel getPostalCode(String ocrResult);
  String? fixPostalCode(List<String> postalCode);
  FullNameClass getFullName( String? resultOcr, String? address , String? mainPostalCode);
  String? getAddress({required String resultStringOcr,required String? postalCodeFixed,  String? postalCodeFromString});
  String fixNumber({required String number});
  LicenseNumberModel getLicenseNumber(String mainResultStringOcr);
  String? fixLicenseNumber(String mainResultStringOcr);
  String? getGender(String resultOcr);





}


