

import 'package:new_panel/core/enums/app_enums.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/ocr_entitiy.dart';



class ProcessOcrDetailModel extends OcrEntity{
  String? name;
  String? lastName ;
  String? address;
  String? number;
  String? iss;
  String? ddRef;
  String? sex;
  String? classCategory;
  String? restCond;
  String? exp;
  String? height;
  String? dobDdn;
  bool ? validate ;
  DriversLicenceModel? driversLicenceModel;
  String? eyesColor;
  String? hairColor;
  String? wight;
  String? textOfOcr;
  String? postalCode;
  String? street;
  int? frkCityId;
  String? cityName;
  List<dynamic>? suggestionList;

  ProcessOcrDetailModel({
    this.name,
    this.lastName,
    this.address,
    this.number,
    this.iss,
    this.ddRef,
    this.sex,
    this.classCategory,
    this.restCond,
    this.exp,
    this.height,
    this.dobDdn,
    this.validate,
    this.driversLicenceModel,
    this.hairColor ,
    this.eyesColor,
    this.wight,
    this.textOfOcr,
    this.postalCode,
    this.street,
    this.frkCityId,
    this.cityName,
    this.suggestionList
  });










}
