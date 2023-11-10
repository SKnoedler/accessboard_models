class ItemMeta {
  final DateTime createdAt;
  final DateTime? releasedAt;
  final DateTime? updatedAt;
  final DateTime? validUntil;

  ItemMeta({
    required this.createdAt,
    this.releasedAt,
    this.updatedAt,
    this.validUntil,
  });

  factory ItemMeta.fromJson(Map<String, dynamic> json) {
    return ItemMeta(
      createdAt: DateTime.parse(json['createdAt']),
      releasedAt: json['releasedAt'] != null
          ? DateTime.parse(json['releasedAt'])
          : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      validUntil: json['validUntil'] != null
          ? DateTime.parse(json['validUntil'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt.toIso8601String(),
      'releasedAt': releasedAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'validUntil': validUntil?.toIso8601String(),
    };
  }

  ItemMeta copyWith({
    DateTime? createdAt,
    DateTime? releasedAt,
    DateTime? updatedAt,
    DateTime? validUntil,
  }) {
    return ItemMeta(
      createdAt: createdAt ?? this.createdAt,
      releasedAt: releasedAt ?? this.releasedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      validUntil: validUntil ?? this.validUntil,
    );
  }
}
