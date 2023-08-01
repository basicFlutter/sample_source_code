import 'dart:convert';

import '../../domain/entities/inventory_entity.dart';
/// id : "38139"
/// Vehicles : {"id":"42148","make":"Honda","model":"Accord Sedan","BodyStyles":{"name":"Sedan"},"model_year":2013,"vin_number":"1HGCR2F53DA808667","Colors_Vehicles_frk_exterior_colorToColors":null}
/// odometer : 0
/// stock_NO : "808667"
/// createdAt : "2023-02-20T13:53:43.000Z"
/// is_active : 2
/// is_deleted : 0
/// sell_price : 0
/// MidVDSMedia : [{"id":"1086282","media_src":"/hillzgroup/9965686726491139-Honda-Accord_Sedan-2013-fccfda60-b125-11ed-b8dc-bbc4e2a87faf.jpg","media_type":1,"createdAt":"2023-02-20T13:53:55.000Z","updatedAt":"2023-02-20T13:54:13.000Z","frk_mid_v_ds_id":"38139","status":2,"error_reason":null,"order":1,"frk_v_img_cat_id":null,"visible":1,"template_src":"/hillzgroup/2013-Honda-AccordSedan-0-2902442138358796.jpg","default_visible":1}]
/// odometer_type : 2
/// special_price : 0
/// is_coming_soon : false
/// vehicle_status : 4
/// totalCost : 0
/// age : 36

InventoryModel inventoryModelFromJson(String str) => InventoryModel.fromJson(json.decode(str));
String inventoryModelToJson(InventoryModel data) => json.encode(data.toJson());
class InventoryModel extends InventoryEntity
{
  InventoryModel({
      int? id,
      Vehicles? vehicles, 
      num? odometer, 
      String? stockNO, 
      String? createdAt, 
      num? isActive, 
      num? isDeleted, 
      num? sellPrice, 
      List<MidVdsMedia>? midVDSMedia, 
      num? odometerType, 
      num? specialPrice, 
      bool? isComingSoon, 
      num? vehicleStatus, 
      num? totalCost, 
      num? age,}){
    _id = id;
    _vehicles = vehicles;
    _odometer = odometer;
    _stockNO = stockNO;
    _createdAt = createdAt;
    _isActive = isActive;
    _isDeleted = isDeleted;
    _sellPrice = sellPrice;
    _midVDSMedia = midVDSMedia;
    _odometerType = odometerType;
    _specialPrice = specialPrice;
    _isComingSoon = isComingSoon;
    _vehicleStatus = vehicleStatus;
    _totalCost = totalCost;
    _age = age;
}

  InventoryModel.fromJson(dynamic json) {
    _id = json['id'];
    _vehicles = json['Vehicles'] != null ? Vehicles.fromJson(json['Vehicles']) : null;
    _odometer = json['odometer'];
    _stockNO = json['stock_NO'];
    _createdAt = json['createdAt'];
    _isActive = json['is_active'];
    _isDeleted = json['is_deleted'];
    _sellPrice = json['sell_price'];
    if (json['MidVDSMedia'] != null) {
      _midVDSMedia = [];
      json['MidVDSMedia'].forEach((v) {
        _midVDSMedia?.add(MidVdsMedia.fromJson(v));
      });
    }
    _odometerType = json['odometer_type'];
    _specialPrice = json['special_price'];
    _isComingSoon = json['is_coming_soon'];
    _vehicleStatus = json['vehicle_status'];
    _totalCost = json['totalCost'];
    _age = json['age'];
  }
  int? _id;
  Vehicles? _vehicles;
  num? _odometer;
  String? _stockNO;
  String? _createdAt;
  num? _isActive;
  num? _isDeleted;
  num? _sellPrice;
  List<MidVdsMedia>? _midVDSMedia;
  num? _odometerType;
  num? _specialPrice;
  bool? _isComingSoon;
  num? _vehicleStatus;
  num? _totalCost;
  num? _age;
InventoryModel copyWith({  int? id,
  Vehicles? vehicles,
  num? odometer,
  String? stockNO,
  String? createdAt,
  num? isActive,
  num? isDeleted,
  num? sellPrice,
  List<MidVdsMedia>? midVDSMedia,
  num? odometerType,
  num? specialPrice,
  bool? isComingSoon,
  num? vehicleStatus,
  num? totalCost,
  num? age,
}) => InventoryModel(  id: id ?? _id,
  vehicles: vehicles ?? _vehicles,
  odometer: odometer ?? _odometer,
  stockNO: stockNO ?? _stockNO,
  createdAt: createdAt ?? _createdAt,
  isActive: isActive ?? _isActive,
  isDeleted: isDeleted ?? _isDeleted,
  sellPrice: sellPrice ?? _sellPrice,
  midVDSMedia: midVDSMedia ?? _midVDSMedia,
  odometerType: odometerType ?? _odometerType,
  specialPrice: specialPrice ?? _specialPrice,
  isComingSoon: isComingSoon ?? _isComingSoon,
  vehicleStatus: vehicleStatus ?? _vehicleStatus,
  totalCost: totalCost ?? _totalCost,
  age: age ?? _age,
);
  int? get id => _id;
  Vehicles? get vehicles => _vehicles;
  num? get odometer => _odometer;
  String? get stockNO => _stockNO;
  String? get createdAt => _createdAt;
  num? get isActive => _isActive;
  num? get isDeleted => _isDeleted;
  num? get sellPrice => _sellPrice;
  List<MidVdsMedia>? get midVDSMedia => _midVDSMedia;
  num? get odometerType => _odometerType;
  num? get specialPrice => _specialPrice;
  bool? get isComingSoon => _isComingSoon;
  num? get vehicleStatus => _vehicleStatus;
  num? get totalCost => _totalCost;
  num? get age => _age;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_vehicles != null) {
      map['Vehicles'] = _vehicles?.toJson();
    }
    map['odometer'] = _odometer;
    map['stock_NO'] = _stockNO;
    map['createdAt'] = _createdAt;
    map['is_active'] = _isActive;
    map['is_deleted'] = _isDeleted;
    map['sell_price'] = _sellPrice;
    if (_midVDSMedia != null) {
      map['MidVDSMedia'] = _midVDSMedia?.map((v) => v.toJson()).toList();
    }
    map['odometer_type'] = _odometerType;
    map['special_price'] = _specialPrice;
    map['is_coming_soon'] = _isComingSoon;
    map['vehicle_status'] = _vehicleStatus;
    map['totalCost'] = _totalCost;
    map['age'] = _age;
    return map;
  }

}

