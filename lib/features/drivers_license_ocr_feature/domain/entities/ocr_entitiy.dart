import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:new_panel/core/enums/app_enums.dart';

class OcrEntity extends Equatable{
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
  String? provinceName;


  OcrEntity({
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
    this.provinceName
  });

  @override
  List<Object?> get props => [name,lastName, address , number , iss, ddRef , sex , classCategory , restCond ,exp , height ,
    dobDdn,validate,driversLicenceModel , eyesColor , hairColor , wight , textOfOcr , postalCode , street , frkCityId , imageFile,cityName,provinceName];


  Map toJson() => {
    'name':name  ,
    "address": address ,
    "number":number ,
    "iss":iss ,
    "ddRef": ddRef ,
    "sex": sex,
    "classCategory":classCategory,
    // "restCond" : restCond ,
    "exp": exp,
    "height":height,
    "dobDdn":dobDdn,
    "driversLicenceModel":driversLicenceModel,
    "eyesColor":eyesColor,
    "hairColor":hairColor,
    "wight": wight,
  };


}