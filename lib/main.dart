import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherApp(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String cityName = 'Bangkok'; // เริ่มต้นด้วยการแสดงสภาพอากาศในกรุงเทพ
  String unit = '°C'; // หน่วยอุณหภูมิเริ่มต้น

  // ข้อมูลสภาพอากาศจาก API
  Map<String, dynamic> weatherData = {};

  // อัปเดตข้อมูลสภาพอากาศ
  void updateWeather() async {
    final response = await http.get(
      Uri.parse(
        'https://cpsu-test-api.herokuapp.com/api/1_2566/weather/current?city=Bangkok',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        weatherData = data;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    updateWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('City: $cityName'),
            SizedBox(height: 20),
            Text('Temperature: ${weatherData['temperature']} $unit'),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
