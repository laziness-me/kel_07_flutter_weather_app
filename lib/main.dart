import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app3/bloc/weather_bloc.dart';
import 'package:weather_app3/services/weather_service.dart';
import 'package:weather_app3/screens/home_screen.dart';

void main() {
  final WeatherService weatherService = WeatherService();
  final WeatherBloc weatherBloc = WeatherBloc(weatherService);

  runApp(MyApp(weatherBloc: weatherBloc)); // Menggunakan MyApp() dari main.dart
}

class MyApp extends StatelessWidget {
  final WeatherBloc weatherBloc;

  const MyApp({Key? key, required this.weatherBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => weatherBloc,
        child: HomeScreen(),
      ),
    );
  }
}
