import 'dart:convert';

import 'package:new_panel/features/login_feature/domain/entities/login_response_entity.dart';
/// accessToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjIwNCwiaWF0IjoxNjc0ODk0OTQwLCJleHAiOjE2NzUxMTA5NDB9.weytCpNw4MtxparOx_fTCZYqHJ6Fyqfyrf_uu7-9YJ4"
/// refreshToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjIwNCwiaWF0IjoxNjc0ODk0OTQwLCJleHAiOjE2ODAwNzg5NDB9.35jgPJ9EznDP3XZu__rLULvBIcq66Azf-o9woDRM1YE"

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));
String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());
class LoginResponseModel extends LoginResponseEntity {
  LoginResponseModel({
      String? accessToken, 
      String? refreshToken,}) : super(accessToken : accessToken, refreshToken : refreshToken){
    _accessToken = accessToken;
    _refreshToken = refreshToken;
}

  LoginResponseModel.fromJson(dynamic json) {
    _accessToken = json['accessToken'];
    _refreshToken = json['refreshToken'];
  }
  String? _accessToken;
  String? _refreshToken;
LoginResponseModel copyWith({  String? accessToken,
  String? refreshToken,
}) => LoginResponseModel(  accessToken: accessToken ?? _accessToken,
  refreshToken: refreshToken ?? _refreshToken,
);
  @override
  String? get accessToken => _accessToken;
  @override
  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = _accessToken;
    map['refreshToken'] = _refreshToken;
    return map;
  }

}