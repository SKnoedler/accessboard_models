import 'package:accessboard_models/src/models/design/custom_design.dart';
import 'package:accessboard_models/src/models/design/design_enums.dart';
import 'package:test/test.dart';

void main() {
  final expectedJson = {
    'primaryColor': 123,
    'secondaryColor': 456,
    'tertiaryColor': 789,
    'borderRadiusEnum': 'small',
    'borderEnum': 'medium',
    'shadowEnum': 'none',
  };

  final expectedObject = CustomDesign(
    primaryColor: 123,
    secondaryColor: 456,
    tertiaryColor: 789,
    borderRadiusEnum: BorderRadiusEnum.small,
    borderEnum: BorderEnum.medium,
    shadowEnum: ShadowEnum.none,
  );

  group('CustomDesign', () {
    test('fromJson() should correctly deserialize JSON', () {
      final result = CustomDesign.fromJson(expectedJson);

      expect(result, expectedObject);
    });

    test('toJson() should correctly serialize to JSON', () {
      final result = expectedObject.toJson();

      expect(result, expectedJson);
    });
  });
}
