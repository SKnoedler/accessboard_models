// collection: feedbackAnswers

// one per project
class FeedbackAnswers {
  final String feedbackId;
  final List<FeedbackAnswerItem> feedbackAnswerItem;

  FeedbackAnswers({
    required this.feedbackId,
    this.feedbackAnswerItem = const [],
  });

  factory FeedbackAnswers.fromJson(Map<String, dynamic> json) {
    var feedbackItemsJson = json['feedbackItems'] as List;
    List<FeedbackAnswerItem> feedbackItems = feedbackItemsJson
        .map((item) => FeedbackAnswerItem.fromJson(item))
        .toList();

    return FeedbackAnswers(
      feedbackId: json['feedbackId'] as String,
      feedbackAnswerItem: feedbackItems,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'feedbackId': feedbackId,
      'feedbackItems': feedbackAnswerItem.map((item) => item.toJson()).toList(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FeedbackAnswers &&
        other.feedbackId == feedbackId &&
        other.feedbackAnswerItem == feedbackAnswerItem;
  }

  @override
  int get hashCode => feedbackId.hashCode ^ feedbackAnswerItem.hashCode;
}

// created by user and updated by admin
class FeedbackAnswerItem {
  final String deviceId;
  final String feedbackItemId;
  final FeedbackUserContent feedbackContent;
  final FeedbackAdminReply? feedbackReply;
  final bool isFeedbackReplyRead;

  FeedbackAnswerItem({
    required this.feedbackItemId,
    required this.feedbackContent,
    required this.deviceId,
    this.isFeedbackReplyRead = false,
    this.feedbackReply,
  });

  factory FeedbackAnswerItem.fromJson(Map<String, dynamic> json) {
    return FeedbackAnswerItem(
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

  FeedbackAnswerItem copyWith({
    String? feedbackItemId,
    FeedbackUserContent? feedbackContent,
    FeedbackAdminReply? feedbackReply,
    bool? isFeedbackReplyRead,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? deviceId,
  }) {
    return FeedbackAnswerItem(
      deviceId: deviceId ?? this.deviceId,
      feedbackItemId: feedbackItemId ?? this.feedbackItemId,
      feedbackContent: feedbackContent ?? this.feedbackContent,
      feedbackReply: feedbackReply ?? this.feedbackReply,
      isFeedbackReplyRead: isFeedbackReplyRead ?? this.isFeedbackReplyRead,
    );
  }

  // used by admin user: reply
  FeedbackAnswerItem replyToFeedback({
    required FeedbackAdminReply reply,
  }) {
    return FeedbackAnswerItem(
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

    return other is FeedbackAnswerItem &&
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
