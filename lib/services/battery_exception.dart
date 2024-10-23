/// A custom exception class for handling battery-related errors.
///
/// The [BatteryException] class implements the [Exception] interface and
/// provides a way to represent errors that occur in battery-related operations.
///
/// Properties:
/// - `message`: A descriptive error message providing details about the exception.
class BatteryException implements Exception {
  final String message;
  BatteryException(this.message);

  @override
  String toString() => 'BatteryException: $message';
}
