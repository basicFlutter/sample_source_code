
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:intl/intl.dart';
import 'package:new_panel/core/extenstions/app_extension.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/date_class_model.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/drivers_license/drivers_license.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/full_name_class.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/license_number_model.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/ocr_detail_model.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/data/models/postal_code_model.dart';

import 'package:new_panel/main.dart';
import 'package:string_similarity/string_similarity.dart';

class AlbertaDriversLicense extends DriversLicenseRepository {

  RegExp dateRegex = RegExp(
      r"\d{2}\s(JAN|FEB|MAR|APR|MAY|JUN|JUL|JUI|JUì|AUG|SEP|OCT|0CT|N0V|NOV|DEC)\s\d{4}",
      caseSensitive: false);

  /// 1980-jun-12
  RegExp licenseNumberRegex = RegExp(
      r"[A-Z][\dgbozst]{6}|([\dgbozst]{5,6}-\d{3})", caseSensitive: false);

  // /// 153672-992
  // RegExp addressRegex = RegExp(
  //     r"\s?[Dd][lL]\s?:\s?(\d*)", caseSensitive: false);

  /// DL:4022787


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
    resultStringOcr = dataClass.resultRemovedDate!;

    postalCodeModel = getPostalCode(resultStringOcr);
    if(postalCodeModel.fixedPostalCode != null && postalCodeModel.mainPostalCode != null){
    resultStringOcr = resultStringOcr.replaceAll(postalCodeModel.mainPostalCode!, postalCodeModel.fixedPostalCode!);
    }

