class TargetGroup {
  final String groupId;
  final String name;

  TargetGroup({
    required this.groupId,
    required this.name,
  });

  factory TargetGroup.fromJson(Map<String, dynamic> json) {
    return TargetGroup(
      groupId: json['groupId'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'groupId': groupId,
      'name': name,
    };
  }
}
