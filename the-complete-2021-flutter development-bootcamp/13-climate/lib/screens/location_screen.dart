import 'package:climate/screens/city_screen.dart';
import 'package:climate/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:climate/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final dynamic weatherData;

  const LocationScreen({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late double temp;
  late String iconPath;
  late String locationName;

  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedCityName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CityScreen(),
                        ),
                      );

                      if (typedCityName != null) {
                        var weatherData = await weatherModel
                            .getLocationWeatherByCity(typedCityName);

                        updateUI(weatherData);
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  children: [
                    Image(
                      image: weatherModel.getWeatherIcon(iconPath),
                      height: 128.0,
                      width: 128.0,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      locationName,
                      style: kButtonTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  weatherModel.getMessage(temp),
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      temp = weatherData["current"]["temp_c"];
      iconPath = weatherData["current"]["condition"]["icon"];
      locationName = weatherData["location"]["name"];
    });
  }
}
