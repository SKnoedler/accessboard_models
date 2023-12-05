import 'package:accessboard_models/src/models/project_data/item_target_group_ids.dart';
import 'package:test/test.dart';

void main() {
  final expectedObject = ItemTargetGroupIds(
    itemId: '23',
    targetGroupIds: ['1', '2'],
  );

  final expectedJson = {
    'itemId': '23',
    'targetGroupIds': ['1', '2'],
  };
  group('ItemTargetGroupIds', () {
    test('fromJson() should correctly deserialize JSON', () {
      final result = ItemTargetGroupIds.fromJson(expectedJson);

      expect(result.itemId, '23');
      expect(result.targetGroupIds, ['1', '2']);
      expect(result, expectedObject);
    });

    test('toJson() should correctly serialize to JSON', () {
      final result = expectedObject.toJson();

      expect(result['itemId'], '23');
      expect(result['targetGroupIds'], ['1', '2']);
      expect(result, expectedJson);
    });

    test('copyWith() should create a copy with the specified fields', () {
      final item = ItemTargetGroupIds(
        itemId: '23',
        targetGroupIds: ['1', '2'],
      );

      final copy = item.copyWith(itemId: '223', targetGroupIds: ['3', '4']);

      expect(copy.itemId, '223');
      expect(copy.targetGroupIds, ['3', '4']);
    });

    test('== should correctly compare two objects', () {
      final item1 = ItemTargetGroupIds(
        itemId: '23',
        targetGroupIds: ['1', '2'],
      );

      final item2 = ItemTargetGroupIds(
        itemId: '23',
        targetGroupIds: ['1', '2'],
      );

      final item3 = ItemTargetGroupIds(
        itemId: '223',
        targetGroupIds: ['3', '4'],
      );

      expect(item1 == item2, true);
      expect(item1 == item3, false);
    });

    test('hashCode should return the correct hash code', () {
      final item = ItemTargetGroupIds(
        itemId: '23',
        targetGroupIds: ['1', '2'],
      );

      final hashCode = item.hashCode;

      expect(hashCode, isA<int>());
    });
  });
}
