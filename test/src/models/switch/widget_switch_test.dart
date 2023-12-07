import 'dart:convert';

import 'package:accessboard_models/src/models/switch/state_target_group.dart';
import 'package:accessboard_models/src/models/switch/widget_switch.dart';
import 'package:accessboard_models/src/models/target_group.dart/target_group.dart';
import 'package:test/test.dart';

void main() {
  final expectedObject = WidgetSwitch(
    placeholderId: 123,
    stateTargetGroups: [
      StateTargetGroup(
        isActive: true,
        targetGroup: TargetGroup(
          id: '1',
          name: 'Group 1',
        ),
      ),
      StateTargetGroup(
        isActive: false,
        targetGroup: TargetGroup(
          id: '2',
          name: 'Group 2',
        ),
      ),
    ],
  );

  final expectedJson = {
    "placeholderId": 123,
    "stateTargetGroups": [
      {
        "isActive": true,
        "targetGroup": {"groupId": "1", "name": "Group 1"}
      },
      {
        "isActive": false,
        "targetGroup": {"groupId": "2", "name": "Group 2"}
      }
    ]
  };

  group('WidgetSwitch', () {
    test('fromJson() should correctly deserialize JSON', () {
      final result = WidgetSwitch.fromJson(expectedJson);

      print(json.encode(result.toJson()));

      expect(result, expectedObject);
    });

    test('toJson() should correctly serialize to JSON', () {
      final result = expectedObject.toJson();

      expect(result, expectedJson);
    });
  });
}
