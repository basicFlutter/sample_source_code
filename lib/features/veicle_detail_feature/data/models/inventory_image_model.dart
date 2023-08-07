
import 'package:new_panel/features/veicle_detail_feature/domain/entities/inventory_image_entity.dart';

class InventoryImageModel extends InventoryImageEntity{


  InventoryImageModel.fromJson(dynamic json) {
    defaultVisible = json['default_visible'];
    mediaSrc = json['media_src'];
    mediaType = json['media_type'];
    templateSrc = json['template_src'];
    id = json['id'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['default_visible'] = defaultVisible;
    map['media_src'] = mediaSrc;
    map['media_type'] = mediaType;
    map['template_src'] = templateSrc;
    map['id'] = id;
    return map;
  }

}