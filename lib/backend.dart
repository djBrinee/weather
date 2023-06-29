import 'package:geolocator/geolocator.dart';

class Backend_Weather {
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    //Validating service is enable
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    //If the service is enabled, the code will validate the permission about location in Android
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      //If permission is denied, the code will ask for it
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    // If permission is denied forever, the code will never work
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // If permission is allowed and the service is enabled, the code will return current position (latitude and longitude)
    return await Geolocator.getCurrentPosition();
  }
}
