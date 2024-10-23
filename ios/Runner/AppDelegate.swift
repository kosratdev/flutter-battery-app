import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
      _ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
      let controller = window?.rootViewController as! FlutterViewController
      let batteryChannel = FlutterMethodChannel(name: "krg.dit.battery",
                                                binaryMessenger: controller.binaryMessenger)

      batteryChannel.setMethodCallHandler { [weak self] (call, result) in
        switch call.method {
        case "getBatteryLevel":
          self?.getBatteryLevel(result: result)
        case "getChargingStatus":
          self?.getChargingStatus(result: result)
        default:
          result(FlutterMethodNotImplemented)
        }
      }

      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    /// Retrieves the current battery level of the device.
    /// 
    /// - Parameter result: A `FlutterResult` callback to return the battery level or an error.
    /// 
    /// This function enables battery monitoring on the device and calculates the battery level as a percentage.
    /// If the battery level is not available, it returns a `FlutterError` with the code "UNAVAILABLE".
    /// Otherwise, it returns the battery level as an integer percentage.
    private func getBatteryLevel(result: FlutterResult) {
      UIDevice.current.isBatteryMonitoringEnabled = true
      let batteryLevel = Int(UIDevice.current.batteryLevel * 100)
      if batteryLevel == -100 {
        result(FlutterError(code: "UNAVAILABLE", message: "Battery level not available.", details: nil))
      } else {
        result(batteryLevel)
      }
    }

    /// Retrieves the current charging status of the device and returns it through the provided FlutterResult.
    /// 
    /// This function enables battery monitoring on the device, checks if the battery is either charging or full,
    /// and then sends the result back to the Flutter side.
    ///
    /// - Parameter result: A FlutterResult callback that returns a Boolean indicating whether the device is charging or fully charged.
    private func getChargingStatus(result: FlutterResult) {
      UIDevice.current.isBatteryMonitoringEnabled = true
      let isCharging = UIDevice.current.batteryState == .charging || UIDevice.current.batteryState == .full
      result(isCharging)
    }
  }
