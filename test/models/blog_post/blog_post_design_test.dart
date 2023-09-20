import 'package:accessboard_models/models/blog_post/blog_post_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BlogPostDesign', () {
    test('toJson returns a valid JSON object', () {
      final design = BlogPostDesign(
        primaryColor: const Color(0xfff44336),
        secondaryColor: const Color(0xff4caf50),
        tertiaryColor: const Color(0xff2196f3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 2, color: Colors.grey.shade300),
        shadow: BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      );

      final json = design.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['primaryColor'], const Color(0xfff44336).value);
      expect(json['secondaryColor'], const Color(0xff4caf50).value);
      expect(json['tertiaryColor'], const Color(0xff2196f3).value);
      expect(json['borderRadius'], 'medium');
      expect(json['border'], 'medium');
      expect(json['shadow'], 'medium');
    });

    test('fromJson returns a valid BlogPostDesign object', () {
      final json = {
        'primaryColor': const Color(0xfff44336).value,
        'secondaryColor': const Color(0xff4caf50).value,
        'tertiaryColor': const Color(0xff2196f3).value,
        'borderRadius': 'medium',
        'border': 'medium',
        'shadow': 'medium',
      };

      final design = BlogPostDesign.fromJson(json);

      expect(design.primaryColor, const Color(0xfff44336));
      expect(design.secondaryColor, const Color(0xff4caf50));
      expect(design.tertiaryColor, const Color(0xff2196f3));
      expect(design.borderRadius, BorderRadius.circular(8));
      expect(design.border, Border.all(width: 2, color: Colors.grey.shade300));
      expect(
          design.shadow,
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ));
    });
  });
}
