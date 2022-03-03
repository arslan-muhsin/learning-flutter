import 'package:climate/services/location.dart';
import 'package:climate/services/networking.dart';
import 'package:climate/utilities/constants.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    var url =
        '$apiUrl?key=$apiKey&q=${location.latitude},${location.longitude}';

    NetworkHelper networkHelper = NetworkHelper(url: url);
    return await networkHelper.getData();
  }

  Future<dynamic> getLocationWeatherByCity(String cityName) async {
    Location location = Location();
    await location.getCurrentLocation();

    var url = '$apiUrl?key=$apiKey&q=$cityName';

    NetworkHelper networkHelper = NetworkHelper(url: url);
    return await networkHelper.getData();
  }

  AssetImage getWeatherIcon(String iconPath) {
    return AssetImage(iconPath.replaceAll("//cdn.weatherapi.com/", "images/"));
  }

  String getMessage(double temp) {
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
