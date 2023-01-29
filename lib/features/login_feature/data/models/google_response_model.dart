import 'dart:convert';

import 'package:new_panel/features/login_feature/domain/entities/google_response_entity.dart';
/// refreshToken : "string"
/// accessToken : "string"

GoogleResponseModel googleResponseModelFromJson(String str) => GoogleResponseModel.fromJson(json.decode(str));
String googleResponseModelToJson(GoogleResponseModel data) => json.encode(data.toJson());
class GoogleResponseModel extends GoogleResponseEntity{
  GoogleResponseModel({
      String? refreshToken, 
      String? accessToken,}){
    _refreshToken = refreshToken;
    _accessToken = accessToken;
}

  GoogleResponseModel.fromJson(dynamic json) {
    _refreshToken = json['refreshToken'];
    _accessToken = json['accessToken'];
  }
  String? _refreshToken;
  String? _accessToken;
GoogleResponseModel copyWith({  String? refreshToken,
  String? accessToken,
}) => GoogleResponseModel(  refreshToken: refreshToken ?? _refreshToken,
  accessToken: accessToken ?? _accessToken,
);
  String? get refreshToken => _refreshToken;
  String? get accessToken => _accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refreshToken'] = _refreshToken;
    map['accessToken'] = _accessToken;
    return map;
  }

}