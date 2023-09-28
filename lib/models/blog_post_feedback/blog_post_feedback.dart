// collection name: blogPostFeedback

class BlogPostFeedback {
  final String deviceId;
  final String blogPostId;
  final String feedbackContent;
  final DateTime createdAt;

  BlogPostFeedback({
    required this.deviceId,
    required this.blogPostId,
    required this.feedbackContent,
    required this.createdAt,
  });

  factory BlogPostFeedback.fromJson(Map<String, dynamic> json) {
    return BlogPostFeedback(
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
