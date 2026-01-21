import 'package:intl/intl.dart';
import 'package:weather_bloc/data/model/weather.dart';
import 'package:weather_bloc/data/model/weather_model.dart';

final WeatherResponse weatherResponse = WeatherResponse();

int dt = weatherResponse.dt!; // 1768917393
int timezone = weatherResponse.timezone!; // 20700

DateTime localDateTime = DateTime.fromMillisecondsSinceEpoch(
  (dt + timezone) * 1000,
  isUtc: true,
);

String formattedTime = DateFormat('EEEE - HH:mm').format(localDateTime);

int sunriseUtc = weatherResponse.sys!.sunrise!;
int sunsetUtc = weatherResponse.sys!.sunset!;

// Sunrise
DateTime sunriseLocal = DateTime.fromMillisecondsSinceEpoch(
  (sunriseUtc + timezone) * 1000,
  isUtc: true,
);

// Sunset
DateTime sunsetLocal = DateTime.fromMillisecondsSinceEpoch(
  (sunsetUtc + timezone) * 1000,
  isUtc: true,
);

List<Weather> weatherList = weatherResponse.weather!;

String allWeather = weatherList.map((e) => e.main).join(", ");