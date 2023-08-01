import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:new_panel/core/extenstions/app_extension.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/date_class_model.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/drivers_license/drivers_license.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/full_name_class.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/license_number_model.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/ocr_detail_model.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/postal_code_model.dart';

import 'package:new_panel/main.dart';
import 'package:string_similarity/string_similarity.dart';
import 'drivers_license.dart';

class BritishDriversLicense extends DriversLicenseRepository{

  RegExp dateRegex = RegExp(r"\d{4}-\w{3,4}-\d{2}", caseSensitive: false); /// 1980-jun-12
  RegExp licenseNumberRegex = RegExp(r"\s?[Dd][lL]\s?:\s?(\d*)" , caseSensitive: false); /// DL:4022787




  @override
  ProcessOcrDetailModel getProcessOcrResult(List<TextBlock> textBlock) {
    String resultStringOcr = "";
    String mainResultStringOcr = "";
    String? name = "";
    String? lastName = "";
    String? sex = "";
    PostalCodeModel postalCodeModel ;
    String? postalCode;
    String? address = "";
    String? issuedDate;
    String? birthDate;
    String? expDate;
    LicenseNumberModel licenseNumber;

    List<String> result = getCleanTex(textBlock);
    resultStringOcr = result[0];
    mainResultStringOcr = result[1];
    licenseNumber = getLicenseNumber(resultStringOcr);

    sex = getGender(resultStringOcr);
    /// remove licenseNumber
    if (licenseNumber.mainLicenseNumber != null) {
      resultStringOcr =
          resultStringOcr.replaceFirst(licenseNumber.mainLicenseNumber!, " ");
    }
    MyDataClass dataClass = getDate(resultStringOcr);
    if(dataClass.resultRemovedDate != null){
    resultStringOcr = dataClass.resultRemovedDate!;
    }

    postalCodeModel = getPostalCode(resultStringOcr);
    if(postalCodeModel.fixedPostalCode != null && postalCodeModel.mainPostalCode != null){
      resultStringOcr = resultStringOcr.replaceAll(postalCodeModel.mainPostalCode!, postalCodeModel.fixedPostalCode!);
    }


    resultStringOcr = resultStringOcr.replaceAll(RegExp(r"w?[etl]?\s?:?\s?\d+\s*k[cgaq]", caseSensitive: false), " ");
    resultStringOcr = resultStringOcr.replaceAll(RegExp(r"h?[et]?\s?:?\s?\d+\s*c[mn]", caseSensitive: false), " ");

    resultStringOcr =   resultStringOcr.replaceAll(RegExp(r"\b[A-EG-LN-Z]\b", caseSensitive: false), " ");


    postalCode = postalCodeModel.fixedPostalCode;
    address = getAddress(resultStringOcr: resultStringOcr, postalCodeFixed: postalCodeModel.fixedPostalCode,postalCodeFromString: postalCodeModel.mainPostalCode);

    if(address != null){
      address = address.replaceFrenchCharacters.toUpperCase();
    }

    FullNameClass fullName= getFullName(resultStringOcr,address , postalCodeModel.mainPostalCode);
    name = fullName.firstName;
    lastName = fullName.lastName;

    if(name != null){
      address = address?.replaceAll(name.trim(), "");
    }
    if(lastName != null){
      address = address?.replaceAll(lastName.trim(), "");
      address =address?.replaceAll(RegExp(r"\s+"), " ");
    }

    if(sex != null){
      address = address?.replaceAll(sex, "");
    }
    address = address?.replaceFirst(RegExp(r"\d{2}\s?\."), "");

    address = address?.replaceFirst(RegExp(r".*\s?wt:?", caseSensitive: false), "");
    address = address?.trim();
    address = address?.replaceAll(RegExp(r"\w?\s?\d{3,4}\s?-\s?\d{5}\s?-\s?\d{5}" ,caseSensitive: false), " ");
    address = address?.replaceAll(",", "");



    String patternProvinceRegex = r"\s\w{2}\sPOSTAL\s?.*";


    if(postalCodeModel.mainPostalCode != null){
      RegExp regexPostal = RegExp(patternProvinceRegex.replaceAll("POSTAL", postalCodeModel.mainPostalCode!.trim()) , caseSensitive:  false);
      address = address?.replaceAll(regexPostal, " ");
      address = address?.replaceAll(postalCodeModel.mainPostalCode!.trim(), "");
    }
    if(postalCodeModel.mainPostalCode != null){
      RegExp regexPostal = RegExp(patternProvinceRegex.replaceAll("POSTAL", postalCodeModel.mainPostalCode!.trim()) , caseSensitive:  false);
      address = address?.replaceAll(regexPostal, " ");
      address = address?.replaceAll(postalCodeModel.mainPostalCode!.trim(), "");
    }


    if(name != null && (address?.contains(name.toUpperCase().trim()) ??false)){

      String pattern = r"[a-zA-Z\d\s]*FIRSTNAME";
      RegExp exp = RegExp(pattern.replaceAll("FIRSTNAME", name.toUpperCase().trim()) , caseSensitive:  false);
      address = address?.replaceAll(exp, "");
    }

    if(lastName != null  && (address?.contains(lastName.toUpperCase().trim()) ??false)){

      String pattern = r"[a-zA-Z\d\s]*LASTNAME";
      RegExp exp = RegExp(pattern.replaceAll("LASTNAME", lastName.toUpperCase().trim()) , caseSensitive:  false);
      address = address?.replaceAll(exp, "");

    }



    List<String?> dateList = [
      dataClass.birthDate,
      dataClass.expDate,
      dataClass.issuedDate
    ];

    for(var date in dateList){
      if(date != null){
        String? year;

        year = RegExp(r"\d{4}",caseSensitive: false).firstMatch(date)?.group(0);
        if(year != null){
          address = address?.replaceAll(year, "");
        }

      }
    }




    expDate = dataClass.expDate;
    issuedDate = dataClass.issuedDate;
    birthDate = dataClass.birthDate;

    return ProcessOcrDetailModel(
        number: licenseNumber.fixedLicenseNumber,
        exp: expDate,
        iss: issuedDate,
        dobDdn: birthDate,
        postalCode: postalCode,
        address: address,
        name: name,
        lastName: lastName,
        sex: sex
    );
  }

