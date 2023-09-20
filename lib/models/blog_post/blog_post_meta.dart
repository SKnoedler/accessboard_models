class BlogPostMeta {
  final DateTime createdAt;
  final bool isReleaseConfirmed;
  final DateTime releaseAt;
  final DateTime? updatedAt;
  final DateTime? validUntil;

  BlogPostMeta({
    required this.createdAt,
    required this.isReleaseConfirmed,
    required this.releaseAt,
    this.updatedAt,
    this.validUntil,
  });

  factory BlogPostMeta.fromJson(Map<String, dynamic> json) {
    return BlogPostMeta(
      createdAt: DateTime.parse(json['createdAt']),
      isReleaseConfirmed: json['isReleaseConfirmed'],
      releaseAt: DateTime.parse(json['releaseAt']),
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
      'isReleaseConfirmed': isReleaseConfirmed,
      'releaseAt': releaseAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'validUntil': validUntil?.toIso8601String(),
    };
  }
}
