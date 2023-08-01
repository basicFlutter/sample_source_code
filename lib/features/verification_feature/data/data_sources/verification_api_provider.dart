import 'package:new_panel/core/data/network/api_provider.dart';

class VerificationApiProvider{

  Future<dynamic> callSendVerificationChangePassword()async{
    return await ApiProvider().post("$baseUrl/api/user/change/password/send-verification-code");
  }


}