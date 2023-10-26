class WeatherData {
  final String cityName;
  final double temperature;
  final double humidity;
  final double windSpeed;
  final String weatherDescription;
  final String weatherIconUrl;

  WeatherData({
    required this.cityName,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.weatherDescription,
    required this.weatherIconUrl,
  });
}
