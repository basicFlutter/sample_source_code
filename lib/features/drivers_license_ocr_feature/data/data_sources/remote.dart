import 'package:dio/dio.dart';
import 'package:new_panel/core/data/network/api_provider.dart';

class AddressProvider {
  Future<dynamic> callPostalCodDecoder(Map<String , dynamic> data ) async {

    // Response res = await ApiProvider().post('$baseUrl/auth/login' , data:data );
    Response res = await ApiProvider().post('$baseUrl/api/zipcode' , data:data );
    return res;
  }


}