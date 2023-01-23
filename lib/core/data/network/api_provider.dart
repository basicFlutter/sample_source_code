import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const baseUrl = 'https://api.hillzusers.com/api/';
// const domain = 'autohousenewmarket.ca';
const domain = 'localhost:3000';
const chatSocketUrl = 'wss://chat.hillzusers.com:8443/chat';


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
    connectTimeout: 150000,
    headers: {
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
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
  }
}
