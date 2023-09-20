import 'package:accessboard_models/models/blog_post/blog_post_feedback.dart';
import 'package:accessboard_models/models/blog_post/blog_post_meta.dart';

// collection name: blogPosts

class BlogPost {
  final String blogPostId;
  final String title;
  final String description;
  final String imageUrl;
  final String htmlContent;
  final BlogPostMeta meta;
  final BlogPostFeedback? feedbackQuestion;

  BlogPost({
    required this.blogPostId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.htmlContent,
    required this.meta,
    this.feedbackQuestion,
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      blogPostId: json['blogPostId'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      htmlContent: json['htmlContent'],
      meta: BlogPostMeta.fromJson(json['meta']),
      feedbackQuestion: json['feedbackQuestion'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'blogPostId': blogPostId,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'htmlContent': htmlContent,
      'meta': meta.toJson(),
      'feedbackQuestion': feedbackQuestion,
    };
  }

  bool get isUnpublished {
    return !meta.isReleaseConfirmed;
  }

  bool get isPlanned {
    return meta.releaseAt.isAfter(DateTime.now());
  }

  bool get isExpired {
    return meta.validUntil != null && meta.validUntil!.isBefore(DateTime.now());
  }
}
