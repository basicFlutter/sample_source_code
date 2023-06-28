
import 'package:dio/dio.dart';
import 'package:new_panel/core/exceptions/error_model.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/main.dart';

class ErrorHandling {
  static final ErrorHandling _errorHandling = ErrorHandling._internal();

  factory ErrorHandling() {
    return _errorHandling;
  }

  ErrorHandling._internal();


  ResponseError getResponseError({required DioError response ,required String fromMethod}){
    ErrorModel errorModel =ErrorModel.fromJson(response.response?.data) ;
    logger.e("$fromMethod : ${errorModel.message}");
     return ResponseError(
         message: errorModel.message,
         alertType: errorModel.alertType,
         type: errorModel.type,
         data: errorModel.data,
         act: errorModel.act,
         entity: errorModel.entity,
         reason: errorModel.reason
     );

  }




}