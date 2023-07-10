
import 'package:new_panel/features/login_feature/domain/entities/customer_login_entity.dart';

import 'user_customer.dart';

class CustomerLoginModel extends CustomerLoginEntity{


  CustomerLoginModel.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}