import 'dart:convert';


VerifyMapModel verifyMapModelFromJson(String str) => VerifyMapModel.fromJson(json.decode(str));
String verifyMapModelToJson(VerifyMapModel data) => json.encode(data.toJson());
class VerifyMapModel {
  VerifyMapModel({
      String? username, 
      String? password, 
      String? code, 
      bool? rememberMe,}){
    _username = username;
    _password = password;
    _code = code;
    _rememberMe = rememberMe;
}

  VerifyMapModel.fromJson(dynamic json) {
    _username = json['username'];
    _password = json['password'];
    _code = json['code'];
    _rememberMe = json['rememberMe'];
  }
  String? _username;
  String? _password;
  String? _code;
  bool? _rememberMe;
VerifyMapModel copyWith({  String? username,
  String? password,
  String? code,
  bool? rememberMe,
}) => VerifyMapModel(  username: username ?? _username,
  password: password ?? _password,
  code: code ?? _code,
  rememberMe: rememberMe ?? _rememberMe,
);
  String? get username => _username;
  String? get password => _password;
  String? get code => _code;
  bool? get rememberMe => _rememberMe;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['password'] = _password;
    map['code'] = _code;
    map['rememberMe'] = _rememberMe;
    return map;
  }

}