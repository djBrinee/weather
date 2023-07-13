import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather/constants/constants.dart';
import 'package:weather/logic/networking.dart';
import 'package:weather/logic/weather.dart';
import 'dart:convert';

import 'package:weather/screens/city_screen.dart';

class LocScreen extends StatefulWidget {
  LocScreen({super.key, required this.locationWeather});

  final locationWeather;

  @override
  _LocScreenState createState() => _LocScreenState();
}

class _LocScreenState extends State<LocScreen> {
  WeatherModel weather = WeatherModel();
  var temperature;
  String? weatherIcon;
  String time = '';
  var cityName;
  String celsiusTemp = '';

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    Map<String, dynamic> jsonMap = jsonDecode(weatherData);
    var temp = jsonMap['current']['temp'];
    temperature = temp.toInt();
    var condition = jsonMap['current']['weather'][0]['id'];
    cityName = jsonMap['timezone'].replaceAll('/', ", ").replaceAll('_', ' ');
    celsiusTemp = (temp - 273.15).toStringAsFixed(2);
    weatherIcon = weather.getWeatherIcon(condition);
    time = weather.getMessage(temperature);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      updateUI(widget.locationWeather);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var response = await Navigator.push(
                          context, MaterialPageRoute(builder: (context) => CityScreen()));
                      if (response != null) {
                        updateUI(response);
                        print(response);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${celsiusTemp}°C',
                      //'32°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon.toString(),
                      //'☀️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "${time} in ${cityName}!",
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
