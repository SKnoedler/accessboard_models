class BlogPostFeedback {
  final String feedbackQuestionId;
  final String question;

  BlogPostFeedback({
    required this.feedbackQuestionId,
    required this.question,
  });

  factory BlogPostFeedback.fromJson(Map<String, dynamic> json) {
    return BlogPostFeedback(
      feedbackQuestionId: json['feedbackQuestionId'],
      question: json['question'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'feedbackQuestionId': feedbackQuestionId,
      'question': question,
    };
  }
}