/// id : "1086282"
/// media_src : "/hillzgroup/9965686726491139-Honda-Accord_Sedan-2013-fccfda60-b125-11ed-b8dc-bbc4e2a87faf.jpg"
/// media_type : 1
/// createdAt : "2023-02-20T13:53:55.000Z"
/// updatedAt : "2023-02-20T13:54:13.000Z"
/// frk_mid_v_ds_id : "38139"
/// status : 2
/// error_reason : null
/// order : 1
/// frk_v_img_cat_id : null
/// visible : 1
/// template_src : "/hillzgroup/2013-Honda-AccordSedan-0-2902442138358796.jpg"
/// default_visible : 1

MidVdsMedia midVdsMediaFromJson(String str) => MidVdsMedia.fromJson(json.decode(str));
String midVdsMediaToJson(MidVdsMedia data) => json.encode(data.toJson());
class MidVdsMedia {
  MidVdsMedia({
      String? id, 
      String? mediaSrc, 
      num? mediaType, 
      String? createdAt, 
      String? updatedAt, 
      String? frkMidVDsId, 
      num? status, 
      dynamic errorReason, 
      num? order, 
      dynamic frkVImgCatId, 
      num? visible, 
      String? templateSrc, 
      num? defaultVisible,}){
    _id = id;
    _mediaSrc = mediaSrc;
    _mediaType = mediaType;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _frkMidVDsId = frkMidVDsId;
    _status = status;
    _errorReason = errorReason;
    _order = order;
    _frkVImgCatId = frkVImgCatId;
    _visible = visible;
    _templateSrc = templateSrc;
    _defaultVisible = defaultVisible;
}

  MidVdsMedia.fromJson(dynamic json) {
    _id = json['id'].toString();
    _mediaSrc = json['media_src'];
    _mediaType = json['media_type'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _frkMidVDsId = json['frk_mid_v_ds_id'].toString();
    _status = json['status'];
    _errorReason = json['error_reason'];
    _order = json['order'];
    _frkVImgCatId = json['frk_v_img_cat_id'];
    _visible = json['visible'];
    _templateSrc = json['template_src'];
    _defaultVisible = json['default_visible'];
  }
  String? _id;
  String? _mediaSrc;
  num? _mediaType;
  String? _createdAt;
  String? _updatedAt;
  String? _frkMidVDsId;
  num? _status;
  dynamic _errorReason;
  num? _order;
  dynamic _frkVImgCatId;
  num? _visible;
  String? _templateSrc;
  num? _defaultVisible;
MidVdsMedia copyWith({  String? id,
  String? mediaSrc,
  num? mediaType,
  String? createdAt,
  String? updatedAt,
  String? frkMidVDsId,
  num? status,
  dynamic errorReason,
  num? order,
  dynamic frkVImgCatId,
  num? visible,
  String? templateSrc,
  num? defaultVisible,
}) => MidVdsMedia(  id: id ?? _id,
  mediaSrc: mediaSrc ?? _mediaSrc,
  mediaType: mediaType ?? _mediaType,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  frkMidVDsId: frkMidVDsId ?? _frkMidVDsId,
  status: status ?? _status,
  errorReason: errorReason ?? _errorReason,
  order: order ?? _order,
  frkVImgCatId: frkVImgCatId ?? _frkVImgCatId,
  visible: visible ?? _visible,
  templateSrc: templateSrc ?? _templateSrc,
  defaultVisible: defaultVisible ?? _defaultVisible,
);
  String? get id => _id;
  String? get mediaSrc => _mediaSrc;
  num? get mediaType => _mediaType;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get frkMidVDsId => _frkMidVDsId;
  num? get status => _status;
  dynamic get errorReason => _errorReason;
  num? get order => _order;
  dynamic get frkVImgCatId => _frkVImgCatId;
  num? get visible => _visible;
  String? get templateSrc => _templateSrc;
  num? get defaultVisible => _defaultVisible;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['media_src'] = _mediaSrc;
    map['media_type'] = _mediaType;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['frk_mid_v_ds_id'] = _frkMidVDsId;
    map['status'] = _status;
    map['error_reason'] = _errorReason;
    map['order'] = _order;
    map['frk_v_img_cat_id'] = _frkVImgCatId;
    map['visible'] = _visible;
    map['template_src'] = _templateSrc;
    map['default_visible'] = _defaultVisible;
    return map;
  }

}

