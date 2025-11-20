import 'package:flutter/material.dart';
import 'screens/calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
  fontFamily: 'Roboto',
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF2D3142),
    secondary: Color(0xFF4F5D75),
    tertiary: Color(0xFFBFC0C0), // Accent Color
  ),
  scaffoldBackgroundColor: Color(0xFF2D3142),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
  ),
),

      home: const CalculatorScreen(),
    );
  }
}
