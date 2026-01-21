import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_bloc/presentation/screens/weather_cond_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(11, 0.5 * kToolbarHeight, 10, 20),
        child: SizedBox(
          height: screenHeight,
          child: Stack(
            children: [
              // Background circles
              Align(
                alignment: const Alignment(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0, -1.2),
                child: Container(
                  height: 300,
                  width: 900,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFFAB40),
                  ),
                ),
              ),

              // Blur effect
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(color: Colors.transparent),
              ),

              // Main content
              SizedBox(
                width: screenWidth,
                height: screenHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 10),
                    _AppBar(),
                    Text(
                      "Good Morning",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(child: WeatherConditionScreen()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 33,
          width: 35,
          child: Image.asset('assets/images/weather_logo.png'),
        ),
        const Text(
          "Weather App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