/// id : "42148"
/// make : "Honda"
/// model : "Accord Sedan"
/// BodyStyles : {"name":"Sedan"}
/// model_year : 2013
/// vin_number : "1HGCR2F53DA808667"
/// Colors_Vehicles_frk_exterior_colorToColors : null

Vehicles vehiclesFromJson(String str) => Vehicles.fromJson(json.decode(str));
String vehiclesToJson(Vehicles data) => json.encode(data.toJson());
class Vehicles {
  Vehicles({
      String? id, 
      String? make, 
      String? model, 
      BodyStyles? bodyStyles, 
      num? modelYear, 
      String? vinNumber, 
      dynamic colorsVehiclesFrkExteriorColorToColors,}){
    _id = id;
    _make = make;
    _model = model;
    _bodyStyles = bodyStyles;
    _modelYear = modelYear;
    _vinNumber = vinNumber;
    _colorsVehiclesFrkExteriorColorToColors = colorsVehiclesFrkExteriorColorToColors;
}

  Vehicles.fromJson(dynamic json) {
    _id = json['id'].toString();
    _make = json['make'];
    _model = json['model'];
    _bodyStyles = json['BodyStyles'] != null ? BodyStyles.fromJson(json['BodyStyles']) : null;
    _modelYear = json['model_year'];
    _vinNumber = json['vin_number'];
    _colorsVehiclesFrkExteriorColorToColors = json['Colors_Vehicles_frk_exterior_colorToColors'];
  }
  String? _id;
  String? _make;
  String? _model;
  BodyStyles? _bodyStyles;
  num? _modelYear;
  String? _vinNumber;
  dynamic _colorsVehiclesFrkExteriorColorToColors;
Vehicles copyWith({  String? id,
  String? make,
  String? model,
  BodyStyles? bodyStyles,
  num? modelYear,
  String? vinNumber,
  dynamic colorsVehiclesFrkExteriorColorToColors,
}) => Vehicles(  id: id ?? _id,
  make: make ?? _make,
  model: model ?? _model,
  bodyStyles: bodyStyles ?? _bodyStyles,
  modelYear: modelYear ?? _modelYear,
  vinNumber: vinNumber ?? _vinNumber,
  colorsVehiclesFrkExteriorColorToColors: colorsVehiclesFrkExteriorColorToColors ?? _colorsVehiclesFrkExteriorColorToColors,
);
  String? get id => _id;
  String? get make => _make;
  String? get model => _model;
  BodyStyles? get bodyStyles => _bodyStyles;
  num? get modelYear => _modelYear;
  String? get vinNumber => _vinNumber;
  dynamic get colorsVehiclesFrkExteriorColorToColors => _colorsVehiclesFrkExteriorColorToColors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['make'] = _make;
    map['model'] = _model;
    if (_bodyStyles != null) {
      map['BodyStyles'] = _bodyStyles?.toJson();
    }
    map['model_year'] = _modelYear;
    map['vin_number'] = _vinNumber;
    map['Colors_Vehicles_frk_exterior_colorToColors'] = _colorsVehiclesFrkExteriorColorToColors;
    return map;
  }

}

/// name : "Sedan"

BodyStyles bodyStylesFromJson(String str) => BodyStyles.fromJson(json.decode(str));
String bodyStylesToJson(BodyStyles data) => json.encode(data.toJson());
class BodyStyles {
  BodyStyles({
      String? name,}){
    _name = name;
}

  BodyStyles.fromJson(dynamic json) {
    _name = json['name'];
  }
  String? _name;
BodyStyles copyWith({  String? name,
}) => BodyStyles(  name: name ?? _name,
);
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    return map;
  }

}