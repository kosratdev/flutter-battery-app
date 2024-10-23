import 'package:battery_app/screens/battery_screen.dart';
import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const BatteryScreen(title: 'Battery Home Page'),
    );
  }
}
