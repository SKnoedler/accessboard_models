import 'package:accessboard_models/models/feed/feed_item.dart';

// collection: multipleChoiceItems
class MultipleChoiceItem {
  final String multipleChoiceItemId;
  final List<MultipleChoiceQuestion> multipleChoiceQuestions;

  MultipleChoiceItem({
    required this.multipleChoiceItemId,
    required this.multipleChoiceQuestions,
  });
}

class MultipleChoiceQuestion extends FeedItem {
  final String multipleChoiceQuestionId;
  final String question;
  final List<MultipleChoiceAnswerChoice> choices;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime expiresAt;
  final List<String> multipleChoiceSelectionIds;

  MultipleChoiceQuestion({
    required this.multipleChoiceQuestionId,
    required this.question,
    required this.choices,
    required this.createdAt,
    required this.updatedAt,
    required this.expiresAt,
    this.multipleChoiceSelectionIds = const [],
  }) : super(id: multipleChoiceQuestionId, type: typeName);

  factory MultipleChoiceQuestion.fromJson(Map<String, dynamic> json) {
    return MultipleChoiceQuestion(
      multipleChoiceQuestionId: json['multipleChoiceQuestionId'],
      question: json['question'],
      choices: List<MultipleChoiceAnswerChoice>.from(json['choices']
          .map((choice) => MultipleChoiceAnswerChoice.fromJson(choice))),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      expiresAt: DateTime.parse(json['expiresAt']),
      multipleChoiceSelectionIds:
          List<String>.from(json['multipleChoiceSelectionIds']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'multipleChoiceQuestionId': multipleChoiceQuestionId,
      'question': question,
      'choices': choices.map((choice) => choice.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'expiresAt': expiresAt.toIso8601String(),
      'multipleChoiceSelectionIds': multipleChoiceSelectionIds,
      'type': type,
    };
  }

  static const String typeName = 'multiple_choice_question';
}

class MultipleChoiceAnswerChoice {
  final String answer;
  final bool isCorrect;

  MultipleChoiceAnswerChoice({
    required this.answer,
    required this.isCorrect,
  });

  factory MultipleChoiceAnswerChoice.fromJson(Map<String, dynamic> json) {
    return MultipleChoiceAnswerChoice(
      answer: json['answer'] as String,
      isCorrect: json['isCorrect'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'isCorrect': isCorrect,
    };
  }
}
