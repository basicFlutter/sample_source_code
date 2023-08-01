

import 'package:new_panel/core/models/drop_down_model.dart';


class Constants {
  static const cdnBaseUrl = 'https://image123.azureedge.net';
  static const pathOfMlKitModel = 'assets/ml/object_labeler.tflite';

  static String? accessToken = "";


  static const genderFemale = 1;
  static const genderMale = 2;
  static  List<DropDownModel> genderDropDownValue=  [
    DropDownModel(title: "Female" , id: genderFemale),
    DropDownModel(title: "Male",id: genderMale),
  ];



}