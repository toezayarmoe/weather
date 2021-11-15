import 'package:flutter/rendering.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';

String openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
String apiKey = '6c2b7b81a542129c02c4d05bafdd79dc';

class WeatherModel {
  Future<Map> getCityWeather(String cityName) async {
    Map decodedData;
    var url =
        Uri.parse('$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    NetworkHelper networkHelper = NetworkHelper(url);
    try {
      decodedData = await networkHelper.getData();
    } catch (e) {
      decodedData = {"Error": "null"};
    }
    debugPrint(decodedData.toString());
    return decodedData;
  }

  Future<Map> getWeatherData() async {
    Map decodedData;
    Location location = Location();
    await location.getCurrentLocation();
    var url = Uri.parse(
        "$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
    NetworkHelper networkHelper = NetworkHelper(url);
    try {
      decodedData = await networkHelper.getData();
    } catch (e) {
      decodedData = {"Error": "null"};
    }
    debugPrint(decodedData.toString());
    return decodedData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
