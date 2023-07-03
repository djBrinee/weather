import 'package:flutter/material.dart';
import 'package:weather/loading_screen.dart';
import 'package:weather/location.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _printData();
  }

  void _printData() async {
    Location oLocation = new Location();
    var _cords = await oLocation.determinePosition();
    print("Latitude: ${_cords.latitude}, longitude: ${_cords.longitude}");
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: LoadingScreen(),
      ),
    );
  }
}
