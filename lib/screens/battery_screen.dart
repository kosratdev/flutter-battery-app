import 'package:battery_app/services/battery_service.dart';
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
  final BatteryService _batteryService = BatteryService();
  String _batteryLevel = '...';
  String _chargingStatus = '...';
  bool _isLoading = false;

  /// Fetches battery level and charging status.
  ///
  /// Sets `_isLoading` to `true` before fetching data using `_batteryService`.
  /// Updates `_batteryLevel` and `_chargingStatus` on success.
  /// Handles errors with `_handleError`.
  /// Resets `_isLoading` to `false` after completion.
  Future<void> _getBatteryInfo() async {
    setState(() => _isLoading = true);

    try {
      final batteryLevel = await _batteryService.getBatteryLevel();
      final isCharging = await _batteryService.isCharging();
      setState(() {
        _batteryLevel = 'Battery level: $batteryLevel%';
        _chargingStatus = isCharging ? 'Charging' : 'Not charging';
      });
    } catch (e) {
      _handleError(e);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  /// Handles errors that occur while fetching battery information.
  /// Updates the state to display error messages and logs the error.
  ///
  /// Parameters:
  /// - `e`: The error that occurred.
  void _handleError(dynamic e) {
    setState(() {
      _batteryLevel = 'Error: Unable to fetch battery info.';
      _chargingStatus = 'Error: Unable to fetch charging status.';
    });
    debugPrint('Error: $e');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: _getBatteryInfo,
              child: const Text('Get Battery Info'),
            ),
            const SizedBox(height: 80),
            const LabelTitle(title: 'Battery Level'),
            LabelValue(title: _batteryLevel),
            const SizedBox(height: 20),
            const LabelTitle(title: 'Charging Status'),
            LabelValue(title: _chargingStatus),
            const SizedBox(height: 80),
            TextButton.icon(
              label: const Text('Refresh'),
              icon: const Icon(Icons.refresh),
              onPressed: _getBatteryInfo,
            ),
            const SizedBox(height: 20),
            if (_isLoading) const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
