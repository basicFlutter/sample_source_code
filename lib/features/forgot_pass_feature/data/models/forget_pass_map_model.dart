import 'dart:convert';
/// email : "rezvan.mjj@gmail.com"
/// username : "poryazln"

ForgetPassMapModel forgetPassMapModelFromJson(String str) => ForgetPassMapModel.fromJson(json.decode(str));
String forgetPassMapModelToJson(ForgetPassMapModel data) => json.encode(data.toJson());
class ForgetPassMapModel {
  ForgetPassMapModel({
      String? email, 
      String? username,}){
    _email = email;
    _username = username;
}

  ForgetPassMapModel.fromJson(dynamic json) {
    _email = json['email'];
    _username = json['username'];
  }
  String? _email;
  String? _username;
ForgetPassMapModel copyWith({  String? email,
  String? username,
}) => ForgetPassMapModel(  email: email ?? _email,
  username: username ?? _username,
);
  String? get email => _email;
  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['username'] = _username;
    return map;
  }

}