import 'package:flutter/material.dart';
import 'package:weather/backend.dart';
import 'package:weather/constants.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 50),
          child: Row(
            children: [Icon(Icons.arrow_back, color: Colors.blue, size: 55)],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                child: Text(
                  "Get Weather",
                  style: kButtontextStyle,
                ),
                onPressed: () async {
                  var oBackend = new Backend_Weather();
                  var position = await oBackend.determinePosition();
                  print(position);
                })
          ],
        )
      ],
    );
  }
}
