import 'package:accessboard_models/models/blog_post/blog_post_model.dart';
import 'package:accessboard_models/models/blog_post/feed_item_meta.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BlogPost', () {
    test('toJson returns a valid JSON object', () {
      final post = BlogPost(
        quillDocData: [],
        blogPostId: '123',
        title: 'Test Post',
        description: 'This is a test post',
        imageUrl: 'https://example.com/image.jpg',
        htmlContent: '<p>This is a test post</p>',
        meta: FeedItemMeta(
          createdAt: DateTime(2022, 1, 1),
          releasedAt: DateTime(2022, 1, 2),
          updatedAt: DateTime(2022, 1, 3),
          validUntil: DateTime(2022, 1, 4),
        ),
      );

      final json = post.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['blogPostId'], '123');
      expect(json['title'], 'Test Post');
      expect(json['description'], 'This is a test post');
      expect(json['imageUrl'], 'https://example.com/image.jpg');
      expect(json['htmlContent'], '<p>This is a test post</p>');
      expect(json['meta'], isA<Map<String, dynamic>>());
    });

    test('fromJson returns a valid BlogPost object', () {
      final json = {
        'blogPostId': '123',
        'title': 'Test Post',
        'description': 'This is a test post',
        'imageUrl': 'https://example.com/image.jpg',
        'htmlContent': '<p>This is a test post</p>',
        'meta': {
          'createdAt': '2022-01-01T00:00:00.000',
          'isReleaseConfirmed': true,
          'releaseAt': '2022-01-02T00:00:00.000',
          'updatedAt': '2022-01-03T00:00:00.000',
          'validUntil': '2022-01-04T00:00:00.000',
        },
      };

      final post = BlogPost.fromJson(json);

      expect(post.blogPostId, '123');
      expect(post.title, 'Test Post');
      expect(post.description, 'This is a test post');
      expect(post.imageUrl, 'https://example.com/image.jpg');
      expect(post.htmlContent, '<p>This is a test post</p>');
      expect(post.meta, isA<FeedItemMeta>());
    });

    test('isUnpublished returns true if isReleaseConfirmed is false', () {
      final post = BlogPost(
        quillDocData: [],
        blogPostId: '123',
        title: 'Test Post',
        description: 'This is a test post',
        imageUrl: 'https://example.com/image.jpg',
        htmlContent: '<p>This is a test post</p>',
        meta: FeedItemMeta(
          createdAt: DateTime(2022, 1, 1),
          releasedAt: DateTime(2022, 1, 2),
          updatedAt: DateTime(2022, 1, 3),
          validUntil: DateTime(2022, 1, 4),
        ),
      );

      expect(post.isUnpublished, true);
    });

    test('isPlanned returns true if releaseAt is in the future', () {
      final post = BlogPost(
        quillDocData: [],
        blogPostId: '123',
        title: 'Test Post',
        description: 'This is a test post',
        imageUrl: 'https://example.com/image.jpg',
        htmlContent: '<p>This is a test post</p>',
        meta: FeedItemMeta(
          createdAt: DateTime(2022, 1, 1),
          releasedAt: DateTime(2099, 1, 2),
          updatedAt: DateTime(2022, 1, 3),
          validUntil: DateTime(2022, 1, 4),
        ),
      );

      expect(post.isPlanned, true);
    });

    test('isExpired returns true if validUntil is in the past', () {
      final post = BlogPost(
        quillDocData: [],
        blogPostId: '123',
        title: 'Test Post',
        description: 'This is a test post',
        imageUrl: 'https://example.com/image.jpg',
        htmlContent: '<p>This is a test post</p>',
        meta: FeedItemMeta(
          createdAt: DateTime(2022, 1, 1),
          releasedAt: DateTime(2022, 1, 2),
          updatedAt: DateTime(2022, 1, 3),
          validUntil: DateTime(2099, 1, 4),
        ),
      );

      expect(post.isExpired, false);

      final expiredPost = BlogPost(
        quillDocData: [],
        blogPostId: '123',
        title: 'Test Post',
        description: 'This is a test post',
        imageUrl: 'https://example.com/image.jpg',
        htmlContent: '<p>This is a test post</p>',
        meta: FeedItemMeta(
          createdAt: DateTime(2022, 1, 1),
          releasedAt: DateTime(2022, 1, 2),
          updatedAt: DateTime(2022, 1, 3),
          validUntil: DateTime(2022, 1, 2),
        ),
      );

      expect(expiredPost.isExpired, true);
    });
  });
}
