// collection name: blogPostFeedback

class BlogPostFeedback {
  final String deviceId;
  final String blogPostId;
  final String answer;
  final DateTime answeredAt;

  BlogPostFeedback({
    required this.deviceId,
    required this.blogPostId,
    required this.answer,
    required this.answeredAt,
  });

  factory BlogPostFeedback.fromJson(Map<String, dynamic> json) {
    return BlogPostFeedback(
      deviceId: json['deviceId'],
      blogPostId: json['blogPostId'],
      answer: json['answer'],
      answeredAt: DateTime.parse(json['answeredAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      'blogPostId': blogPostId,
      'answer': answer,
      'answeredAt': answeredAt.toIso8601String(),
    };
  }
}
