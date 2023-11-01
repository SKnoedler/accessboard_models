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
  final DateTime createdAt;
  final DateTime? updatedAt;

  FeedbackItem({
    required this.feedbackItemId,
    required this.feedbackContent,
    this.isFeedbackReplyRead = false,
    this.feedbackReply,
    required this.createdAt,
    this.updatedAt,
  });

  factory FeedbackItem.fromJson(Map<String, dynamic> json) {
    return FeedbackItem(
      feedbackItemId: json['feedbackItemId'] as String,
      isFeedbackReplyRead: json['isFeedbackReplyRead'] as bool,
      feedbackContent: json['feedbackContent'] as String,
      feedbackReply: json['feedbackReply'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'feedbackItemId': feedbackItemId,
      'feedbackContent': feedbackContent,
      'isFeedbackReplyRead': isFeedbackReplyRead,
      'feedbackReply': feedbackReply,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  FeedbackItem copyWith({
    String? feedbackItemId,
    String? feedbackContent,
    String? feedbackReply,
    bool? isFeedbackReplyRead,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return FeedbackItem(
      feedbackItemId: feedbackItemId ?? this.feedbackItemId,
      feedbackContent: feedbackContent ?? this.feedbackContent,
      feedbackReply: feedbackReply ?? this.feedbackReply,
      isFeedbackReplyRead: isFeedbackReplyRead ?? this.isFeedbackReplyRead,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  FeedbackItem replyToFeedback({
    required String feedbackReply,
  }) {
    return FeedbackItem(
      feedbackItemId: feedbackItemId,
      feedbackContent: feedbackContent,
      feedbackReply: feedbackReply,
      isFeedbackReplyRead: isFeedbackReplyRead,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
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
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode =>
      isFeedbackReplyRead.hashCode ^
      feedbackItemId.hashCode ^
      feedbackContent.hashCode ^
      feedbackReply.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
