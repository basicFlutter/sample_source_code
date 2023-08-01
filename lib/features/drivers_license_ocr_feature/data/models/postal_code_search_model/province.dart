import 'country.dart';

class Province {
  Province({
      this.id, 
      this.province, 
      this.isFromHereApi, 
      this.belongToDealership, 
      this.abbreviation, 
      this.createdAt, 
      this.updatedAt, 
      this.frkCountry, 
      this.country,});

  Province.fromJson(dynamic json) {
    id = json['id'];
    province = json['province'];
    isFromHereApi = json['isFromHereApi'];
    belongToDealership = json['belong_to_dealership'];
    abbreviation = json['abbreviation'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    frkCountry = json['frk_country'];
    country = json['Country'] != null ? Country.fromJson(json['Country']) : null;
  }
  int? id;
  String? province;
  bool? isFromHereApi;
  dynamic belongToDealership;
  String? abbreviation;
  String? createdAt;
  String? updatedAt;
  int? frkCountry;
  Country? country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['province'] = province;
    map['isFromHereApi'] = isFromHereApi;
    map['belong_to_dealership'] = belongToDealership;
    map['abbreviation'] = abbreviation;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['frk_country'] = frkCountry;
    if (country != null) {
      map['Country'] = country?.toJson();
    }
    return map;
  }

}