import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/data/repository/weather_repository.dart';
import 'package:weather_bloc/logic/bloc/weather_bloc.dart';
import 'package:weather_bloc/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

final AppRoutes _routes = AppRoutes();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(),
      child: BlocProvider(
        create: (context) => WeatherBloc(context.read<WeatherRepository>()),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.dark,
            ),
          ),
          routerConfig: _routes.router,
        ),
      ),
    );
  }
}
