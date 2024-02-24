import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart'; // Import Lottie package
import '../bloc/weather_bloc.dart';
import '../models/weather.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherBloc = context.read<WeatherBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter city',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    weatherBloc.getWeather(_cityController.text);
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            BlocBuilder<WeatherBloc, Weather>(
              builder: (context, weather) {
                if (weather.city.isEmpty) {
                  return Text('Enter a city name to view weather.');
                }
                return Column(
                  children: [
                    Text('Weather in ${weather.city}:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Temperature: ${weather.temperature.toStringAsFixed(1)}°C'),
                    Text('Description: ${weather.description}'),
                    SizedBox(height: 20),
                    _buildWeatherAnimation(weather.description),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherAnimation(String weatherDescription) {
    String animationAsset;

    switch (weatherDescription.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        animationAsset = 'assets/cloud.json';
        break;
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        animationAsset = 'assets/rain.json';
        break;
      case 'thunderstorm':
        animationAsset = 'assets/thunder.json';
        break;
      case 'clear':
        animationAsset = 'assets/sunny.json';
        break;
      default:
        animationAsset = 'assets/sunny.json';
    }

    return Lottie.asset(
      animationAsset,
      width: 200,
      height: 200,
      fit: BoxFit.contain,
    );
  }

}
