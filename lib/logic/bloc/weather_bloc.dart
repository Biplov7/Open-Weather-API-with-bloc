import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/data/model/weather_model.dart';
import 'package:weather_bloc/data/repository/weather_repository.dart';
import 'package:weather_bloc/logic/bloc/weather_event.dart';
import 'package:weather_bloc/logic/bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(InitialWeather()) {
    on<ApiFetchBasedonLocation>(_apiFetcher);
  }

  void _apiFetcher(
    ApiFetchBasedonLocation event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    try {
      WeatherResponse result = await weatherRepository.getWeather(event.city);
      emit(WeatherSuccess(result));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
