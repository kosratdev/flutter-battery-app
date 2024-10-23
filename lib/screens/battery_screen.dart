import 'package:flutter/material.dart';

class BatteryScreen extends StatefulWidget {
  const BatteryScreen({super.key, required this.title});

  final String title;

  @override
  State<BatteryScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BatteryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Text Content',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
