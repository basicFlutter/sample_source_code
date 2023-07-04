import 'dart:convert';

import 'package:new_panel/features/login_feature/domain/entities/assign_google_response_entity.dart';


/// id : "204"
/// google_id : "5196298459825"

AssignGoogleResponseModel assignGoogleResponseModelFromJson(String str) => AssignGoogleResponseModel.fromJson(json.decode(str));
String assignGoogleResponseModelToJson(AssignGoogleResponseModel data) => json.encode(data.toJson());
class AssignGoogleResponseModel extends AssignGoogleResponseEntity {
  AssignGoogleResponseModel({
      String? id, 
      String? googleId,}) : super(id:id!, googleId: googleId!){
    _id = id;
    _googleId = googleId;
}

  AssignGoogleResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _googleId = json['google_id'];
  }
  String? _id;
  String? _googleId;
AssignGoogleResponseModel copyWith({  String? id,
  String? googleId,
}) => AssignGoogleResponseModel(  id: id ?? _id,
  googleId: googleId ?? _googleId,
);
  String? get id => _id;
  String? get googleId => _googleId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['google_id'] = _googleId;
    return map;
  }

}