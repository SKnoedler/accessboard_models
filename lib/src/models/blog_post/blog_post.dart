import 'package:accessboard_models/src/models/blog_post/blog_post_feedback_question.dart';
import 'package:accessboard_models/src/models/blog_post/feed_item_meta.dart';
import 'package:accessboard_models/src/models/design/custom_design.dart';
import 'package:accessboard_models/src/models/feed/feed_item.dart';
import 'package:accessboard_models/src/models/localized_string/localized_string.dart';
import 'package:accessboard_models/src/models/target_group.dart/target_group.dart';

// collection name: blogPosts

class BlogPost extends FeedItem {
  final String blogPostId;
  final LocalizedString title;
  final LocalizedString description;
  final String imageUrl;
  final String htmlContent;
  final FeedItemMeta meta;
  final List<dynamic>? quillDocData;
  final BlogPostFeedbackQuestion? feedbackQuestion;
  final CustomDesign? customDesign;
  final List<TargetGroup> targetGroups;

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
    this.targetGroups = const [],
  }) : super(
          id: blogPostId,
          type: typeName,
        );

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    var targetGroupsJson = json['targetGroups'] as List; // And this line
    List<TargetGroup> targetGroups =
        targetGroupsJson.map((item) => TargetGroup.fromJson(item)).toList();
    return BlogPost(
      targetGroups: targetGroups,
      quillDocData: json['quillDocData'] != null
          ? (json['quillDocData'] as List<dynamic>)
          : null,
      blogPostId: json['blogPostId'],
      title: LocalizedString.fromJson(json['title']),
      description: LocalizedString.fromJson(json['description']),
      imageUrl: json['imageUrl'],
      htmlContent: json['htmlContent'],
      meta: FeedItemMeta.fromJson(json['meta']),
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
      'title': title.toJson(),
      'description': description.toJson(),
      'imageUrl': imageUrl,
      'htmlContent': htmlContent,
      'meta': meta.toJson(),
      'feedbackQuestion': feedbackQuestion?.toJson(),
      'customDesign': customDesign?.toJson(),
      'quillDocData': quillDocData,
      'type': type,
      'targetGroups': targetGroups.map((item) => item.toJson()).toList(),
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

  bool get isActive => !isUnpublished && !isPlanned && !isExpired;

  static const String typeName = 'blog_post';

  BlogPost copyWith({
    String? blogPostId,
    LocalizedString? title,
    LocalizedString? description,
    String? imageUrl,
    String? htmlContent,
    FeedItemMeta? meta,
    BlogPostFeedbackQuestion? feedbackQuestion,
    CustomDesign? customDesign,
    List<Map<String, Object>>? quillDocData,
    List<TargetGroup>? targetGroups,
  }) {
    return BlogPost(
      targetGroups: targetGroups ?? this.targetGroups,
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