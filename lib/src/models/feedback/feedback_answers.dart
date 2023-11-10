// collection name: feedbackAnswers

class FeedbackAnswers {
  final List<FeedbackAnswerItem> feedbackItems;
  final DateTime updatedAt;

  FeedbackAnswers({
    required this.feedbackItems,
    required this.updatedAt,
  });
  factory FeedbackAnswers.fromJson(Map<String, dynamic> json) {
    var feedbackItemsList = json['feedbackItems'] as List;
    List<FeedbackAnswerItem> feedbackItems = feedbackItemsList
        .map((item) => FeedbackAnswerItem.fromJson(item))
        .toList();

    return FeedbackAnswers(
      feedbackItems: feedbackItems,
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> feedbackItemsJson =
        feedbackItems.map((item) => item.toJson()).toList();

    return {
      'feedbackItems': feedbackItemsJson,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class FeedbackAnswerItem {
  final String deviceId;
  final String blogPostId;
  final String feedbackContent;
  final DateTime createdAt;

  FeedbackAnswerItem({
    required this.deviceId,
    required this.blogPostId,
    required this.feedbackContent,
    required this.createdAt,
  });

  factory FeedbackAnswerItem.fromJson(Map<String, dynamic> json) {
    return FeedbackAnswerItem(
      deviceId: json['deviceId'],
      blogPostId: json['blogPostId'],
      feedbackContent: json['feedbackContent'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      'blogPostId': blogPostId,
      'feedbackContent': feedbackContent,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
