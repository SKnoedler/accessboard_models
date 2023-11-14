// collection: feedbackAnswerItems

// created by user and updated by admin
class FeedbackAnswerItem {
  final String deviceId;
  final String projectId;
  final String feedbackItemId;
  final String feedbackAnswerItemId;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final FeedbackUserContent feedbackContent;
  final FeedbackAdminReply? feedbackReply;
  final bool isFeedbackReplyRead;

  FeedbackAnswerItem({
    required this.createdAt,
    this.updatedAt,
    required this.feedbackAnswerItemId,
    required this.feedbackItemId,
    required this.feedbackContent,
    required this.deviceId,
    required this.projectId,
    this.isFeedbackReplyRead = false,
    this.feedbackReply,
  });

  factory FeedbackAnswerItem.fromJson(Map<String, dynamic> json) {
    return FeedbackAnswerItem(
      projectId: json['projectId'] as String,
      deviceId: json['deviceId'] as String,
      feedbackItemId: json['feedbackItemId'] as String,
      feedbackAnswerItemId: json['feedbackAnswerItemId'] as String,
      isFeedbackReplyRead: json['isFeedbackReplyRead'] as bool,
      feedbackContent: json['feedbackContent'] as FeedbackUserContent,
      feedbackReply: json['feedbackReply'] as FeedbackAdminReply?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'feedbackAnswerItemId': feedbackAnswerItemId,
      'feedbackItemId': feedbackItemId,
      'projectId': projectId,
      'feedbackContent': feedbackContent,
      'isFeedbackReplyRead': isFeedbackReplyRead,
      'feedbackReply': feedbackReply,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  FeedbackAnswerItem copyWith({
    FeedbackUserContent? feedbackContent,
    FeedbackAdminReply? feedbackReply,
    bool? isFeedbackReplyRead,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return FeedbackAnswerItem(
      feedbackAnswerItemId: feedbackAnswerItemId,
      feedbackItemId: feedbackItemId,
      deviceId: deviceId,
      projectId: projectId,
      feedbackContent: feedbackContent ?? this.feedbackContent,
      feedbackReply: feedbackReply ?? this.feedbackReply,
      isFeedbackReplyRead: isFeedbackReplyRead ?? this.isFeedbackReplyRead,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // used by admin user: reply
  FeedbackAnswerItem replyToFeedback({
    required FeedbackAdminReply reply,
  }) {
    return FeedbackAnswerItem(
      deviceId: deviceId,
      projectId: projectId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      feedbackItemId: feedbackItemId,
      feedbackAnswerItemId: feedbackAnswerItemId,
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
        other.createdAt == createdAt &&
        other.projectId == projectId &&
        other.updatedAt == updatedAt &&
        other.feedbackContent == feedbackContent &&
        other.feedbackReply == feedbackReply;
  }

  @override
  int get hashCode =>
      isFeedbackReplyRead.hashCode ^
      feedbackItemId.hashCode ^
      createdAt.hashCode ^
      projectId.hashCode ^
      updatedAt.hashCode ^
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
