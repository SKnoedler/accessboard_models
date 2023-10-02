// collection name: blogPostFeedback

class BlogPostFeedback {
  final List<BlogPostFeedbackItem> blogPostFeedbackItems;
  final DateTime updatedAt;

  BlogPostFeedback({
    required this.blogPostFeedbackItems,
    required this.updatedAt,
  });
  factory BlogPostFeedback.fromJson(Map<String, dynamic> json) {
    var feedbackItemsList = json['blogPostFeedbackItems'] as List;
    List<BlogPostFeedbackItem> feedbackItems = feedbackItemsList
        .map((item) => BlogPostFeedbackItem.fromJson(item))
        .toList();

    return BlogPostFeedback(
      blogPostFeedbackItems: feedbackItems,
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> feedbackItemsJson =
        blogPostFeedbackItems.map((item) => item.toJson()).toList();

    return {
      'blogPostFeedbackItems': feedbackItemsJson,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class BlogPostFeedbackItem {
  final String deviceId;
  final String blogPostId;
  final String feedbackContent;
  final DateTime createdAt;

  BlogPostFeedbackItem({
    required this.deviceId,
    required this.blogPostId,
    required this.feedbackContent,
    required this.createdAt,
  });

  factory BlogPostFeedbackItem.fromJson(Map<String, dynamic> json) {
    return BlogPostFeedbackItem(
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
