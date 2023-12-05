import 'package:accessboard_models/src/models/target_group.dart/target_group.dart';
import 'package:test/test.dart';

void main() {
  final expectedObject = TargetGroup(
    groupId: '1',
    name: 'Group 1',
  );

  final expectedJson = {
    'groupId': '1',
    'name': 'Group 1',
  };

  group('TargetGroup', () {
    test('fromJson() should correctly deserialize JSON', () {
      final result = TargetGroup.fromJson(expectedJson);

      expect(result.groupId, '1');
      expect(result.name, 'Group 1');
      expect(result, expectedObject);
    });

    test('toJson() should correctly serialize to JSON', () {
      final result = expectedObject.toJson();

      expect(result['groupId'], '1');
      expect(result['name'], 'Group 1');
      expect(result, expectedJson);
    });

    test('copyWith() should create a copy with the specified fields', () {
      final item = TargetGroup(
        groupId: '1',
        name: 'Group 1',
      );

      final copy = item.copyWith(groupId: '2', name: 'Group 2');

      expect(copy.groupId, '2');
      expect(copy.name, 'Group 2');
    });

    test('== should correctly compare two objects', () {
      final item1 = TargetGroup(
        groupId: '1',
        name: 'Group 1',
      );

      final item2 = TargetGroup(
        groupId: '1',
        name: 'Group 1',
      );

      final item3 = TargetGroup(
        groupId: '2',
        name: 'Group 2',
      );

      expect(item1 == item2, true);
      expect(item1 == item3, false);
    });

    test('hashCode should return the correct hash code', () {
      final item = TargetGroup(
        groupId: '1',
        name: 'Group 1',
      );

      final hashCode = item.hashCode;

      expect(hashCode, isA<int>());
    });
  });
}
