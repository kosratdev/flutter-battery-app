import 'package:battery_app/services/battery_exception.dart';
import 'package:flutter/services.dart';

/// A service class that provides methods to interact with the battery status
/// using platform-specific code.
///
/// This class uses a [MethodChannel] to communicate with the native platform
/// and retrieve battery information.
///
/// Methods:
/// - [getBatteryLevel]: Retrieves the current battery level as an integer.
/// - [isCharging]: Checks if the device is currently charging and returns a boolean.
///
/// Throws:
/// - [BatteryException]: If there is an error while invoking the platform method.
class BatteryService {
  static const platform = MethodChannel('krg.dit.battery');

  /// Retrieves the current battery level of the device.
  ///
  /// This method invokes a platform-specific method to get the battery level.
  /// If the platform method fails, a [BatteryException] is thrown with the
  /// corresponding error message.
  ///
  /// Returns:
  ///   A [Future] that completes with the battery level as an integer.
  ///
  /// Throws:
  ///   [BatteryException] if the platform method fails to retrieve the battery level.
  Future<int> getBatteryLevel() async {
    try {
      final int batteryLevel = await platform.invokeMethod('getBatteryLevel');
      return batteryLevel;
    } on PlatformException catch (e) {
      throw BatteryException('Failed to get battery level: ${e.message}');
    }
  }

  /// Checks if the device is currently charging.
  ///
  /// This method invokes a platform-specific method to determine the charging status
  /// of the device. If the platform method call is successful, it returns a boolean
  /// indicating whether the device is charging. If the call fails, it throws a
  /// [BatteryException] with an appropriate error message.
  ///
  /// Returns:
  /// - `true` if the device is charging.
  /// - `false` if the device is not charging.
  ///
  /// Throws:
  /// - [BatteryException] if the platform method call fails.
  Future<bool> isCharging() async {
    try {
      final bool isCharging = await platform.invokeMethod('getChargingStatus');
      return isCharging;
    } on PlatformException catch (e) {
      throw BatteryException('Failed to get charging status: ${e.message}');
    }
  }
}
