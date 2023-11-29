import 'package:accessboard_models/src/models/target_group.dart/target_group.dart';

class WidgetSwitch {
  final String widgetSwitchId;
  final int placeHolderId;
  final List<StateTargetGroup> stateTargetGroups;

  WidgetSwitch({
    required this.widgetSwitchId,
    required this.placeHolderId,
    required this.stateTargetGroups,
  });

  factory WidgetSwitch.fromJson(Map<String, dynamic> json) {
    var stateTargetGroupsJson = json['stateTargetGroups'] as List;
    List<StateTargetGroup> stateTargetGroups = stateTargetGroupsJson
        .map((item) => StateTargetGroup.fromJson(item))
        .toList();

    return WidgetSwitch(
      widgetSwitchId: json['widgetSwitchId'] as String,
      placeHolderId: json['placeHolderId'] as int,
      stateTargetGroups: stateTargetGroups,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'widgetSwitchId': widgetSwitchId,
      'placeHolderId': placeHolderId,
      'stateTargetGroups':
          stateTargetGroups.map((item) => item.toJson()).toList(),
    };
  }

  WidgetSwitch copyWith({
    String? widgetSwitchId,
    int? placeHolderId,
    List<StateTargetGroup>? stateTargetGroups,
  }) {
    return WidgetSwitch(
      widgetSwitchId: widgetSwitchId ?? this.widgetSwitchId,
      placeHolderId: placeHolderId ?? this.placeHolderId,
      stateTargetGroups: stateTargetGroups ?? this.stateTargetGroups,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WidgetSwitch &&
        other.widgetSwitchId == widgetSwitchId &&
        other.placeHolderId == placeHolderId &&
        other.stateTargetGroups == stateTargetGroups;
  }

  @override
  int get hashCode =>
      widgetSwitchId.hashCode ^
      placeHolderId.hashCode ^
      stateTargetGroups.hashCode;
}

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
