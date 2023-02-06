import 'package:dio/dio.dart';

import '../../../../core/data/network/api_provider.dart';
import '../models/forget_pass_map_model.dart';

class ForgetPassRemoteData{
  Future<dynamic> forgetPass(ForgetPassMapModel data ) async {
    Response res = await ApiProvider().post('$baseUrl/user/forgetPassword' , data:data );
    return res;
  }


}