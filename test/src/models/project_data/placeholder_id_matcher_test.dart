import 'package:accessboard_models/src/models/project_data/placeholder_id_matcher.dart';
import 'package:test/test.dart';

void main() {
  final expectedObject = PlaceholderIdMatcher(
    placeholderId: 123,
    itemId: '23',
    targetGroupIds: ['1', '2'],
  );

  final expectedJson = {
    'placeholderId': 123,
    'itemId': '23',
    'targetGroupIds': ['1', '2'],
  };

  group('PlaceholderIdMatcher', () {
    test('fromJson() should correctly deserialize JSON', () {
      final result = PlaceholderIdMatcher.fromJson(expectedJson);

      expect(result.placeholderId, 123);
      expect(result.itemId, '23');
      expect(result.targetGroupIds, ['1', '2']);
      expect(result, expectedObject);
    });

    test('toJson() should correctly serialize to JSON', () {
      final result = expectedObject.toJson();

      expect(result['placeholderId'], 123);
      expect(result['itemId'], '23');
      expect(result['targetGroupIds'], ['1', '2']);
      expect(result, expectedJson);
    });

    test('copyWith() should create a copy with the specified fields', () {
      final item = PlaceholderIdMatcher(
        placeholderId: 123,
        itemId: '23',
        targetGroupIds: ['1', '2'],
      );

      final copy = item.copyWith(
        placeholderId: 456,
        itemId: '223',
        targetGroupIds: ['3', '4'],
      );

      expect(copy.placeholderId, 456);
      expect(copy.itemId, '223');
      expect(copy.targetGroupIds, ['3', '4']);
    });

    test('== should correctly compare two objects', () {
      final item1 = PlaceholderIdMatcher(
        placeholderId: 123,
        itemId: '23',
        targetGroupIds: ['1', '2'],
      );

      final item2 = PlaceholderIdMatcher(
        placeholderId: 123,
        itemId: '23',
        targetGroupIds: ['1', '2'],
      );

      final item3 = PlaceholderIdMatcher(
        placeholderId: 456,
        itemId: '223',
        targetGroupIds: ['3', '4'],
      );

      expect(item1 == item2, true);
      expect(item1 == item3, false);
    });

    test('hashCode should return the correct hash code', () {
      final item = PlaceholderIdMatcher(
        placeholderId: 123,
        itemId: '23',
        targetGroupIds: ['1', '2'],
      );

      final hashCode = item.hashCode;

      expect(hashCode, isA<int>());
    });
  });
}