  @override
  String? fixDate(String date) {
    logger.w("before fix date $date");
    String? cleanDate = date.removeAllWhiteSpace;
    String? fixedDate ;
    // RegExp regExpDate = RegExp(r"([\dgbozstd]{4})[\/i:]?([\dgbozsdt]{2})[\/i:]?([\dgbodzst]{1,2})",caseSensitive: false);
    //\d{4}-\w{3,4}-\d{2}
    RegExp regExpDate = RegExp(r"([\dgbozstd]{4})-(JAN|FEB|MAR|APR|MAY|JUN|JUL|JUI|JUì|AUG|SEP|OCT|0CT|N0V|NOV|DEC)-([\dgbozstd]{2})",caseSensitive: false);
    String? yearFix = regExpDate.firstMatch(cleanDate)?.group(1);
    yearFix = yearFix?.replaceAll(RegExp(r"g" ,caseSensitive: false), "9");
    yearFix = yearFix?.replaceAll(RegExp(r"b" ,caseSensitive: false), "8");
    yearFix = yearFix?.replaceAll(RegExp(r"o" ,caseSensitive: false), "0");
    yearFix = yearFix?.replaceAll(RegExp(r"z" ,caseSensitive: false), "2");
    yearFix = yearFix?.replaceAll(RegExp(r"s" ,caseSensitive: false), "5");
    yearFix = yearFix?.replaceAll(RegExp(r"t" ,caseSensitive: false), "1");
    yearFix = yearFix?.replaceAll(RegExp(r"d" ,caseSensitive: false), "0");
    String? monthFix = regExpDate.firstMatch(cleanDate)?.group(2);
    monthFix = monthFix?.replaceAll(RegExp(r"9" ,caseSensitive: false), "g");
    monthFix = monthFix?.replaceAll(RegExp(r"8" ,caseSensitive: false), "b");
    monthFix = monthFix?.replaceAll(RegExp(r"0" ,caseSensitive: false), "0");
    monthFix = monthFix?.replaceAll(RegExp(r"2" ,caseSensitive: false), "z");
    monthFix = monthFix?.replaceAll(RegExp(r"5" ,caseSensitive: false), "s");
    monthFix = monthFix?.replaceAll(RegExp(r"1" ,caseSensitive: false), "t");
    monthFix = monthFix?.replaceAll(RegExp(r"0" ,caseSensitive: false), "d");
    String? dayFix = regExpDate.firstMatch(cleanDate)?.group(3)?.padLeft(2,"0");
    dayFix = dayFix?.replaceAll(RegExp(r"g" ,caseSensitive: false), "9");
    dayFix = dayFix?.replaceAll(RegExp(r"b" ,caseSensitive: false), "8");
    dayFix = dayFix?.replaceAll(RegExp(r"o" ,caseSensitive: false), "0");
    dayFix = dayFix?.replaceAll(RegExp(r"z" ,caseSensitive: false), "2");
    dayFix = dayFix?.replaceAll(RegExp(r"s" ,caseSensitive: false), "5");
    dayFix = dayFix?.replaceAll(RegExp(r"t" ,caseSensitive: false), "1");
    dayFix = dayFix?.replaceAll(RegExp(r"d" ,caseSensitive: false), "0");
    if(yearFix!= null && monthFix != null && dayFix != null){
      fixedDate = "$yearFix-${monthFix.inCaps}-$dayFix";
    }
    logger.i("after fix date $fixedDate");
    return fixedDate;
  }

