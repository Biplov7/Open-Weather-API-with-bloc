String getWeatherImage(String? condition) {
  switch (condition?.toLowerCase()) {
    case 'clear':
      return 'assets/images/7.png';
    case 'clouds':
      return 'assets/images/8.png';
    case 'rain':
    case 'drizzle':
      return 'assets/images/2.png';
    case 'thunderstorm':
      return 'assets/images/1.png';
    case 'snow':
      return 'assets/images/4.png';
    case 'mist':
    case 'fog':
    case 'haze':
      return 'assets/images/5.png';
    default:
      return 'assets/images/9.png';
  }
}
