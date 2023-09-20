// collection name: blogPostFeedback

class BlogPostFeedback {
  final String deviceId;
  final String blogPostId;
  final String answer;

  BlogPostFeedback({
    required this.deviceId,
    required this.blogPostId,
    required this.answer,
  });

  factory BlogPostFeedback.fromJson(Map<String, dynamic> json) {
    return BlogPostFeedback(
      deviceId: json['deviceId'],
      blogPostId: json['blogPostId'],
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      'blogPostId': blogPostId,
      'answer': answer,
    };
  }
}
