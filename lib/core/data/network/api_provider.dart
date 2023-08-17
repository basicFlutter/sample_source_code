import 'package:dio/dio.dart';

import 'package:new_panel/main.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';


import '../../constants/constants.dart';
import '../cache/cache_provider.dart';
const baseUrl = 'http://192.168.1.120:8000';





abstract class ApiProviderInterface {
  Future<Response> get(path ,{Options? options });
  Future<Response> put(path, {Map? data,Options? options});
  Future<Response> post(path, {Map? data,Options? options});
  Future<Response> delete(path,{Options? options});
  Future<Response> patch(path,{Map? data,Options? options});
  Future<void> setToken();
  void initLogger();
}

class ApiProvider extends ApiProviderInterface {
  ApiProvider._internal();

  static final ApiProvider _singleton = ApiProvider._internal();

  factory ApiProvider() {
    return _singleton;
  }


  static BaseOptions optionsDio = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout:const Duration(milliseconds: 700000),
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  final Dio _dio = Dio(optionsDio);


  @override
  Future<Response> get(path, {dynamic data,Options? options}) async{
      return   await _dio.get(
          path,
          queryParameters: data,
          options: options
      );
  }

  @override
  Future<Response> post(path, {dynamic data,Options? options}) async => await _dio.post(
        path,
        data: data,
      options: options
      );

  @override
  Future<Response> put(path, {Map? data,Options? options}) async => await _dio.put(
        path,
        data: data,
      options: options
      );
  @override
  Future<Response> delete(path, {Options? options}) async => await _dio.delete(
        path,
      options: options
      );
  @override
  Future<Response> patch(path, {dynamic? data,Options? options}) async => await _dio.patch(
      path,
      options: options,
    data: data
  );

  @override
  void initLogger() async{
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      request: true,
      responseBody: false,
      responseHeader: false,
      compact: false,
    ));

  }

  @override
  Future<void> setToken() async{
    _dio.options.headers.addAll({"Authorization" : "Bearer ${Constants.accessToken}"});
  }


}
