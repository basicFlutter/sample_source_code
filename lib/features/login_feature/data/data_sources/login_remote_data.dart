import 'package:dio/dio.dart';

import '../../../../core/data/network/api_provider.dart';

class LoginRemoteData{
  Future<dynamic> login(Map<String , dynamic> data ) async {
    Response res = await ApiProvider().post('$baseUrl/auth/login' , data:data );
    return res;
  }

  Future<dynamic> authGoogle() async{
    Response res = await ApiProvider().get('$baseUrl/auth/google');
    return res;
  }

  // Future<dynamic> verifyGoogle() async{
  //   Response res = await ApiProvider().get('$baseUrl/auth/google/verify');
  //   return res;
  // }
}