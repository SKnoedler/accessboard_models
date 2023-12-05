class TargetGroup {
  final String groupId;
  final String name;

  TargetGroup({
    required this.groupId,
    required this.name,
  });

  factory TargetGroup.fromJson(Map<String, dynamic> json) {
    return TargetGroup(
      groupId: json['groupId'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'groupId': groupId,
      'name': name,
    };
  }

  TargetGroup copyWith({
    String? groupId,
    String? name,
  }) {
    return TargetGroup(
      groupId: groupId ?? this.groupId,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TargetGroup &&
        other.groupId == groupId &&
        other.name == name;
  }

  @override
  int get hashCode => groupId.hashCode ^ name.hashCode;
}