  @override
  String fixNumber({required String number}) {
    throw UnimplementedError();
  }

  @override
  String? fixPostalCode(List<String> postalCode) {
    List<String> postalCodeFromStringList = postalCode;
    String? postal;
    if(postalCodeFromStringList.isNotEmpty){
      for(int i=0 ; i<postalCodeFromStringList.length ; i++){
        if(i==1 || i== 3 || i== 5){
          if(postalCodeFromStringList[i].toUpperCase()=="I" || postalCodeFromStringList[i].toUpperCase()=="L" || postalCodeFromStringList[i].toUpperCase()=="T"){
            postalCodeFromStringList[i] = "1";
          }

          if(postalCodeFromStringList[i].toUpperCase()=="O"){
            postalCodeFromStringList[i] = "0";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="S"){
            postalCodeFromStringList[i] = "5";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="B" || postalCodeFromStringList[i].toUpperCase()=="A"){
            postalCodeFromStringList[i] = "8";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="G"){
            postalCodeFromStringList[i] = "9";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="Z"){
            postalCodeFromStringList[i] = "2";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="Ó" ){
            postalCodeFromStringList[i] = "0";
          }



        }else if(i==0 || i== 2 || i== 4){
          if(postalCodeFromStringList[i].toUpperCase()=="1" ){
            postalCodeFromStringList[i] = "I";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="0"){
            postalCodeFromStringList[i] = "O";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="8"){
            postalCodeFromStringList[i] = "B";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="5"){
            postalCodeFromStringList[i] = "S";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="9"){
            postalCodeFromStringList[i] = "G";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="2"){
            postalCodeFromStringList[i] = "Z";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="Ý" || postalCodeFromStringList[i].toUpperCase()=="Ÿ"){
            postalCodeFromStringList[i] = "Y";
          }
          if( postalCodeFromStringList[i].toUpperCase()=="Í"){
            postalCodeFromStringList[i] = "I";
          }if( postalCodeFromStringList[i].toUpperCase()=="È" || postalCodeFromStringList[i].toUpperCase()=="É"){
            postalCodeFromStringList[i] = "E";
          }

          if(postalCodeFromStringList[i].toUpperCase()=="ñ" || postalCodeFromStringList[i].toUpperCase()=="Ñ"){
            postalCodeFromStringList[i] = "N";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="Á" ){
            postalCodeFromStringList[i] = "A";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="Ó" ){
            postalCodeFromStringList[i] = "O";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="Ú" || postalCodeFromStringList[i].toUpperCase()=="Ü"){
            postalCodeFromStringList[i] = "U";
          }
        }

      }
    }
    if(postalCodeFromStringList.isNotEmpty){
      postal = postalCodeFromStringList.join("");
    }
    return postal;
  }

  @override
  String? getAddress({required String resultStringOcr, required String? postalCodeFixed ,  String? postalCodeFromString}) {
    String? myAddress;
    myAddress = RegExp(r"\s?(\d{1,6}-?\d{0,6}).+([A-ZñÑáéíóúüÁÉÍÓÚÜàâçèêëîïôûùÿ]\s?(\d)\s?){2,3}\s?", caseSensitive: false).firstMatch(resultStringOcr)?.group(0);
    myAddress = myAddress?.replaceAll(RegExp(r"\s{2,}"), " ");
    myAddress =  myAddress?.replaceAll(RegExp(r"[A-ZñÑáéíóúüÁÉÍÓÚÜàâçèêëîïôûùÿ][A-ZñÑáéíóúüÁÉÍÓÚÜàâçèêëîïôûùÿ][A-ZñÑáéíóúüÁÉÍÓÚÜàâçèêëîïôûùÿ]?\s?\d{6,20}", caseSensitive: false), " "); /// remove DDREF



    if(myAddress == null){
      List<RegExpMatch>? addressListMatches =  RegExp(r"\s?(\d{1,6}-?\d{0,6}).+([A-Z8ñÑáéíóúüÁÉÍÓÚÜàâçèêëîïôûùÿ]\s?(\d|[BIo\d])\s?){2,3}\s?", caseSensitive: false).allMatches(resultStringOcr)?.toList();
      List<String?> ? addressList = [];
      if(addressListMatches != null){
        for(var address in addressListMatches){
          addressList.add(address.group(0));
        }
      }
      if(addressList.isNotEmpty){
        addressList.sort((a, b) =>
            (a?.length ?? 0).compareTo(b?.length ?? 0)
        );
      }
      myAddress = myAddress?.replaceAll("A", "À");
      if(addressList.isNotEmpty){
        myAddress = addressList[0];
        myAddress = myAddress?.replaceAll(RegExp(r"\s{2,}"), " ");
        myAddress =  myAddress?.replaceAll(RegExp(r"[A-ZñÑáéíóúüÁÉÍÓÚÜàâçèêëîïôûùÿ][A-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ][A-ZñÑáéíóúüÁÉÍÓÚÜàâçéèêëîïôûùüÿ]?\s?\d{6,20}" , caseSensitive: false), " "); /// remove DDREF
      }




      List<String>? postalCodeFromStringList = postalCodeFromString?.removeAllWhiteSpace.split("");
      if(postalCodeFromStringList != null && postalCodeFromStringList.isNotEmpty){
        postalCodeFromString =   fixPostalCodeBritish(postalCodeFromStringList)!;
      }

      // logger.w("postal code from main string:  $postalCodeFromStringMain    postal code from string: $postalCodeFromString");

      if(postalCodeFromString != null && postalCodeFromString != null){
        myAddress?.replaceAll(postalCodeFromString, postalCodeFromString);
        if(myAddress != null){
          String? newMyAddress = RegExp(r"\s?(\d{1,6}-?\d{0,6}).+([A-ZñÑáéíóúüÁÉÍÓÚÜàâçèêëîïôûùÿ]\s?(\d)\s?){2,3}\s?", caseSensitive: false).firstMatch(myAddress)?.group(0);
          if(newMyAddress != null){
            myAddress = newMyAddress;
          }
        }
      }
    }

    return myAddress;
  }

