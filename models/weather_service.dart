import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = dotenv.env['OPENWEATHERMAP_API_KEY'] ?? '';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<WeatherData> getWeatherData(String cityName) async {
    final response =
        await http.get(Uri.parse('$baseUrl?q=$cityName&appid=$apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return WeatherData(
        cityName: data['name'],
        temperature: data['main']['temp'].toDouble(),
        humidity: data['main']['humidity'].toDouble(),
        windSpeed: data['wind']['speed'].toDouble(),
        weatherDescription: data['weather'][0]['description'],
        weatherIconUrl:
            'https://openweathermap.org/img/wn/${data['weather'][0]['icon']}.png',
      );
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
