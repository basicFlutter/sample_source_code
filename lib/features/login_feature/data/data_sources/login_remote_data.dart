import 'package:dio/dio.dart';
import 'package:new_panel/core/data/network/api_provider.dart';



class LoginRemoteData{

  Future<dynamic> login(Map<String , dynamic> data ) async {
    Response res = await ApiProvider().post('$baseUrl/auth/login' , data:data );
    return res;
  }


  Future<dynamic> authGoogle(String googleId ) async{
    Response res = await ApiProvider().post('$baseUrl/auth/google/verifyById' , data: {"id" :googleId.toString()});
    return res;
  }

  Future<dynamic> assignGoogleAccount(String googleId ) async{
    Response res = await ApiProvider().post('$baseUrl/user/assignGoogleAccount' , data: {"id" :googleId.toString()});
    return res;
  }
}