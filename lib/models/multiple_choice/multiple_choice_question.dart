import 'package:accessboard_models/models/blog_post/feed_item_meta.dart';
import 'package:accessboard_models/models/design/custom_design.dart';
import 'package:accessboard_models/models/feed/feed_item.dart';

// collection: multipleChoiceItems
class MultipleChoiceItem extends FeedItem {
  final String multipleChoiceItemId;
  final List<MultipleChoiceQuestion> multipleChoiceQuestions;
  final FeedItemMeta meta;

  MultipleChoiceItem({
    required this.multipleChoiceItemId,
    required this.multipleChoiceQuestions,
    required this.meta,
  }) : super(id: multipleChoiceItemId, type: typeName);

  factory MultipleChoiceItem.fromJson(Map<String, dynamic> json) {
    var questionsList = json['multipleChoiceQuestions'] as List;
    List<MultipleChoiceQuestion> questions = questionsList
        .map((question) => MultipleChoiceQuestion.fromJson(question))
        .toList();

    return MultipleChoiceItem(
      multipleChoiceItemId: json['multipleChoiceItemId'],
      meta: FeedItemMeta.fromJson(json['meta']),
      multipleChoiceQuestions: questions,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> questionsJson =
        multipleChoiceQuestions.map((question) => question.toJson()).toList();

    return {
      'multipleChoiceItemId': multipleChoiceItemId,
      'multipleChoiceQuestions': questionsJson,
      'type': type,
      'meta': meta.toJson(),
    };
  }

  static const String typeName = 'multiple_choice_question';

  bool get isUnpublished {
    return meta.releasedAt == null;
  }

  bool get isPlanned {
    if (meta.releasedAt == null) return false;
    return meta.releasedAt!.isAfter(DateTime.now());
  }

  bool get isExpired {
    return meta.validUntil != null && meta.validUntil!.isBefore(DateTime.now());
  }

  bool get isActive => !isUnpublished && !isPlanned && !isExpired;

  MultipleChoiceItem copyWith({
    String? multipleChoiceItemId,
    List<MultipleChoiceQuestion>? multipleChoiceQuestions,
    FeedItemMeta? meta,
  }) {
    return MultipleChoiceItem(
      multipleChoiceItemId: multipleChoiceItemId ?? this.multipleChoiceItemId,
      multipleChoiceQuestions:
          multipleChoiceQuestions ?? this.multipleChoiceQuestions,
      meta: meta ?? this.meta,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MultipleChoiceItem &&
          runtimeType == other.runtimeType &&
          multipleChoiceItemId == other.multipleChoiceItemId;

  @override
  int get hashCode => multipleChoiceItemId.hashCode;
}

class MultipleChoiceQuestion {
  final String multipleChoiceQuestionId;
  final String question;
  final List<MultipleChoiceAnswerChoice> choices;
  final CustomDesign? customDesign;

  MultipleChoiceQuestion({
    required this.multipleChoiceQuestionId,
    required this.question,
    required this.choices,
    this.customDesign,
  });

  factory MultipleChoiceQuestion.fromJson(Map<String, dynamic> json) {
    return MultipleChoiceQuestion(
      multipleChoiceQuestionId: json['multipleChoiceQuestionId'],
      question: json['question'],
      choices: List<MultipleChoiceAnswerChoice>.from(json['choices']
          .map((choice) => MultipleChoiceAnswerChoice.fromJson(choice))),
      customDesign: json['customDesign'] != null
          ? CustomDesign.fromJson(json['customDesign'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'multipleChoiceQuestionId': multipleChoiceQuestionId,
      'question': question,
      'choices': choices.map((choice) => choice.toJson()).toList(),
      'customDesign': customDesign?.toJson(),
    };
  }

  MultipleChoiceQuestion copyWith({
    String? multipleChoiceQuestionId,
    String? question,
    List<MultipleChoiceAnswerChoice>? choices,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? expiresAt,
    List<String>? multipleChoiceSelectionIds,
    CustomDesign? customDesign,
  }) {
    return MultipleChoiceQuestion(
      multipleChoiceQuestionId:
          multipleChoiceQuestionId ?? this.multipleChoiceQuestionId,
      question: question ?? this.question,
      choices: choices ?? this.choices,
      customDesign: customDesign ?? this.customDesign,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MultipleChoiceQuestion &&
          runtimeType == other.runtimeType &&
          multipleChoiceQuestionId == other.multipleChoiceQuestionId;

  @override
  int get hashCode => multipleChoiceQuestionId.hashCode;
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
