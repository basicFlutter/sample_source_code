import 'package:new_panel/core/data/network/api_provider.dart';
import 'package:new_panel/core/params/forgot_password_params.dart';

class ForgotPasswordDataProvider {
  Future<dynamic> callForgotPassword(ForgotPasswordParams forgotPasswordParams)async{
    final response = await ApiProvider().post('/api/user/forgotPassword', data: forgotPasswordParams.toJson());
    return response;
  }
}