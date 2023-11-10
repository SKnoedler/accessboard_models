import 'package:accessboard_models/src/models/feedback/feedback_item_meta.dart';

/// feedback model unqiue for each device id
/// the feedback model is retrieved from the database
/// user can create a feedbackItem and admin use can update that feedbackitem
class Feedback {
  final String feedbackId;
  final String deviceId;
  final List<FeedbackItem> feedbackItems;

  Feedback({
    required this.feedbackId,
    required this.deviceId,
    this.feedbackItems = const [],
  });

  factory Feedback.fromJson(Map<String, dynamic> json) {
    var feedbackItemsJson = json['feedbackItems'] as List;
    List<FeedbackItem> feedbackItems =
        feedbackItemsJson.map((item) => FeedbackItem.fromJson(item)).toList();

    return Feedback(
      feedbackId: json['feedbackId'] as String,
      deviceId: json['deviceId'] as String,
      feedbackItems: feedbackItems,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'feedbackId': feedbackId,
      'deviceId': deviceId,
      'feedbackItems': feedbackItems.map((item) => item.toJson()).toList(),
    };
  }

  bool get hasUnreadReplies => false;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Feedback &&
        other.feedbackId == feedbackId &&
        other.deviceId == deviceId &&
        other.feedbackItems == feedbackItems;
  }

  @override
  int get hashCode =>
      feedbackId.hashCode ^ deviceId.hashCode ^ feedbackItems.hashCode;
}

// created by user and updated by admin
class FeedbackItem {
  final String feedbackItemId;
  final String feedbackContent;
  final String? feedbackReply;
  final bool isFeedbackReplyRead;
  final FeedbackItemMeta meta;

  FeedbackItem({
    required this.feedbackItemId,
    required this.feedbackContent,
    this.isFeedbackReplyRead = false,
    this.feedbackReply,
    required this.meta,
  });

  factory FeedbackItem.fromJson(Map<String, dynamic> json) {
    return FeedbackItem(
      feedbackItemId: json['feedbackItemId'] as String,
      isFeedbackReplyRead: json['isFeedbackReplyRead'] as bool,
      feedbackContent: json['feedbackContent'] as String,
      feedbackReply: json['feedbackReply'] as String?,
      meta:
          FeedbackItemMeta.fromJson(json['createdAt'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'feedbackItemId': feedbackItemId,
      'feedbackContent': feedbackContent,
      'isFeedbackReplyRead': isFeedbackReplyRead,
      'feedbackReply': feedbackReply,
      'meta': meta.toJson(),
    };
  }

  FeedbackItem copyWith({
    String? feedbackItemId,
    String? feedbackContent,
    String? feedbackReply,
    bool? isFeedbackReplyRead,
    DateTime? createdAt,
    DateTime? updatedAt,
    FeedbackItemMeta? meta,
  }) {
    return FeedbackItem(
      feedbackItemId: feedbackItemId ?? this.feedbackItemId,
      feedbackContent: feedbackContent ?? this.feedbackContent,
      feedbackReply: feedbackReply ?? this.feedbackReply,
      isFeedbackReplyRead: isFeedbackReplyRead ?? this.isFeedbackReplyRead,
      meta: meta ?? this.meta,
    );
  }

  // used by admin user: reply
  FeedbackItem replyToFeedback({
    required String feedbackReply,
  }) {
    return FeedbackItem(
      feedbackItemId: feedbackItemId,
      feedbackContent: feedbackContent,
      feedbackReply: feedbackReply,
      isFeedbackReplyRead: isFeedbackReplyRead,
      meta: meta.copyWith(updatedAt: DateTime.now()),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FeedbackItem &&
        other.isFeedbackReplyRead == isFeedbackReplyRead &&
        other.feedbackItemId == feedbackItemId &&
        other.feedbackContent == feedbackContent &&
        other.feedbackReply == feedbackReply &&
        other.meta == meta;
  }

  @override
  int get hashCode =>
      isFeedbackReplyRead.hashCode ^
      feedbackItemId.hashCode ^
      feedbackContent.hashCode ^
      feedbackReply.hashCode ^
      meta.hashCode;
}
