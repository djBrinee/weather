import 'package:http/http.dart' as http;

class Networking {
  // String key = "693a1dac4f35c56894d35aea261313b9";
  // url 'https://api.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&exclude={part}&appid=693a1dac4f35c56894d35aea261313b9';

  Networking({required this.url});
  final String url;

  Future getWeather() async {
    var response = await http.get(Uri.parse(url));
    return response.body;
  }
}
