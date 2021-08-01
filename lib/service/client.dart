import 'package:dio/dio.dart';

class DioClient {
  static Dio? _dio;
  static Dio _createDio() {
    Dio dio = Dio();
    dio.options.baseUrl = 'https://covid19.th-stat.com/json/covid19v2/';
    // dio.options.connectTimeout = 60000; //5s
    // dio.options.receiveTimeout = 60000;
    return dio;
  }

  static Dio dio() {
    _dio ??= _createDio();
    return _dio!;
  }
}
