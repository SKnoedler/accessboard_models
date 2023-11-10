class PageMeta {
  final DateTime createdAt;
  final DateTime? releasedAt;
  final DateTime? updatedAt;

  PageMeta({
    required this.createdAt,
    this.releasedAt,
    this.updatedAt,
  });

  factory PageMeta.fromJson(Map<String, dynamic> json) {
    return PageMeta(
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

  PageMeta copyWith({
    DateTime? createdAt,
    DateTime? releasedAt,
    DateTime? updatedAt,
  }) {
    return PageMeta(
      createdAt: createdAt ?? this.createdAt,
      releasedAt: releasedAt ?? this.releasedAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
