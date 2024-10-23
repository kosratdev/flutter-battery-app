package com.example.battery_app

import android.os.BatteryManager
import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel


/**
 * MainActivity class that extends FlutterActivity to handle method channels for battery information.
 *
 * This class sets up a method channel to communicate with Flutter and provides methods to retrieve
 * the battery level and charging status of the device.
 *
 * @property CHANNEL The name of the method channel used for communication.
 */
class MainActivity : FlutterActivity() {
    private val CHANNEL = "krg.dit.battery"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        flutterEngine?.dartExecutor?.binaryMessenger?.let {
            MethodChannel(
                it,
                CHANNEL
            ).setMethodCallHandler { call, result ->
                when (call.method) {
                    "getBatteryLevel" -> result.success(getBatteryLevel())
                    "getChargingStatus" -> result.success(isCharging())
                    else -> result.notImplemented()
                }
            }
        }
    }

    /**
     * Retrieves the current battery level of the device.
     *
     * @return The battery level as an integer percentage (0-100).
     */
    private fun getBatteryLevel(): Int {
        val batteryManager = getSystemService(BATTERY_SERVICE) as BatteryManager
        return batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    }

    /**
     * Checks if the device is currently charging.
     *
     * @return `true` if the device is charging, `false` otherwise.
     */
    private fun isCharging(): Boolean {
        val batteryManager = getSystemService(BATTERY_SERVICE) as BatteryManager
        return batteryManager.isCharging
    }
}
