import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_bloc/logic/bloc/weather_bloc.dart';
import 'package:weather_bloc/logic/bloc/weather_event.dart';
import 'package:weather_bloc/logic/bloc/weather_state.dart';
import 'package:weather_bloc/presentation/helper/image_mapper.dart';
import 'package:weather_bloc/presentation/screens/weather_info.dart';

class WeatherConditionScreen extends StatefulWidget {
  const WeatherConditionScreen({super.key});

  @override
  State<WeatherConditionScreen> createState() => _WeatherConditionScreenState();
}

class _WeatherConditionScreenState extends State<WeatherConditionScreen> {
  final TextEditingController _cityController = TextEditingController();

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  String formatTemperature(double? tempKelvin) {
    if (tempKelvin == null) return "--°C";
    final tempCelsius = tempKelvin - 273.15;
    return "${tempCelsius.toStringAsFixed(1)}°C";
  }

  String formatTime(int? timestamp, int? timezoneOffset) {
    try {
      if (timestamp == null) return "--:--";
      final date = DateTime.fromMillisecondsSinceEpoch(
        (timestamp + (timezoneOffset ?? 0)) * 1000,
        isUtc: true,
      );
      return DateFormat.jm().format(date);
    } catch (_) {
      return "--:--";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _cityController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  labelText: "Enter City Name",
                  hintText: "e.g., Kathmandu",
                ),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    context.read<WeatherBloc>().add(
                      ApiFetchBasedonLocation(city: value),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),

              if (state is WeatherLoading)
                const CircularProgressIndicator()
              else if (state is WeatherFailure)
                const Text(
                  "Cannot fetch weather data.",
                  style: TextStyle(color: Colors.red),
                )
              else if (state is WeatherSuccess)
                Column(
                  children: [
                    SizedBox(
                      height: 230,
                      width: double.infinity,
                      child: Image.asset(
                        getWeatherImage(
                          state.repo.weather?.isNotEmpty == true
                              ? state.repo.weather![0].main
                              : null,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Text(
                      formatTemperature(state.repo.main?.temp),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 5),

                    Text(
                      state.repo.weather?.isNotEmpty == true
                          ? state.repo.weather![0].main ?? "N/A"
                          : "N/A",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 5),

                    Text(
                      formatTime(state.repo.dt, state.repo.timezone),
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 20),

                    WeatherInfo(
                      sunrise: "assets/images/11.png",
                      sunset: "assets/images/12.png",
                      text1: "Sunrise",
                      text2: "Sunset",
                      date1: formatTime(
                        state.repo.sys?.sunrise,
                        state.repo.timezone,
                      ),
                      date2: formatTime(
                        state.repo.sys?.sunset,
                        state.repo.timezone,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(indent: 25, endIndent: 25),
                    const SizedBox(height: 10),

                    WeatherInfo(
                      sunrise: "assets/images/13.png",
                      sunset: "assets/images/14.png",
                      text1: "Temp Max",
                      text2: "Temp Min",
                      date1: formatTemperature(state.repo.main?.tempMax),
                      date2: formatTemperature(state.repo.main?.tempMin),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
