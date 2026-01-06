import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: Color(0xFF0E111F),
            foregroundColor: Colors.white,
          ),
          scaffoldBackgroundColor: Color(0xFF0E111F),
      ),
      home: InputPage(),
    );
  }
}

