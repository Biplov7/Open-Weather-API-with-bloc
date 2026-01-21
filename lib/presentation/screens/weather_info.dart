import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    super.key,
    required this.sunrise,
    required this.sunset,
    required this.text1,
    required this.text2,
    required this.date1,
    required this.date2,
  });

  final String sunrise;
  final String sunset;
  final String text1;
  final String text2;
  final String date1;
  final String date2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _WeatherInfoItem(image: sunrise, label: text1, value: date1),
        _WeatherInfoItem(image: sunset, label: text2, value: date2),
      ],
    );
  }
}

class _WeatherInfoItem extends StatelessWidget {
  const _WeatherInfoItem({
    required this.image,
    required this.label,
    required this.value,
  });

  final String image;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height: 70, width: 70, child: Image.asset(image)),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
            ),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }
}
