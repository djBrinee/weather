import 'package:flutter/material.dart';

const kTempTextStyle =
    TextStyle(fontFamily: 'Spartan_MB', fontSize: 80.0, fontWeight: FontWeight.w900);
const kMessageTextStyle = TextStyle(
    fontFamily: 'Spartan_MB',
    fontSize: 35.0,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 170, 236, 233));
const kButtontextStyle = TextStyle(
    fontFamily: 'Spartan_MB', fontSize: 40.0, color: Colors.blue, fontWeight: FontWeight.bold);
const kConditionTextStyle = TextStyle(fontSize: 80.0);

String getUrlForCurrent(double? latitude, double? longitude) {
  return 'https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&appid=ab225a718a4dd4e8290c8a649166e7bc';
}

String getUrlForSearched(String city) {
  return 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=ab225a718a4dd4e8290c8a649166e7bc';
}
