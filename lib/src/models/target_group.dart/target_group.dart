class TargetGroup {
  final String id;
  final String name;

  TargetGroup({
    required this.id,
    required this.name,
  });

  factory TargetGroup.fromJson(Map<String, dynamic> json) {
    return TargetGroup(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  TargetGroup copyWith({
    String? id,
    String? name,
  }) {
    return TargetGroup(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TargetGroup && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
