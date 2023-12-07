import 'package:accessboard_models/accessboard_models.dart';

class FaqItem {
  final String id;
  final LocalizedString question;
  final LocalizedString answer;

  FaqItem({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory FaqItem.fromJson(Map<String, dynamic> json) {
    return FaqItem(
      id: json['id'] as String,
      question: LocalizedString.fromJson(json['question']),
      answer: LocalizedString.fromJson(json['answer']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question.toJson(),
      'answer': answer.toJson(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FaqItem &&
        other.id == id &&
        other.question == question &&
        other.answer == answer;
  }

  @override
  int get hashCode => id.hashCode ^ question.hashCode ^ answer.hashCode;
}
