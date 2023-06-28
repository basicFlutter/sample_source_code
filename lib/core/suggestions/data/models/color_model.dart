import 'package:new_panel/core/suggestions/domain/entities/color_entity.dart';

class ColorModel extends ColorEntity{

  ColorModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['code'] = code;
    return map;
  }

}