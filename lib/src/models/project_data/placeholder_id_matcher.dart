class PlaceholderIdMatcher {
  final int placeholderId;
  final String itemId;
  final List<String>? targetGroupIds;

  PlaceholderIdMatcher({
    required this.placeholderId,
    required this.itemId,
    this.targetGroupIds,
  });

  factory PlaceholderIdMatcher.fromJson(Map<String, dynamic> json) {
    return PlaceholderIdMatcher(
      placeholderId: json['placeholderId'],
      itemId: json['itemId'],
      targetGroupIds: json['targetGroupIds']?.cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'placeholderId': placeholderId,
      'itemId': itemId,
      'targetGroupIds': targetGroupIds,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PlaceholderIdMatcher &&
        other.placeholderId == placeholderId &&
        other.itemId == itemId &&
        _listEquals(other.targetGroupIds, targetGroupIds);
  }

  @override
  int get hashCode =>
      placeholderId.hashCode ^ itemId.hashCode ^ targetGroupIds.hashCode;

  PlaceholderIdMatcher copyWith({
    int? placeholderId,
    String? itemId,
    List<String>? targetGroupIds,
  }) {
    return PlaceholderIdMatcher(
      placeholderId: placeholderId ?? this.placeholderId,
      itemId: itemId ?? this.itemId,
      targetGroupIds: targetGroupIds ?? this.targetGroupIds,
    );
  }
}

bool _listEquals<T>(List<T>? a, List<T>? b) {
  if (a == null) {
    return b == null;
  }
  if (b == null || a.length != b.length) {
    return false;
  }
  if (identical(a, b)) {
    return true;
  }
  for (int index = 0; index < a.length; index += 1) {
    if (a[index] != b[index]) {
      return false;
    }
  }
  return true;
}