    postalCode = postalCodeModel.fixedPostalCode;
    address = getAddress(resultStringOcr: resultStringOcr, postalCodeFixed: postalCodeModel.fixedPostalCode);
   FullNameClass fullName= getFullName(resultStringOcr,address , postalCodeModel.mainPostalCode);
   name = fullName.firstName;
   lastName = fullName.lastName;
   logger.w(name);
   if(name != null){
     address = address?.replaceAll(name.trim(), "");
   }
   logger.w(lastName);
    if(lastName != null){
      address = address?.replaceAll(lastName.trim(), "");
      address =address?.replaceAll(RegExp(r"\s+"), " ");
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
  List<String> getCleanTex(List<TextBlock> textBlock) {
    String resultStringOcr = "";
    String mainResultStringOcr = "";
    for (TextBlock block in textBlock) {
      for (TextLine line in block.lines) {
        for (TextElement element in line.elements) {
          if ("DRIVER'S".similarityTo(element.text.toUpperCase()) > 0.3 ||
              "DRIVERS".similarityTo(element.text.toUpperCase()) > 0.3) {
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if ("LICENCE".similarityTo(element.text.toUpperCase()) > 0.3) {
            resultStringOcr += " ";
            logger.d("B ${element.text}");
          }
          else if ("HIGCNGE".similarityTo(element.text.toUpperCase()) > 0.3) {
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if ("Gas4".toUpperCase().similarityTo(element.text.toUpperCase()) > 0.3) {
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if ("con".toUpperCase().similarityTo(element.text.toUpperCase()) > 0.3) {
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if ("ou4".toUpperCase().similarityTo(element.text.toUpperCase()) > 0.3) {
            resultStringOcr += " ";
            logger.d(element.text);
          }

          else if ("CLASS".similarityTo(element.text.toUpperCase()) > 0.5) {
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if ("COND/END".similarityTo(element.text.toUpperCase()) > 0.5) {
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if ("ENDNONE".similarityTo(element.text.toUpperCase()) > 0.5) {
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if ("END".similarityTo(element.text.toUpperCase()) > 0.5) {
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if ("NONE".similarityTo(element.text.toUpperCase()) > 0.5) {
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if ("78 NOM".similarityTo(element.text.toUpperCase()) > 0.5) {
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if ("NOM".similarityTo(element.text.toUpperCase()) > 0.5) {
            resultStringOcr += " ";
            logger.d(element.text);
          }


          else if ("DOB".similarityTo(element.text.toUpperCase()) > 0.5 ||
              "DOBDON".similarityTo(element.text.toUpperCase()) > 0.4 ||
              "DOBODN".similarityTo(element.text.toUpperCase()) > 0.5 ||
              "DOBDDN".similarityTo(element.text.toUpperCase()) > 0.4 ||
              "3DOBDON".similarityTo(element.text.toUpperCase()) > 0.4 ||
              "DOB:".similarityTo(element.text.toUpperCase()) > 0.4) {
            resultStringOcr += " ";
            logger.d(element.text);
          }

          else if ("HOKENGE".similarityTo(element.text.toUpperCase()) > 0.4) {
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if ("oavs4".toUpperCase().similarityTo(element.text.toUpperCase()) > 0.4) {
            resultStringOcr += " ";
            logger.d(element.text);
          }

          else if ("CAN".similarityTo(element.text.toUpperCase()) > 0.4) {
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if ("ALBERTA".similarityTo(element.text.toUpperCase()) > 0.5) {
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if (("WNOV".similarityTo(element.text.toUpperCase()) > 0.3) &&
              element.text.toUpperCase() != "NOV") {
            resultStringOcr += "NOM ";
            logger.d(element.text);
          }
          else if ("ISS".similarityTo(element.text.toUpperCase()) > 0.3) {
            resultStringOcr += " ";
            logger.d(element.text);
          }

          else if ("Exp".toUpperCase().similarityTo(element.text.toUpperCase()) > 0.7) {
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if ("pso//".similarityTo(element.text.toUpperCase()) > 0.3) {
            resultStringOcr += " ";
            logger.d(element.text);
          } else if ("abo".similarityTo(element.text.toUpperCase()) > 0.4) {
            resultStringOcr += " ";
            logger.d(element.text);
          } else if ("pbe".similarityTo(element.text.toUpperCase()) > 0.3 ||
              "pabe".similarityTo(element.text.toUpperCase()) > 0.5) {
            resultStringOcr += " ";
            logger.d(element.text);
          }

          else if ("XXXKKX".similarityTo(element.text.toUpperCase()) > 0.3) {
            resultStringOcr += " ";
            logger.d(element.text);
          } else if ("Dek".similarityTo(element.text.toUpperCase()) > 0.5) {
            resultStringOcr += " ";
            logger.d(element.text);
          } else if ("OKX".similarityTo(element.text.toUpperCase()) > 0.3) {
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if ("WE".similarityTo(element.text.toUpperCase()) > 0.6) {
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if ("NOYT8".similarityTo(element.text.toUpperCase()) > 0.7) {
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if ("SEX".similarityTo(element.text.toUpperCase()) > 0.5 ||
              "SEXE".similarityTo(element.text.toUpperCase()) > 0.5) {
            resultStringOcr += " ";
            logger.d(element.text);
          }
          else if ("EYES".similarityTo(element.text.toUpperCase()) > 0.4) {
            resultStringOcr += " ";
            logger.d(element.text);
          } else if ("HAIR".similarityTo(element.text.toUpperCase()) > 0.4) {
            resultStringOcr += " ";
            logger.d(element.text);
          } else if (element.text.trim() == "Blk") {
            resultStringOcr += " ";
          } else if (element.text.trim() == "Red") {
            resultStringOcr += " ";
          } else if (element.text.trim() == "Brn") {
            resultStringOcr += " ";
          }
          else if (element.text.trim() == "Gry") {
            resultStringOcr += " ";
          }
          else if (element.text.trim() == "Br") {
            resultStringOcr += " ";
          }
          else if (element.text.trim() == "Pnk") {
            resultStringOcr += " ";
          }
          else if (element.text.trim() == "Wht") {
            resultStringOcr += " ";
          }
          else if (element.text.trim() == "Grn") {
            resultStringOcr += " ";
          }
          else {
            resultStringOcr += "${element.text} ";
          }
          mainResultStringOcr += "${element.text} ";
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
          if(postalCodeFromStringList[i].toUpperCase()=="B" || postalCodeFromStringList[i].toUpperCase()=="B"){
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
  String? getAddress({required String resultStringOcr, required String? postalCodeFixed,  String? postalCodeFromString}) {
    String pattern = r"(\d{1,6}-?\d{0,6}).+POSTALCODE";
    RegExp addressRegex = RegExp(pattern.replaceAll("POSTALCODE", postalCodeFixed!.trim()) , caseSensitive:  false);
    String? address = addressRegex.firstMatch(resultStringOcr)?.group(0);
    return address;
  }

  @override
  MyDataClass getDate(String ocrResult) {
    List<String?> allDateList = [];
    String? issuedDate = "";
    String? birthDate = "";
    String? expDate = "";
    String resultOcrRemovedDate = ocrResult;

    var allDate = dateRegex.allMatches(ocrResult);
    try {
      if (allDate.isNotEmpty) {
        if (allDate.isNotEmpty) {
          for (var date in allDate) {
            if (date[0] != null) {
              allDateList.add(fixDate(date[0]));
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
  String? fixDate(String? date) {
    String? myDate = date?.replaceAll(
        RegExp(r'[o0]ct', caseSensitive: false), 'Oct');
    String? myDate2 = myDate?.replaceAll(
        RegExp(r'n[o0]v', caseSensitive: false), 'Nov');
    String? myDate3 = myDate2?.replaceAll(
        RegExp(r'ju[liì]', caseSensitive: false), 'Jul');
    myDate3 = myDate3?.replaceAll(" ", "-");
    if (myDate3 != null) {
      String? month = RegExp(
          r"(JAN|FEB|MAR|APR|MAY|JUN|JUL|JUI|JUì|AUG|SEP|OCT|0CT|N0V|NOV|DEC)")
          .firstMatch(myDate3)
          ?.group(0);
      String monthReplacement = '';
      if (month != null) {
        monthReplacement = month.inCaps;
        myDate3 = myDate3.replaceAll(month, monthReplacement);
      }

      DateFormat inputDateFormat = DateFormat("dd-MMM-yyyy", "en_US");
      DateTime inputDate = inputDateFormat.parse(myDate3);
      DateFormat outputDateFormat = DateFormat("yyyy-MMM-dd");
      String outputDateString = outputDateFormat.format(inputDate);
      myDate3 = outputDateString;
    }

    return myDate3;
  }


  String convertDateFormat(String dateTimeString, String oldFormat, String
  newFormat) {
    DateFormat newDateFormat = DateFormat(newFormat);
    DateTime dateTime = DateFormat(oldFormat).parse(dateTimeString);
    String selectedDate = newDateFormat.format(dateTime);
    return selectedDate;
  }

  @override
  FullNameClass getFullName(String? resultOcr , String? address , String? mainPostalCode) {
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
}



