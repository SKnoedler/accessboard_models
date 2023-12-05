import 'package:accessboard_models/src/models/blog_post/blog_post_comment_question.dart';
import 'package:accessboard_models/src/models/blog_post/feed_item_meta.dart';
import 'package:accessboard_models/src/models/design/custom_design.dart';
import 'package:accessboard_models/src/models/feed/feed_item.dart';
import 'package:accessboard_models/src/models/localized_string/localized_string.dart';
import 'package:accessboard_models/src/models/target_group.dart/target_group.dart';

class BlogPost extends FeedItem {
  final String blogPostId;
  final LocalizedString title;
  final LocalizedString description;
  final String imageUrl;
  final String htmlContent;
  final FeedItemMeta meta;
  final List<dynamic>? quillDocData;
  final BlogPostCommentQuestion? feedbackQuestion;
  final CustomDesign? customDesign;
  final List<TargetGroup> targetGroups;
  final List<String> commentIds;

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
    this.commentIds = const [],
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
          ? BlogPostCommentQuestion.fromJson(json['feedbackQuestion'])
          : null,
      customDesign: json['customDesign'] != null
          ? CustomDesign.fromJson(json['customDesign'])
          : null,
      commentIds: json['commentIds'] as List<String>,
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
      'commentIds': commentIds,
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
    BlogPostCommentQuestion? feedbackQuestion,
    CustomDesign? customDesign,
    List<Map<String, Object>>? quillDocData,
    List<TargetGroup>? targetGroups,
    List<String>? commentIds,
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
      commentIds: commentIds ?? this.commentIds,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BlogPost &&
        other.blogPostId == blogPostId &&
        other.title == title &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.htmlContent == htmlContent &&
        other.meta == meta &&
        other.quillDocData == quillDocData &&
        other.feedbackQuestion == feedbackQuestion &&
        other.customDesign == customDesign &&
        other.targetGroups == targetGroups;
  }

  @override
  int get hashCode {
    return blogPostId.hashCode ^
        title.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        htmlContent.hashCode ^
        meta.hashCode ^
        quillDocData.hashCode ^
        feedbackQuestion.hashCode ^
        customDesign.hashCode ^
        targetGroups.hashCode;
  }
}
