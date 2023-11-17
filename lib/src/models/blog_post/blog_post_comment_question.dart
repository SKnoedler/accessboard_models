import 'package:accessboard_models/src/models/localized_string/localized_string.dart';

class BlogPostCommentQuestion {
  final String feedbackQuestionId;
  final LocalizedString question;

  BlogPostCommentQuestion({
    required this.feedbackQuestionId,
    required this.question,
  });

  factory BlogPostCommentQuestion.fromJson(Map<String, dynamic> json) {
    return BlogPostCommentQuestion(
      feedbackQuestionId: json['feedbackQuestionId'],
      question: LocalizedString.fromJson(json['question']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'feedbackQuestionId': feedbackQuestionId,
      'question': question.toJson(),
    };
  }
}
