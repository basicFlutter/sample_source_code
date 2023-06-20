import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// const baseUrl = 'https://hillz-panel-backend.azurewebsites.net';
const baseUrl = 'http://192.168.1.120:8000';
// const domain = 'localhost:3000';
const imageBaseUrl = 'https://image123.azureedge.net';



abstract class ApiProviderInterface {
  Future<Response> get(path, {Map<String, dynamic>? data});
  Future<Response> put(path, {Map? data});
  Future<Response> post(path, {Map? data});
  Future<Response> delete(path);
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
      "Authorization" :"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjMsImlhdCI6MTY4NzI2NjUxOCwiZXhwIjoxNjg3MjcwMTE4fQ.Ofm0-flkYI7RxBAglCo_BrEaMeNfSKEzNQzKWZsWOdE",
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  final Dio _dio = Dio(options);

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
  void initLogger() {
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      responseHeader: false,
      compact: false,
    ));
  }
}
