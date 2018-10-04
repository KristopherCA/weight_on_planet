import 'package:flutter/material.dart';
import './ui/home.dart';

main() => runApp(WeightOnPlanet());

class WeightOnPlanet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weight On Planet X',
        home: Home());
  }
}
