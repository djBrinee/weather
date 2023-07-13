import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/constants/constants.dart';

class Networking {
  // String key = "693a1dac4f35c56894d35aea261313b9";
  // url 'https://api.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&exclude={part}&appid=693a1dac4f35c56894d35aea261313b9';

  Networking({required this.url});
  final String url;

  Future getWeather() async {
    final response = await http.get(Uri.parse(url));
    return response.body;
  }

  Future getWeatherSearched() async {
    final response = await http.get(Uri.parse(url));
    var firstStuff = jsonDecode(response.body);

    double lat = firstStuff['coord']['lat'];
    double lon = firstStuff['coord']['lon'];

    var newUrl = getUrlForCurrent(lat, lon);

    final result = await http.get(Uri.parse(newUrl));

    return result.body;
  }
}
