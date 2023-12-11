import 'package:accessboard_models/src/models/design/design_enums.dart';
import 'package:accessboard_models/src/models/design/flutter_custom_design.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

void main() {
  final expectedObject = FlutterCustomDesign(
    primaryColor: Colors.red,
    secondaryColor: Colors.blue,
    tertiaryColor: Colors.red,
    borderRadiusEnum: BorderRadiusEnum.small,
    borderEnum: BorderEnum.medium,
    shadowEnum: ShadowEnum.none,
  );

  final expectedJson = {
    'primaryColor': 123,
    'secondaryColor': 456,
    'tertiaryColor': 789,
    'borderRadiusEnum': 'small',
    'borderEnum': 'medium',
    'shadowEnum': 'none',
  };

  group('CustomDesign', () {
    test('fromJson() should correctly deserialize JSON', () {
      final result = FlutterCustomDesign.fromJson(expectedJson);

      expect(result, expectedObject);
    });

    test('toJson() should correctly serialize to JSON', () {
      final result = expectedObject.toJson();

      expect(result, expectedJson);
    });
  });
}
