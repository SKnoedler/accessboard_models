import 'package:accessboard_models/models/blog_post/blog_post_meta.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BlogPostMeta', () {
    test('toJson returns a valid JSON object', () {
      final meta = BlogPostMeta(
        createdAt: DateTime(2022, 1, 1),
        isReleaseConfirmed: true,
        releaseAt: DateTime(2022, 1, 2),
        updatedAt: DateTime(2022, 1, 3),
        validUntil: DateTime(2022, 1, 4),
      );

      final json = meta.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['createdAt'], '2022-01-01T00:00:00.000');
      expect(json['isReleaseConfirmed'], true);
      expect(json['releaseAt'], '2022-01-02T00:00:00.000');
      expect(json['updatedAt'], '2022-01-03T00:00:00.000');
      expect(json['validUntil'], '2022-01-04T00:00:00.000');
    });

    test('fromJson returns a valid BlogPostMeta object', () {
      final json = {
        'createdAt': '2022-01-01T00:00:00.000',
        'isReleaseConfirmed': true,
        'releaseAt': '2022-01-02T00:00:00.000',
        'updatedAt': '2022-01-03T00:00:00.000',
        'validUntil': '2022-01-04T00:00:00.000',
      };

      final meta = BlogPostMeta.fromJson(json);

      expect(meta.createdAt, DateTime(2022, 1, 1));
      expect(meta.isReleaseConfirmed, true);
      expect(meta.releaseAt, DateTime(2022, 1, 2));
      expect(meta.updatedAt, DateTime(2022, 1, 3));
      expect(meta.validUntil, DateTime(2022, 1, 4));
    });
  });
}
