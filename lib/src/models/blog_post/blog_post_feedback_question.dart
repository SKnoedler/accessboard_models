import 'package:accessboard_models/src/models/localized_string/localized_string.dart';

class BlogPostFeedbackQuestion {
  final String feedbackQuestionId;
  final LocalizedString question;

  BlogPostFeedbackQuestion({
    required this.feedbackQuestionId,
    required this.question,
  });

  factory BlogPostFeedbackQuestion.fromJson(Map<String, dynamic> json) {
    return BlogPostFeedbackQuestion(
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
