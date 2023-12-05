import 'package:accessboard_models/src/models/switch/state_target_group.dart';

class WidgetSwitch {
  final int placeholderId;
  final List<StateTargetGroup> stateTargetGroups;

  WidgetSwitch({
    required this.placeholderId,
    required this.stateTargetGroups,
  });

  factory WidgetSwitch.fromJson(Map<String, dynamic> json) {
    var stateTargetGroupsJson = json['stateTargetGroups'] as List;
    List<StateTargetGroup> stateTargetGroups = stateTargetGroupsJson
        .map((item) => StateTargetGroup.fromJson(item))
        .toList();

    return WidgetSwitch(
      placeholderId: json['placeholderId'] as int,
      stateTargetGroups: stateTargetGroups,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'placeholderId': placeholderId,
      'stateTargetGroups':
          stateTargetGroups.map((item) => item.toJson()).toList(),
    };
  }

  WidgetSwitch copyWith({
    String? widgetSwitchId,
    int? placeholderId,
    List<StateTargetGroup>? stateTargetGroups,
  }) {
    return WidgetSwitch(
      placeholderId: placeholderId ?? this.placeholderId,
      stateTargetGroups: stateTargetGroups ?? this.stateTargetGroups,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WidgetSwitch &&
        other.placeholderId == placeholderId &&
        _listEquals(other.stateTargetGroups, stateTargetGroups);
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
  int get hashCode => placeholderId.hashCode ^ stateTargetGroups.hashCode;
}
