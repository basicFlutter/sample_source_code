import 'dart:convert';
/// username : "string"
/// password : "string"

LoginMapModel loginMapModelFromJson(String str) => LoginMapModel.fromJson(json.decode(str));
String loginMapModelToJson(LoginMapModel data) => json.encode(data.toJson());
class LoginMapModel {
  LoginMapModel({
      String? username, 
      String? password,}){
    _username = username;
    _password = password;
}

  LoginMapModel.fromJson(dynamic json) {
    _username = json['username'];
    _password = json['password'];
  }
  String? _username;
  String? _password;
LoginMapModel copyWith({  String? username,
  String? password,
}) => LoginMapModel(  username: username ?? _username,
  password: password ?? _password,
);
  String? get username => _username;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['password'] = _password;
    return map;
  }

}