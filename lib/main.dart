import 'package:battery_app/screens/battery_screen.dart';
import 'package:flutter/material.dart';

var bColorScheme = ColorScheme.fromSeed(seedColor: Colors.amber);

void main() {
  runApp(const BatteryApp());
}

class BatteryApp extends StatelessWidget {
  const BatteryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Battery App',
      theme: ThemeData(
        colorScheme: bColorScheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: bColorScheme.primaryContainer,
            foregroundColor: bColorScheme.onPrimaryContainer,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: bColorScheme.onPrimaryFixedVariant,
          ),
        ),
        useMaterial3: true,
      ),
      home: const BatteryScreen(title: 'Battery Information'),
    );
  }
}
