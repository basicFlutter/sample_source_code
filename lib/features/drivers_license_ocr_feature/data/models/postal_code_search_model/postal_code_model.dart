
import 'cityData.dart';

class PostalCodeModel {
  PostalCodeModel({

      this.cityData,});

  PostalCodeModel.fromJson(dynamic json) {
    cityData = json['cityData'] != null ? CityData.fromJson(json['cityData']) : null;
  }

  CityData? cityData;

  Map<String, dynamic> toJson({required String postalCode}) {
    final map = <String, dynamic>{};
      map['zipCode'] = postalCode;
    return map;
  }

}