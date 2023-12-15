import 'package:accessboard_models/src/models/design/custom_design.dart';
import 'package:accessboard_models/src/models/design/design_enums.dart';
import 'package:test/test.dart';

void main() {
  final expectedObject = DartCustomDesign(
    primaryColor: 4294198070,
    secondaryColor: 4280391411,
    tertiaryColor: 4294961979,
    borderRadiusEnum: BorderRadiusEnum.small,
    borderEnum: BorderEnum.medium,
    shadowEnum: ShadowEnum.none,
  );

  final expectedJson = {
    'primaryColor': 4294198070,
    'secondaryColor': 4280391411,
    'tertiaryColor': 4294961979,
    'borderRadiusEnum': 'small',
    'borderEnum': 'medium',
    'shadowEnum': 'none'
  };

  group('CustomDesign', () {
    test('fromJson() should correctly deserialize JSON', () {
      final result = DartCustomDesign.fromJson(expectedJson);

      expect(result, expectedObject);
    });

    test('toJson() should correctly serialize to JSON', () {
      final result = expectedObject.toJson();
      print(result);

      expect(result, expectedJson);
    });
  });
}
