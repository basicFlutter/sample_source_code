import 'dart:convert';

import 'package:new_panel/features/login_feature/domain/entities/login_response_entity.dart';
/// message : "Credentials is wrong"
/// type : "OnPage"
/// alertType : "Error"
/// accessToken : "String"
/// refreshToken : "String"

LoginResponseModel loginFailedModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));
String loginFailedModelToJson(LoginResponseModel data) => json.encode(data.toJson());
class LoginResponseModel extends LoginResponseEntity{
  LoginResponseModel({
    String? accessToken,
    String? refreshToken,}){

    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  LoginResponseModel.fromJson(dynamic json) {

    _accessToken = json['accessToken'] ?? '';
    _refreshToken = json['refreshToken'] ?? '';
  }

  String? _accessToken;
  String? _refreshToken;
  LoginResponseModel copyWith({
    String? accessToken,
    String? refreshToken,
  }) => LoginResponseModel(
    accessToken: accessToken ?? _accessToken,
    refreshToken: refreshToken ?? _refreshToken,
  );

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['accessToken'] = _accessToken;
    map['refreshToken'] = _refreshToken;
    return map;
  }

}