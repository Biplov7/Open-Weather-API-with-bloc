sealed class WeatherEvent {}

final class ApiFetchBasedonLocation extends WeatherEvent{
  final String city;

  ApiFetchBasedonLocation({required this.city});
  
}
