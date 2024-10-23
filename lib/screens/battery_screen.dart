import 'package:battery_app/widgets/label_title.dart';
import 'package:battery_app/widgets/label_value.dart';
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
          children: <Widget>[
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Get Battery Info'),
            ),
            const SizedBox(height: 80),
            const LabelTitle(title: 'Battery Level'),
            const LabelValue(title: '88%'),
            const SizedBox(height: 20),
            const LabelTitle(title: 'Charging Status'),
            const LabelValue(title: 'Charging'),
            const SizedBox(height: 80),
            TextButton.icon(
              label: const Text('Refresh'),
              icon: const Icon(Icons.refresh),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
