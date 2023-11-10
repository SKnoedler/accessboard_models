// collection: feedbackAnswers

// one per project
class FeedbackAnswers {
  final String feedbackId;
  final List<FeedbackItem> feedbackItems;

  FeedbackAnswers({
    required this.feedbackId,
    this.feedbackItems = const [],
  });

  factory FeedbackAnswers.fromJson(Map<String, dynamic> json) {
    var feedbackItemsJson = json['feedbackItems'] as List;
    List<FeedbackItem> feedbackItems =
        feedbackItemsJson.map((item) => FeedbackItem.fromJson(item)).toList();

    return FeedbackAnswers(
      feedbackId: json['feedbackId'] as String,
      feedbackItems: feedbackItems,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'feedbackId': feedbackId,
      'feedbackItems': feedbackItems.map((item) => item.toJson()).toList(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FeedbackAnswers &&
        other.feedbackId == feedbackId &&
        other.feedbackItems == feedbackItems;
  }

  @override
  int get hashCode => feedbackId.hashCode ^ feedbackItems.hashCode;
}

// created by user and updated by admin
class FeedbackItem {
  final String deviceId;
  final String feedbackItemId;
  final FeedbackUserContent feedbackContent;
  final FeedbackAdminReply? feedbackReply;
  final bool isFeedbackReplyRead;

  FeedbackItem({
    required this.feedbackItemId,
    required this.feedbackContent,
    required this.deviceId,
    this.isFeedbackReplyRead = false,
    this.feedbackReply,
  });

  factory FeedbackItem.fromJson(Map<String, dynamic> json) {
    return FeedbackItem(
        deviceId: json['deviceId'] as String,
        feedbackItemId: json['feedbackItemId'] as String,
        isFeedbackReplyRead: json['isFeedbackReplyRead'] as bool,
        feedbackContent: json['feedbackContent'] as FeedbackUserContent,
        feedbackReply: json['feedbackReply'] as FeedbackAdminReply?);
  }

  Map<String, dynamic> toJson() {
    return {
      'feedbackItemId': feedbackItemId,
      'feedbackContent': feedbackContent,
      'isFeedbackReplyRead': isFeedbackReplyRead,
      'feedbackReply': feedbackReply,
    };
  }

  FeedbackItem copyWith({
    String? feedbackItemId,
    FeedbackUserContent? feedbackContent,
    FeedbackAdminReply? feedbackReply,
    bool? isFeedbackReplyRead,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? deviceId,
  }) {
    return FeedbackItem(
      deviceId: deviceId ?? this.deviceId,
      feedbackItemId: feedbackItemId ?? this.feedbackItemId,
      feedbackContent: feedbackContent ?? this.feedbackContent,
      feedbackReply: feedbackReply ?? this.feedbackReply,
      isFeedbackReplyRead: isFeedbackReplyRead ?? this.isFeedbackReplyRead,
    );
  }

  // used by admin user: reply
  FeedbackItem replyToFeedback({
    required FeedbackAdminReply reply,
  }) {
    return FeedbackItem(
      deviceId: deviceId,
      feedbackItemId: feedbackItemId,
      feedbackContent: feedbackContent,
      feedbackReply: reply,
      isFeedbackReplyRead: isFeedbackReplyRead,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FeedbackItem &&
        other.isFeedbackReplyRead == isFeedbackReplyRead &&
        other.feedbackItemId == feedbackItemId &&
        other.feedbackContent == feedbackContent &&
        other.feedbackReply == feedbackReply;
  }

  @override
  int get hashCode =>
      isFeedbackReplyRead.hashCode ^
      feedbackItemId.hashCode ^
      feedbackContent.hashCode ^
      feedbackReply.hashCode;
}

class FeedbackUserContent {
  final String content;
  final DateTime createdAt;
  final DateTime? updatedAt;

  FeedbackUserContent({
    required this.content,
    required this.createdAt,
    this.updatedAt,
  });
}

class FeedbackAdminReply {
  final String content;
  final DateTime createdAt;
  final DateTime? updatedAt;

  FeedbackAdminReply({
    required this.content,
    required this.createdAt,
    this.updatedAt,
  });
}
