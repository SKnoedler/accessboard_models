import 'package:accessboard_models/models/blog_post/blog_post_feedback_question.dart';
import 'package:accessboard_models/models/blog_post/blog_post_meta.dart';
import 'package:accessboard_models/models/design/custom_design.dart';
import 'package:accessboard_models/models/feed/feed_item.dart';

// collection name: blogPosts

class BlogPost extends FeedItem {
  final String blogPostId;
  final String title;
  final String description;
  final String imageUrl;
  final String htmlContent;
  final BlogPostMeta meta;
  final List<dynamic>? quillDocData;
  final BlogPostFeedbackQuestion? feedbackQuestion;
  final CustomDesign? customDesign;

  BlogPost({
    required this.blogPostId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.htmlContent,
    required this.meta,
    this.quillDocData,
    this.feedbackQuestion,
    this.customDesign,
  }) : super(
          id: blogPostId,
          type: typeName,
        );

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      quillDocData: json['quillDocData'] != null
          ? (json['quillDocData'] as List<dynamic>)
          : null,
      blogPostId: json['blogPostId'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      htmlContent: json['htmlContent'],
      meta: BlogPostMeta.fromJson(json['meta']),
      feedbackQuestion: json['feedbackQuestion'] != null
          ? BlogPostFeedbackQuestion.fromJson(json['feedbackQuestion'])
          : null,
      customDesign: json['customDesign'] != null
          ? CustomDesign.fromJson(json['customDesign'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'blogPostId': blogPostId,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'htmlContent': htmlContent,
      'meta': meta.toJson(),
      'feedbackQuestion': feedbackQuestion?.toJson(),
      'customDesign': customDesign?.toJson(),
      'quillDocData': quillDocData,
      'type': type,
    };
  }

  bool get isUnpublished {
    return meta.releasedAt == null;
  }

  bool get isPlanned {
    if (meta.releasedAt == null) return false;
    return meta.releasedAt!.isAfter(DateTime.now());
  }

  bool get isExpired {
    return meta.validUntil != null && meta.validUntil!.isBefore(DateTime.now());
  }

  static const String typeName = 'blog_post';

  BlogPost copyWith({
    String? blogPostId,
    String? title,
    String? description,
    String? imageUrl,
    String? htmlContent,
    BlogPostMeta? meta,
    BlogPostFeedbackQuestion? feedbackQuestion,
    CustomDesign? customDesign,
    List<Map<String, Object>>? quillDocData,
  }) {
    return BlogPost(
      blogPostId: blogPostId ?? this.blogPostId,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      htmlContent: htmlContent ?? this.htmlContent,
      meta: meta ?? this.meta,
      feedbackQuestion: feedbackQuestion ?? this.feedbackQuestion,
      customDesign: customDesign ?? this.customDesign,
      quillDocData: quillDocData ?? this.quillDocData,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogPost &&
          runtimeType == other.runtimeType &&
          blogPostId == other.blogPostId;

  @override
  int get hashCode => blogPostId.hashCode;
}
