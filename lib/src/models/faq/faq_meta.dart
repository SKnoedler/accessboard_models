class FaqMeta {
  final DateTime createdAt;
  final DateTime? releasedAt;
  final DateTime? updatedAt;

  FaqMeta({
    required this.createdAt,
    this.releasedAt,
    this.updatedAt,
  });

  factory FaqMeta.fromJson(Map<String, dynamic> json) {
    return FaqMeta(
      createdAt: DateTime.parse(json['createdAt']),
      releasedAt: json['releasedAt'] != null
          ? DateTime.parse(json['releasedAt'])
          : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt.toIso8601String(),
      'releasedAt': releasedAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
