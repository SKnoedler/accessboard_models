import 'package:accessboard_models/accessboard_models.dart';

class FaqItem {
  final String faqItemId;
  final LocalizedString question;
  final LocalizedString answer;

  FaqItem({
    required this.faqItemId,
    required this.question,
    required this.answer,
  });

  factory FaqItem.fromJson(Map<String, dynamic> json) {
    return FaqItem(
      faqItemId: json['faqItemId'] as String,
      question: LocalizedString.fromJson(json['question']),
      answer: LocalizedString.fromJson(json['answer']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'faqItemId': faqItemId,
      'question': question.toJson(),
      'answer': answer.toJson(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FaqItem &&
        other.faqItemId == faqItemId &&
        other.question == question &&
        other.answer == answer;
  }

  @override
  int get hashCode => faqItemId.hashCode ^ question.hashCode ^ answer.hashCode;
}