  @override
  MyDataClass getDate(String ocrResult) {
    List<String?> allDateList = [];
    String? issuedDate = "";
    String? birthDate = "";
    String? expDate = "";
    String resultOcrRemovedDate = ocrResult;

    logger.e(ocrResult);
    var allDate = dateRegex.allMatches(ocrResult);
    logger.i(allDate);

    try {
      if (allDate.isNotEmpty) {
        if (allDate.isNotEmpty) {
          for (var date in allDate) {
            if (date[0] != null) {
              allDateList.add(fixDate(date[0]!));
              logger.e(date[0]!);
              resultOcrRemovedDate = resultOcrRemovedDate.replaceAll(date[0]!, " ");
            }
          }
        } else {
          logger.w("all date is empty");
        }

        allDateList = allDateList.toSet().toList();

        /// remove duplicate date
        allDateList.sort((a, b) => (a ?? "").compareTo(b ?? ""));

        if (allDateList.isNotEmpty) {
          if (allDateList.length == 3) {
            birthDate = allDateList[0];
            issuedDate = allDateList[1];
            expDate = allDateList[2];
          } else if (allDateList.length == 4) {
            birthDate = allDateList[1];
            issuedDate = allDateList[2];
            expDate = allDateList[3];
          } else if (allDateList.length == 2) {
            int? firstYear = int.tryParse(
                RegExp(r"\d{4}", caseSensitive: false).firstMatch(allDateList[0] ?? "0")?.group(0) ?? "0");
            int? secondYear = int.tryParse(RegExp(r"\d{4}", caseSensitive: false).firstMatch(allDateList[1] ?? "0")?.group(0) ?? "0");
            int dateNow = DateTime.now().year;

            if ((firstYear ?? 0) > dateNow) {
              expDate = allDateList[0];
              if (dateNow - (secondYear ?? 0) > 6) {
                birthDate = allDateList[1];
              } else {
                issuedDate = allDateList[1];
              }
            }

            if ((secondYear ?? 0) > dateNow) {
              expDate = allDateList[1];
              if (dateNow - (firstYear ?? 0) > 6) {
                birthDate = allDateList[0];
              } else {
                issuedDate = allDateList[0];
              }
            } else {
              if (dateNow - (firstYear ?? 0) > 6) {
                birthDate = allDateList[0];
                issuedDate = allDateList[1];
              } else {
                issuedDate = allDateList[0];
                expDate = allDateList[1];
              }
            }
          } else if (allDateList.length == 1) {
            int? firstYear = int.tryParse(
                RegExp(r"\d{4}", caseSensitive: false).firstMatch(
                    allDateList[0] ?? "0")?.group(0) ?? "0");
            int dateNow = DateTime
                .now()
                .year;
            if (dateNow - (firstYear ?? 0) > 6) {
              birthDate = allDateList[0];
            } else if ((firstYear ?? 0) > dateNow) {
              expDate = allDateList[0];
            } else {
              issuedDate = allDateList[0];
            }
          }
        }
      }
      MyDataClass myDataClass = MyDataClass(expDate: expDate,
          birthDate: birthDate,
          issuedDate: issuedDate,
          resultRemovedDate: resultOcrRemovedDate);
      return myDataClass;
    } catch (e) {
      logger.e(e);
      throw Exception(e);
    }
  }

