/// Represents a specific year and month.
///
/// This class extends the [DateTime] class and provides additional functionality for working with year and month values.
///
/// The [YearMonth] class is immutable, meaning its values cannot be changed after it is created.
///
/// Example usage:
/// ```dart
/// final yearMonth = YearMonth.now();
/// print(yearMonth.year); // Output: current year
/// print(yearMonth.month); // Output: current month
/// print(yearMonth.toString()); // Output: "YYYY-MM"
/// ```
class YearMonth extends DateTime {
  YearMonth._internal(int year, int month) : super.utc(year, month, 1);

  factory YearMonth.now() {
    final now = DateTime.now().toUtc();
    return YearMonth._internal(now.year, now.month);
  }

  factory YearMonth.fromJson(Map<String, dynamic> json) {
    final year = json['year'] as int;
    final month = json['month'] as int;
    return YearMonth._internal(year, month);
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'month': month,
    };
  }

  @override
  String toString() {
    return '$year-$month';
  }
}
