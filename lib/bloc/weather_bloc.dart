import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/weather_service.dart';
import '../models/weather.dart';

class WeatherBloc extends Cubit<Weather> {
  final WeatherService weatherService;

  WeatherBloc(this.weatherService) : super(Weather(city: '', temperature: 0, description: ''));

  void getWeather(String city) async {
    try {
      final weather = await weatherService.getWeather(city);
      emit(weather);
    } catch (_) {
      // Handle error
    }
  }
}