  @override
  FullNameClass getFullName(String? resultOcr, String? address , String? mainPostalCode) {
    String? firstName;
    String? lastName;
    List<String>? fullName;



    if(resultOcr!.contains(",")){
      String? digitAddress;
      if(address != null){
        digitAddress = RegExp(r"(\d{1,6}-?\d{0,6})").firstMatch(address)?.group(0);
      }
      if(digitAddress != null){
        String pattern = r"\b(.+),(.+)\s?DIGITADDRESS";
        RegExp addressRegex = RegExp(pattern.replaceAll("DIGITADDRESS", digitAddress.trim()) , caseSensitive:  false);


        resultOcr = resultOcr.replaceAll(RegExp(r"N[0o][nm]?" , caseSensitive:  false), " ");
        resultOcr = resultOcr.replaceAll(RegExp(r"\b\w{1,2}\b"), " ");
        resultOcr = resultOcr.replaceAll(RegExp(r"\s+"), " ");
        lastName = addressRegex.firstMatch(resultOcr)?.group(1);
        firstName = addressRegex.firstMatch(resultOcr)?.group(2);
        if(address != null){
          firstName =  firstName?.replaceAll(RegExp(r"(\d{1,6}-?\d{0,6}).+"), " ");
          lastName = lastName?.replaceAll(RegExp(r"(\d{1,6}-?\d{0,6}).+"), " ");
        }

        logger.e(lastName);
        logger.e(firstName);

      }
    }else{

      resultOcr = resultOcr.replaceAll(RegExp(r"\d+"), " ");

      resultOcr = resultOcr.replaceAll(RegExp(r"\b\w{1,2}\b"), " ");
      resultOcr = resultOcr.replaceAll(RegExp(r"-"), " ");
      resultOcr = resultOcr.replaceAll(RegExp(r"N[0o][nm]?" , caseSensitive:  false), " ");
      resultOcr = resultOcr.replaceAll(RegExp(r"\s+"), " ");
      if(address != null){
        resultOcr = resultOcr.replaceAll(address, " ");
      }
      fullName = resultOcr.split(" ");

      fullName.removeWhere((element) =>element.isEmpty);
      fullName.removeWhere((element) =>element == " ");

      logger.w(fullName);
      try{
        fullName.toList().forEach((element) {
          if("BIO".similarityTo(element.toUpperCase()) > 0.7){
            fullName?.remove(element);

          }if("DHOR".similarityTo(element.toUpperCase()) > 0.5){
            fullName?.remove(element);
          }
          if("DE".similarityTo(element.toUpperCase()) > 0.6){
            fullName?.remove(element);

          }if("SBE".similarityTo(element.toUpperCase()) > 0.6){
            fullName?.remove(element);

          }if("PSBE".similarityTo(element.toUpperCase()) > 0.6){
            fullName?.remove(element);

          }if("DEK".similarityTo(element.toUpperCase()) > 0.6){
            fullName?.remove(element);

          }if("PCE".similarityTo(element.toUpperCase()) > 0.5){
            fullName?.remove(element);

          }
        });
      }catch(e){
        logger.e(e);
      }
    }

    if((firstName == null || lastName == null) && fullName != null){
      if(fullName.length > 1){
        firstName ??= fullName[1];
        lastName ??= fullName[0];
      }
    }

    logger.w(resultOcr);
    return FullNameClass(lastName: lastName, firstName: firstName);
  }

  @override
  LicenseNumberModel getLicenseNumber(String mainResultStringOcr) {
    String? licenseNumber = licenseNumberRegex.firstMatch(mainResultStringOcr)
        ?.group(0);
    String? fixedLicenseNumber;
    if (licenseNumberRegex.firstMatch(mainResultStringOcr)?.group(1) != null) {
      /// in this format must contain only digit
      fixedLicenseNumber = fixLicenseNumber(
          licenseNumberRegex.firstMatch(mainResultStringOcr)?.group(1));
    }

    return LicenseNumberModel(mainLicenseNumber: licenseNumber,
        fixedLicenseNumber: fixedLicenseNumber);
  }

