import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioBaseUrl {
  final Dio _dio = Dio();

  DioBaseUrl() {
    _dio.options.baseUrl = "https://api.openweathermap.org";
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get getRequest => _dio;
}
