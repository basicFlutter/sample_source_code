
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
    // ErrorModel errorModel =ErrorModel.fromJson(response.response?.data) ;
    // logger.e("$fromMethod : ${response.response?.data["message"]}");
    // logger.e("$fromMethod : ${response.response?.data["message"]}");


    if(response.type == DioErrorType.connectionTimeout){
      return ResponseError(
          message: "Please Check your Internet Connection",
          alertType: null,
          type: null,
          data: null,
          act: null,
          entity: null,
          reason: null
      );
    }
    else if(response.type == DioErrorType.unknown){
      return ResponseError(
          message: "Server is not Available",
          alertType: null,
          type: null,
          data: null,
          act: null,
          entity: null,
          reason: null
      );
    }
     return ResponseError(
         message: response.response?.data["message"]?.toString() ?? response.response?.statusMessage?.toString(),
         alertType: null,
         type: null,
         data: null,
         act: null,
         entity: null,
         reason: null
     );

  }




}