  @override
  List<String> getCleanTex(List<TextBlock> textBlock) {
    String resultStringOcr = "";
    String mainResultStringOcr = "";
    for (TextBlock block in textBlock) {

      for (TextLine line in block.lines) {

        for (TextElement element in line.elements) {
          if("DRIVER'S".similarityTo(element.text.toUpperCase()) > 0.3 || "DRIVERS".similarityTo(element.text.toUpperCase()) > 0.3){
            resultStringOcr += " ";
            logger.d(element.text);
          }else if("LICENCE".similarityTo(element.text.toUpperCase()) > 0.3){
            resultStringOcr += " ";
            logger.d("B ${element.text}");
          }else if("HIGCNGE".similarityTo(element.text.toUpperCase()) > 0.5){
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if("NUMBER".similarityTo(element.text.toUpperCase()) > 0.3 || "NUMERO".similarityTo(element.text.toUpperCase()) > 0.3){
            resultStringOcr += " ";
            logger.d(element.text);
          }

          else if(("NAME".similarityTo(element.text.toUpperCase()) > 0.5 || "NAVE".similarityTo(element.text.toUpperCase()) > 0.5 || "2AVE".similarityTo(element.text.toUpperCase()) > 0.5  || "oANE".similarityTo(element.text.toUpperCase()) > 0.5) && element.text.toUpperCase() != "AVE"){
            resultStringOcr += " ";
            //  resultStringOcr = resultStringOcr.replaceAll(RegExp(r"\s?(\d{1,2})\s?", caseSensitive: false), " ");
            logger.d(element.text);
          }else

          if("NOM".similarityTo(element.text.toUpperCase()) > 0.4 ||"24ENOM".similarityTo(element.text.toUpperCase()) > 0.4 ||"12NOM".similarityTo(element.text.toUpperCase()) > 0.4 || "42AENON".similarityTo(element.text.toUpperCase()) > 0.4){
            resultStringOcr += " ";
            resultStringOcr = resultStringOcr.replaceAll(RegExp(r"\s?(\d{1,2})\s?", caseSensitive: false), "");
            logger.d(element.text);
          }

          else if("CLASS".similarityTo(element.text.toUpperCase()) > 0.5){
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if("CONDUIRE".similarityTo(element.text.toUpperCase()) > 0.3){
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if("PERMIS".similarityTo(element.text.toUpperCase()) > 0.3){
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if("CANADA".similarityTo(element.text.toUpperCase()) > 0.3){
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if("RESTRICTION".similarityTo(element.text.toUpperCase()) > 0.4 && (element.text.trim() != "WEST" && element.text.trim() != "EST")){
            resultStringOcr += " ";
            logger.d(element.text);
          }

          else if("DOB".similarityTo(element.text.toUpperCase()) > 0.5 || "DOBDON".similarityTo(element.text.toUpperCase()) > 0.4 || "DOBODN".similarityTo(element.text.toUpperCase()) > 0.5|| "DOBDDN".similarityTo(element.text.toUpperCase()) > 0.4|| "3DOBDON".similarityTo(element.text.toUpperCase()) > 0.4 || "DOB:".similarityTo(element.text.toUpperCase()) > 0.4 || "DO8:".similarityTo(element.text.toUpperCase()) > 0.9|| "POE".similarityTo(element.text.toUpperCase()) > 0.6){
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if("REST".similarityTo(element.text.toUpperCase()) > 0.4 && (element.text.trim() != "WEST" && element.text.trim() != "EST" && element.text.trim() != "ST")){
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if("COND".similarityTo(element.text.toUpperCase()) > 0.4){
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if("BRITISH".similarityTo(element.text.toUpperCase()) > 0.3){
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if("ORIVHRIST".similarityTo(element.text.toUpperCase()) > 0.4){
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if("COLUMBIA".similarityTo(element.text.toUpperCase()) > 0.3||"COLUM".similarityTo(element.text.toUpperCase()) > 0.3){
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if("HOKENGE".similarityTo(element.text.toUpperCase()) > 0.4){
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if("ONTARIO".similarityTo(element.text.toUpperCase()) > 0.4){
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if("CAN".similarityTo(element.text.toUpperCase()) > 0.4){
            resultStringOcr += " ";
            logger.d(element.text);
          }else if(("WNOV".similarityTo(element.text.toUpperCase()) > 0.3) && element.text.toUpperCase() != "NOV"){
            resultStringOcr += "NOM ";
            logger.d(element.text);
          }
          else if("ISSUED".similarityTo(element.text.toUpperCase()) > 0.3){
            resultStringOcr += " ";
            logger.d(element.text);
          }else if("VICTORIA".similarityTo(element.text.toUpperCase()) > 0.4){
            resultStringOcr += "VICTORIA ";
            logger.d(element.text);
          }
          else if("EXPIRES".similarityTo(element.text.toUpperCase()) > 0.3 || "EXPIRE".similarityTo(element.text.toUpperCase()) > 0.3){
            resultStringOcr += " ";
            logger.d(element.text);
          }else if("pso//".similarityTo(element.text.toUpperCase()) > 0.3){
            resultStringOcr += " ";
            logger.d(element.text);
          }else if("abo".similarityTo(element.text.toUpperCase()) > 0.4){
            resultStringOcr += " ";
            logger.d(element.text);
          }else if("pbe".similarityTo(element.text.toUpperCase()) > 0.3 || "pabe".similarityTo(element.text.toUpperCase()) > 0.5){
            resultStringOcr += " ";
            logger.d(element.text);
          }else if("couIMILA90".similarityTo(element.text.toUpperCase()) > 0.4){
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if("RESTRICTIONS".similarityTo(element.text.toUpperCase()) > 0.4
              || "RESTRICTION/".similarityTo(element.text.toUpperCase()) > 0.4
              || "RESTRICTION|".similarityTo(element.text.toUpperCase()) > 0.4
              || "RESTRICTIONS/".similarityTo(element.text.toUpperCase()) > 0.4
          ){
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if("ENDORSEMENTS".similarityTo(element.text.toUpperCase()) > 0.4 || "ENDORSEMENT".similarityTo(element.text.toUpperCase()) > 0.4){
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if("CATEG".similarityTo(element.text.toUpperCase()) > 0.3){
            resultStringOcr += " ";
            logger.d(element.text);
          }else if("XXXKKX".similarityTo(element.text.toUpperCase()) > 0.3){
            resultStringOcr += " ";
            logger.d(element.text);
          }else if("Dek".similarityTo(element.text.toUpperCase()) > 0.5){
            resultStringOcr += " ";
            logger.d(element.text);
          }else if("OKX".similarityTo(element.text.toUpperCase()) > 0.3){
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if("WE".similarityTo(element.text.toUpperCase()) > 0.6){
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if("SEX".similarityTo(element.text.toUpperCase()) > 0.5 || "SEXE".similarityTo(element.text.toUpperCase()) > 0.5){
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if("EYES".similarityTo(element.text.toUpperCase()) > 0.4 ){
            resultStringOcr += " ";
            logger.d(element.text);
          }else if("HAIR".similarityTo(element.text.toUpperCase()) > 0.4 ){
            resultStringOcr += " ";
            logger.d(element.text);
          }else if(element.text.trim() == "BLK"){
            resultStringOcr += " ";
          }else if(element.text.trim() == "RED"){
            resultStringOcr += " ";
          }else if(element.text.trim() == "BRN"){
            resultStringOcr += " ";
          }
          else if(element.text.trim() == "GRY"){
            resultStringOcr += " ";
          }
          else if(element.text.trim() == "BR"){
            resultStringOcr += " ";
          }
          else if(element.text.trim() == "PNK"){
            resultStringOcr += " ";
          }
          else if(element.text.trim() == "WHT"){
            resultStringOcr += " ";
          }
          // else if(element.text.trim().contains(RegExp(r"([\dgbozst]\s?){4,6}\/([\dgbozst]\s?){2}")) || element.text.trim().contains(RegExp(r"([\dgbozst]\s?){4}\/([\dgbozst]\s?){2}"))){
          //   String? cleanDate = fixDate(element.text);
          //   if(cleanDate!= null){
          //     resultStringOcr += "$cleanDate ";
          //   }
          // }


          else {
            resultStringOcr += "${element.text} ";
           // resultStringOcr =  resultStringOcr.replaceAll(RegExp(r"\s?\d{4}\s?/\s?\d{2}\s?/\s?\d{2}\s?|\d{4}-\w{3,4}-\d{2}" , caseSensitive: false), " ");
          }
          //
          // String? digitBackName =  RegExp(r"(\d{1,2})\s?(\sname\s?|\s?nom\s?|\s?n0m\s?|\s?nave\s?)", caseSensitive: false).firstMatch(mainResultStringOcr)?.group(1);
          // resultStringOcr =  resultStringOcr.replaceAll(RegExp(r"(\d{1,2})?\s?(\s?name\s?|\s?nom\s?|\s?n0m\s?|\s?nave\s?)\s?", caseSensitive: false), " ");

          // if(digitBackName != null){
          //   resultStringOcr =  resultStringOcr.replaceFirst(digitBackName, " ");
          //   mainResultStringOcr = mainResultStringOcr.replaceFirst(digitBackName, "");
          //   logger.e(" digit is $digitBackName");
          // }

          // if(element.text.trim().contains(RegExp(r"([\dgbozst]\s?){4,6}\/([\dgbozst]\s?){2}")) || element.text.trim().contains(RegExp(r"([\dgbozst]\s?){4}\/([\dgbozst]\s?){2}"))){
          //   String? cleanDate = fixDate(element.text);
          //   if(cleanDate!= null){
          //     mainResultStringOcr += "$cleanDate ";
          //   }
          // }else{
            mainResultStringOcr+= "${element.text} ";
          // }

        }
      }
    }

    if(RegExp(r"(Exp)\s?\d{0,2}").hasMatch(resultStringOcr)){
      resultStringOcr = resultStringOcr.replaceFirst(RegExp(r"(Exp)\s?\d{0,2}").firstMatch(resultStringOcr)?.group(1)??"Exp", " ");
    }

    List<String> result = [resultStringOcr, mainResultStringOcr];
    return result;
  }

  @override
  String? fixLicenseNumber(String? licenseNumber) {
    licenseNumber =
        licenseNumber?.replaceAll(RegExp(r"g", caseSensitive: false), "9");
    licenseNumber =
        licenseNumber?.replaceAll(RegExp(r"b", caseSensitive: false), "8");
    licenseNumber =
        licenseNumber?.replaceAll(RegExp(r"o", caseSensitive: false), "0");
    licenseNumber =
        licenseNumber?.replaceAll(RegExp(r"z", caseSensitive: false), "2");
    licenseNumber =
        licenseNumber?.replaceAll(RegExp(r"s", caseSensitive: false), "5");
    licenseNumber =
        licenseNumber?.replaceAll(RegExp(r"t", caseSensitive: false), "1");
    return licenseNumber;
  }


  @override
  PostalCodeModel getPostalCode(String ocrResult) {
    String? postalCodeFromString;
    String? postalCodeFromStringMain;
    String? postalCodeFixed;
    ocrResult = ocrResult.replaceFirst("AB", " ");
    PostalCodeModel postalCodeModel = PostalCodeModel(fixedPostalCode: postalCodeFixed, mainPostalCode: postalCodeFromStringMain);
    Iterable<RegExpMatch> postalCodeFromStringListRegex = RegExp(
        r"([A-Z8ñÑáéíóúüÁÉÍÓÚÜŸÝ]\s?([\dzsBIO])\s?){3}", caseSensitive: false)
        .allMatches(ocrResult);

    for (RegExpMatch postalItem in postalCodeFromStringListRegex) {
      if (postalItem.group(0)?.contains(RegExp(r"\d")) ?? false) {
        postalCodeFromString = postalItem.group(0);
      }
    }
    postalCodeFromString ??= RegExp(
        r"([A-Z8ñÑáéíóúüÁÉÍÓÚÜŸÝ]\s?([\dzsBIO])\s?){3}", caseSensitive: false).firstMatch(ocrResult)?.group(0);

    postalCodeFromStringMain = postalCodeFromString;
    postalCodeModel.mainPostalCode = postalCodeFromStringMain;

    List<String>? postalCodeFromStringList = postalCodeFromString
        ?.removeAllWhiteSpace.split("");

    if (postalCodeFromStringList != null) {
      postalCodeModel.fixedPostalCode = fixPostalCode(postalCodeFromStringList);
    }
    return postalCodeModel;
  }

  @override
  String? getGender(String resultOcr) {
    return RegExp(r"\b[fm]\b" , caseSensitive: false).firstMatch(resultOcr)?.group(0);
  }

   String? fixPostalCodeBritish(List<String> postalCode){
    List<String> postalCodeFromStringList = postalCode;
    String? postal;
    if(postalCodeFromStringList.isNotEmpty){
      for(int i=0 ; i<postalCodeFromStringList.length ; i++){
        if(i==1 || i== 3 || i== 5){
          if(postalCodeFromStringList[i].toUpperCase()=="I" || postalCodeFromStringList[i].toUpperCase()=="L" || postalCodeFromStringList[i].toUpperCase()=="T"){
            postalCodeFromStringList[i] = "1";
          }

          if(postalCodeFromStringList[i].toUpperCase()=="O"){
            postalCodeFromStringList[i] = "0";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="S"){
            postalCodeFromStringList[i] = "5";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="B" || postalCodeFromStringList[i].toUpperCase()=="A"){
            postalCodeFromStringList[i] = "8";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="G"){
            postalCodeFromStringList[i] = "9";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="Z"){
            postalCodeFromStringList[i] = "2";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="Ó" ){
            postalCodeFromStringList[i] = "0";
          }



        }else if(i==0 || i== 2 || i== 4){
          if(postalCodeFromStringList[i].toUpperCase()=="1" ){
            postalCodeFromStringList[i] = "I";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="0"){
            postalCodeFromStringList[i] = "O";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="8"){
            postalCodeFromStringList[i] = "B";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="5"){
            postalCodeFromStringList[i] = "S";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="9"){
            postalCodeFromStringList[i] = "G";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="2"){
            postalCodeFromStringList[i] = "Z";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="Ý" || postalCodeFromStringList[i].toUpperCase()=="Ÿ"){
            postalCodeFromStringList[i] = "Y";
          }
          if( postalCodeFromStringList[i].toUpperCase()=="Í"){
            postalCodeFromStringList[i] = "I";
          }if( postalCodeFromStringList[i].toUpperCase()=="È" || postalCodeFromStringList[i].toUpperCase()=="É"){
            postalCodeFromStringList[i] = "E";
          }

          if(postalCodeFromStringList[i].toUpperCase()=="ñ" || postalCodeFromStringList[i].toUpperCase()=="Ñ"){
            postalCodeFromStringList[i] = "N";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="Á" ){
            postalCodeFromStringList[i] = "A";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="Ó" ){
            postalCodeFromStringList[i] = "O";
          }
          if(postalCodeFromStringList[i].toUpperCase()=="Ú" || postalCodeFromStringList[i].toUpperCase()=="Ü"){
            postalCodeFromStringList[i] = "U";
          }
        }

      }
    }
    if(postalCodeFromStringList.isNotEmpty){
      postal = postalCodeFromStringList.join("");
    }
    return postal;
  }


}