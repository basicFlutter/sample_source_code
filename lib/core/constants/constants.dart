

import 'package:new_panel/core/models/drop_down_model.dart';


class Constants {
  static const cdnBaseUrl = 'azureedge base url';

  /// path of google ml kit model for object detection
  static const pathOfMlKitModel = 'assets/ml/object_labeler.tflite';

  static String? accessToken = "";


  static const genderFemale = 1;
  static const genderMale = 2;
  static  List<DropDownModel> genderDropDownValue=  [
    DropDownModel(title: "Female" , id: genderFemale),
    DropDownModel(title: "Male",id: genderMale),
  ];



}