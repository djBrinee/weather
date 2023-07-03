import 'package:flutter/material.dart';
import 'package:weather/constants.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.house,
                color: Colors.blue,
                size: 50.0,
              ),
              Icon(Icons.arrow_forward, color: Colors.blue, size: 58.0)
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "32º",
              style: kTempTextStyle,
            ),
            Icon(
              Icons.sunny,
              size: 100.0,
              color: Colors.yellow,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "I's",
              style: kMessageTextStyle,
            ),
            Icon(
              Icons.icecream,
              size: 60.0,
              color: Colors.yellow,
            ),
            Text(
              "time in San Francisco",
              style: kMessageTextStyle,
            )
          ],
        )
      ],
    );
  }
}
