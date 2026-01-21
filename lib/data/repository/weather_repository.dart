// https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}


import 'package:dio/dio.dart';
import 'package:weather_bloc/data/model/weather_model.dart';
import 'package:weather_bloc/data/repository/weather_api/api_key.dart';
import 'package:weather_bloc/data/repository/weather_api/dio_base_url.dart';

class WeatherRepository {
  DioBaseUrl api = DioBaseUrl();

  Future<WeatherResponse> getWeather(String city) async {
    try {
      Response response = await api.getRequest.get(
        '/data/2.5/weather',
        queryParameters: {'q': city, 'appid': apiKey,'unit':'metric'},
      );
      return WeatherResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
