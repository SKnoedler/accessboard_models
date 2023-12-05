import 'package:accessboard_models/src/models/target_group.dart/target_group.dart';

class StateTargetGroup {
  final bool isActive;
  final TargetGroup targetGroup;

  StateTargetGroup({
    required this.isActive,
    required this.targetGroup,
  });

  factory StateTargetGroup.fromJson(Map<String, dynamic> json) {
    return StateTargetGroup(
      isActive: json['isActive'] as bool,
      targetGroup: TargetGroup.fromJson(json['targetGroup']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isActive': isActive,
      'targetGroup': targetGroup.toJson(),
    };
  }

  StateTargetGroup copyWith({
    bool? isActive,
    TargetGroup? targetGroup,
  }) {
    return StateTargetGroup(
      isActive: isActive ?? this.isActive,
      targetGroup: targetGroup ?? this.targetGroup,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StateTargetGroup &&
        other.isActive == isActive &&
        other.targetGroup == targetGroup;
  }

  @override
  int get hashCode => isActive.hashCode ^ targetGroup.hashCode;
}
