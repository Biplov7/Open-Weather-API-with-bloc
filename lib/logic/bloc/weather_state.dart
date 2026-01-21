import 'package:weather_bloc/data/model/weather_model.dart';

sealed class WeatherState {}

final class InitialWeather extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  WeatherResponse repo;

  WeatherSuccess(this.repo);
}

final class WeatherFailure extends WeatherState {
  String failureMessage;

  WeatherFailure(this.failureMessage);
}

final class WeatherLoading extends WeatherState {}
