import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather.dart';

class WeatherService {
  Future<Weather> getWeather(String city) async {
    final apiKey = 'd6ae977ad937d5175afe6ab18afb6251'; // Ganti dengan API key cuaca yang valid
    final apiUrl = 'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    
    final response = await http.get(Uri.parse(apiUrl));
    
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Weather.fromJson(json);
    } else {
      throw Exception('Gagal mengambil data cuaca');
    }
  }
}
