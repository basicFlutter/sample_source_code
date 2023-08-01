
import 'package:new_panel/core/models/drop_down_model.dart';
import 'package:new_panel/features/login_feature/data/models/user_customer.dart';

class Constants {
  static const cdnBaseUrl = 'https://image123.azureedge.net';
  static const pathOfMlKitModel = 'assets/ml/object_labeler.tflite';

  static String? accessToken = "";

  static User? customerInformation ;

  static const genderFemale = 1;
  static const genderMale = 2;
  static  List<DropDownModel> genderDropDownValue=  [
    DropDownModel(title: "Female" , id: genderFemale),
    DropDownModel(title: "Male",id: genderMale),
  ];



}