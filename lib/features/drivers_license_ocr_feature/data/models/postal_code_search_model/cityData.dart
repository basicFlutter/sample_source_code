import 'province.dart';

class CityData {
  CityData({
      this.cityId, 
      this.city, 
      this.province,});

  CityData.fromJson(dynamic json) {
    cityId = json['city_id'];
    city = json['city'];
    province = json['province'] != null ? Province.fromJson(json['province']) : null;
  }
  int? cityId;
  String? city;
  Province? province;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city_id'] = cityId;
    map['city'] = city;
    if (province != null) {
      map['province'] = province?.toJson();
    }
    return map;
  }

}