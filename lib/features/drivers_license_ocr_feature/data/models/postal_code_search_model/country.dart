class Country {
  Country({
      this.id, 
      this.country, 
      this.createdAt, 
      this.updatedAt,});

  Country.fromJson(dynamic json) {
    id = json['id'];
    country = json['country'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? id;
  String? country;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['country'] = country;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}