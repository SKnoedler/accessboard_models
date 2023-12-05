class ItemTargetGroupIds {
  final String itemId;
  final List<String>? targetGroupIds;

  ItemTargetGroupIds({
    required this.itemId,
    this.targetGroupIds,
  });

  factory ItemTargetGroupIds.fromJson(Map<String, dynamic> json) {
    return ItemTargetGroupIds(
      itemId: json['itemId'] as String,
      targetGroupIds: (json['targetGroupIds'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'itemId': itemId,
      'targetGroupIds': targetGroupIds,
    };
  }

  ItemTargetGroupIds copyWith({
    String? itemId,
    List<String>? targetGroupIds,
  }) {
    return ItemTargetGroupIds(
      itemId: itemId ?? this.itemId,
      targetGroupIds: targetGroupIds ?? this.targetGroupIds,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemTargetGroupIds &&
        other.itemId == itemId &&
        _listEquals(other.targetGroupIds, targetGroupIds);
  }

  bool _listEquals<T>(List<T>? a, List<T>? b) {
    if (a == null) return b == null;
    if (b == null || a.length != b.length) return false;
    if (identical(a, b)) return true;
    for (int index = 0; index < a.length; index++) {
      if (a[index] != b[index]) return false;
    }
    return true;
  }

  @override
  int get hashCode => itemId.hashCode ^ targetGroupIds.hashCode;
}
