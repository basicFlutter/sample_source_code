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
    String? message,
    String? type,
    String? alertType,
    String? accessToken,
    String? refreshToken,}){
    _message = message;
    _type = type;
    _alertType = alertType;
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  LoginResponseModel.fromJson(dynamic json) {
    _message = json['message'] ?? '';
    _type = json['type'] ?? '';
    _alertType = json['alertType'] ?? '';
    _accessToken = json['accessToken'] ?? '';
    _refreshToken = json['refreshToken'] ?? '';
  }
  String? _message;
  String? _type;
  String? _alertType;
  String? _accessToken;
  String? _refreshToken;
  LoginResponseModel copyWith({  String? message,
    String? type,
    String? alertType,
    String? accessToken,
    String? refreshToken,
  }) => LoginResponseModel(  message: message ?? _message,
    type: type ?? _type,
    alertType: alertType ?? _alertType,
    accessToken: accessToken ?? _accessToken,
    refreshToken: refreshToken ?? _refreshToken,
  );
  String? get message => _message;
  String? get type => _type;
  String? get alertType => _alertType;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['type'] = _type;
    map['alertType'] = _alertType;
    map['accessToken'] = _accessToken;
    map['refreshToken'] = _refreshToken;
    return map;
  }

}