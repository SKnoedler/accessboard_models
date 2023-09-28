class BlogPostFeedbackQuestion {
  final String feedbackQuestionId;
  final String question;

  BlogPostFeedbackQuestion({
    required this.feedbackQuestionId,
    required this.question,
  });

  factory BlogPostFeedbackQuestion.fromJson(Map<String, dynamic> json) {
    return BlogPostFeedbackQuestion(
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
