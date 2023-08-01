import 'dart:convert';
/// act : "Login with google"
/// alertType : "ERROR"
/// data : null
/// entity : "User"
/// message : "Google account not assigned to any user"
/// reason : "Not Found"
/// type : "ON_FORM"

ErrorModel errorModelFromJson(String str) => ErrorModel.fromJson(json.decode(str));
String errorModelToJson(ErrorModel data) => json.encode(data.toJson());
class ErrorModel {
  ErrorModel({
      String? act, 
      String? alertType, 
      dynamic data, 
      String? entity, 
      String? message, 
      String? reason, 
      String? type,
  }){
    _act = act;
    _alertType = alertType;
    _data = data;
    _entity = entity;
    _message = message;
    _reason = reason;
    _type = type;
}

  ErrorModel.fromJson(dynamic json) {
    _act = json['act']?.toString();
    _alertType = json['alertType'];
    _data = json['data'];
    _entity = json['entity'];
    _message = json['message'];
    _reason = json['reason'];
    _type = json['type'];
  }
  String? _act;
  String? _alertType;
  dynamic _data;
  String? _entity;
  String? _message;
  String? _reason;
  String? _type;
ErrorModel copyWith({  String? act,
  String? alertType,
  dynamic data,
  String? entity,
  String? message,
  String? reason,
  String? type,
}) => ErrorModel(  act: act ?? _act,
  alertType: alertType ?? _alertType,
  data: data ?? _data,
  entity: entity ?? _entity,
  message: message ?? _message,
  reason: reason ?? _reason,
  type: type ?? _type,
);
  String? get act => _act;
  String? get alertType => _alertType;
  dynamic get data => _data;
  String? get entity => _entity;
  String? get message => _message;
  String? get reason => _reason;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['act'] = _act;
    map['alertType'] = _alertType;
    map['data'] = _data;
    map['entity'] = _entity;
    map['message'] = _message;
    map['reason'] = _reason;
    map['type'] = _type;
    return map;
  }

}