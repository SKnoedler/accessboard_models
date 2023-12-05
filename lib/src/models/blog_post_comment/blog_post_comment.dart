class BlogPostComment {
  final String commentId;
  final String deviceId;
  final String blogPostId;
  final String commentContent;
  final DateTime createdAt;

  BlogPostComment({
    required this.commentId,
    required this.deviceId,
    required this.blogPostId,
    required this.commentContent,
    required this.createdAt,
  });

  factory BlogPostComment.fromJson(Map<String, dynamic> json) {
    return BlogPostComment(
      commentId: json['commentId'],
      deviceId: json['deviceId'],
      blogPostId: json['blogPostId'],
      commentContent: json['feedbackContent'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'commentId': commentId,
      'deviceId': deviceId,
      'blogPostId': blogPostId,
      'feedbackContent': commentContent,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
