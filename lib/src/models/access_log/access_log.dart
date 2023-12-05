import 'package:accessboard_models/src/models/access_log/year_month.dart';

/// Represents an access log entry.
class AccessLog {
  final String accessLogId;
  final String deviceId;
  final YearMonth yearMonth;

  /// Constructs an [AccessLog] instance.
  ///
  /// The [accessLogId] is the unique identifier of the access log.
  /// The [deviceId] is the identifier of the device.
  /// The [yearMonth] is the year and month of the access log.
  AccessLog({
    required this.accessLogId,
    required this.deviceId,
    required this.yearMonth,
  });

  /// Constructs an [AccessLog] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing an access log.
  factory AccessLog.fromJson(Map<String, dynamic> json) {
    return AccessLog(
      accessLogId: json['accessLogId'],
      deviceId: json['deviceId'],
      yearMonth: YearMonth.fromJson(json['yearMonth']),
    );
  }

  /// Converts the [AccessLog] instance to a JSON map.
  ///
  /// Returns a JSON map representing the access log.
  Map<String, dynamic> toJson() {
    return {
      'accessLogId': accessLogId,
      'deviceId': deviceId,
      'yearMonth': yearMonth.toJson(),
    };
  }
}
