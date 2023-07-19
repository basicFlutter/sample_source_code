import 'dart:convert';
/// username : "string"
/// password : "string"



class LoginInputParams {
  LoginInputParams({
      String? username, 
      String? password,}){
    _username = username;
    _password = password;
}


  String? _username;
  String? _password;

  String? get username => _username;
  String? get password => _password;

  set setUserName(String name) {
   _username = name;
  }
  set setPassword(String pass) {
    _password = pass;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['password'] = _password;
    return map;
  }

}