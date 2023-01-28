import 'package:dio/dio.dart';

import '../../../../core/data/network/api_provider.dart';

class VerifyRemoteData{
  Future<dynamic> verifyCode(Map<String , dynamic> data ) async {
    Response res = await ApiProvider().post('$baseUrl/auth/confirm' , data:data );
    return res;
  }
}