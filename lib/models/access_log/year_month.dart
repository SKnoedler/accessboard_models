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
}
