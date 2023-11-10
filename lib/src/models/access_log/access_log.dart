import 'package:accessboard_models/src/models/access_log/year_month.dart';

class AccessLog {
  final String accessLogId;
  final String deviceId;
  final YearMonth yearMonth;

  AccessLog({
    required this.accessLogId,
    required this.deviceId,
    required this.yearMonth,
  });

  factory AccessLog.fromJson(Map<String, dynamic> json) {
    return AccessLog(
      accessLogId: json['accessLogId'],
      deviceId: json['deviceId'],
      yearMonth: YearMonth.fromJson(json['yearMonth']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessLogId': accessLogId,
      'deviceId': deviceId,
      'yearMonth': yearMonth.toJson(),
    };
  }
}
