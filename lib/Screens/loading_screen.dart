import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/logic/location.dart';
import 'package:weather/logic/networking.dart';
import 'package:weather/screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    super.initState();
    _getWeather();
  }

  dynamic _getWeather() async {
    Location oLocation = new Location();
    var _cords = await oLocation.determinePosition();
    Networking oNetworking = Networking(
        url:
            'https://api.openweathermap.org/data/2.5/onecall?lat=${oLocation.latitude}&lon=${oLocation.longitude}&appid=ab225a718a4dd4e8290c8a649166e7bc');
    var weatherData = await oNetworking.getWeather();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LocScreen(locationWeather: weatherData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: SpinKitWave(
        color: Colors.lightBlue,
        size: 50.0,
      )),
    );
  }
}
