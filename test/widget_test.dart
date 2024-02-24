// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:weather_app3/bloc/weather_bloc.dart';
import 'package:weather_app3/services/weather_service.dart'; // Import WeatherService class
import 'package:weather_app3/screens/home_screen.dart';

void main() {
  final WeatherBloc weatherBloc = WeatherBloc(WeatherService()); // Initialize WeatherService here

  runApp(MyApp(weatherBloc: weatherBloc));
}

class MyApp extends StatelessWidget {
  final WeatherBloc weatherBloc;

  const MyApp({Key? key, required this.weatherBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}


