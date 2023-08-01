import 'dart:io';

import 'package:new_panel/core/enums/app_enums.dart';

class OcrResultEntity {
  DriversLicenceModel? driversLicenceModel = DriversLicenceModel.britishDriversLicence;
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
  bool? validate;
  String? eyesColor;
  String? hairColor;
  String? wight;
  String? textOfOcr;
  String? postalCode;
  String? street;
  int? frkCityId;
  File? imageFile;
  String? cityName;

  OcrResultEntity({
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
    this.dobDdn ,
    this.validate,
    this.driversLicenceModel,
    this.hairColor,
    this.eyesColor,
    this.wight,
    this.textOfOcr,
    this.frkCityId,
    this.street,
    this.postalCode,
    this.cityName,
    this.imageFile,
});
}