import 'package:new_panel/core/suggestions/domain/entities/body_style_entity.dart';

class BodyStyleModel extends BodyStyleEntity{


  BodyStyleModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    order = json['order'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['order'] = order;
    return map;
  }

}