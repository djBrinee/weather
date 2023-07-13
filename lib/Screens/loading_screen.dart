import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/constants/constants.dart';
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
    Networking oNetworking = Networking(url:getUrlForCurrent(oLocation.latitude, oLocation.longitude));
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
