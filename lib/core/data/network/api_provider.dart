import 'package:dio/dio.dart';
import 'package:new_panel/core/constants/constants.dart';
import 'package:new_panel/core/data/cache/cache_provider.dart';
import 'package:new_panel/main.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const baseUrl = 'https://hillz-panel-backend.azurewebsites.net';
// const baseUrl = 'http://192.168.1.120:8000';
// const baseUrl = 'https://api.test333web.ca';
// const domain = 'localhost:3000';
const imageBaseUrl = 'https://image123.azureedge.net';



abstract class ApiProviderInterface {
  Future<Response> get(path, {Map<String, dynamic>? data});
  Future<Response> put(path, {Map? data});
  Future<Response> post(path, {Map? data});
  Future<Response> delete(path);
  Future<void> setToken();
  void initLogger();
}

class ApiProvider extends ApiProviderInterface {
  ApiProvider._internal();

  static final ApiProvider _singleton = ApiProvider._internal();

  factory ApiProvider() {
    return _singleton;
  }


  static BaseOptions options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout:const Duration(milliseconds: 150000),
    headers: {
     // "Authorization" :"Bearer ${_singleton.getToken()}",
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  final Dio _dio = Dio(options);

  Future<String?> getToken()async{
    return await CacheProvider.getString("accessToken");
  }

  @override
  Future<Response> get(path, {dynamic data}) async => await _dio.get(
        path,
        queryParameters: data,
      );

  @override
  Future<Response> post(path, {dynamic data}) async => await _dio.post(
        path,
        data: data,
      );

  @override
  Future<Response> put(path, {Map? data}) async => await _dio.put(
        path,
        data: data,
      );
  @override
  Future<Response> delete(path) async => await _dio.delete(
        path,
      );

  @override
  void initLogger() async{
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      responseHeader: false,
      compact: false,
    ));

  }

  @override
  Future<void> setToken() async{
    // _dio.options.headers.addAll({"Authorization" : "Bearer ${await CacheProvider.getString("accessToken")}"});
    _dio.options.headers.addAll({"Authorization" : "Bearer ${Constants.accessToken}"});
    logger.w(_dio.options.headers);
  }
}
