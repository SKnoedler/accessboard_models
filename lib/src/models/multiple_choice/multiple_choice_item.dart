import 'package:accessboard_models/accessboard_models.dart';
import 'package:accessboard_models/src/models/blog_post/feed_item_meta.dart';

class MultipleChoiceItem extends FeedItem {
  final String id;
  final String projectId;
  final List<MultipleChoiceQuestion> multipleChoiceQuestions;
  final FeedItemMeta meta;
  final List<TargetGroup> targetGroups;

  MultipleChoiceItem({
    required this.id,
    required this.projectId,
    required this.multipleChoiceQuestions,
    required this.meta,
    this.targetGroups = const [],
  }) : super(id: id, type: typeName);

  factory MultipleChoiceItem.fromJson(Map<String, dynamic> json) {
    var questionsList = json['multipleChoiceQuestions'] as List;
    List<MultipleChoiceQuestion> questions = questionsList
        .map((question) => MultipleChoiceQuestion.fromJson(question))
        .toList();
    var targetGroupsJson = json['targetGroups'] as List;
    List<TargetGroup> targetGroups =
        targetGroupsJson.map((item) => TargetGroup.fromJson(item)).toList();

    return MultipleChoiceItem(
      targetGroups: targetGroups,
      projectId: json['projectId'],
      id: json['id'],
      meta: FeedItemMeta.fromJson(json['meta']),
      multipleChoiceQuestions: questions,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> questionsJson =
        multipleChoiceQuestions.map((question) => question.toJson()).toList();

    return {
      'projectId': projectId,
      'id': id,
      'targetGroups': targetGroups.map((item) => item.toJson()).toList(),
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
    List<MultipleChoiceQuestion>? multipleChoiceQuestions,
    List<TargetGroup>? targetGroups,
    FeedItemMeta? meta,
  }) {
    return MultipleChoiceItem(
        id: id,
        targetGroups: targetGroups ?? this.targetGroups,
        multipleChoiceQuestions:
            multipleChoiceQuestions ?? this.multipleChoiceQuestions,
        meta: meta ?? this.meta,
        projectId: projectId);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MultipleChoiceItem &&
          runtimeType == other.runtimeType &&
          projectId == other.projectId &&
          targetGroups == other.targetGroups &&
          id == other.id;

  @override
  int get hashCode => id.hashCode ^ projectId.hashCode;
}

class MultipleChoiceQuestion {
  final String multipleChoiceQuestionId;
  final LocalizedString question;
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
      question: LocalizedString.fromJson(json['question']),
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
      'question': question.toJson(),
      'choices': choices.map((choice) => choice.toJson()).toList(),
      'customDesign': customDesign?.toJson(),
    };
  }

  MultipleChoiceQuestion copyWith({
    String? multipleChoiceQuestionId,
    LocalizedString? question,
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
  final LocalizedString answer;
  final bool isCorrect;

  MultipleChoiceAnswerChoice({
    required this.answer,
    required this.isCorrect,
  });

  factory MultipleChoiceAnswerChoice.fromJson(Map<String, dynamic> json) {
    return MultipleChoiceAnswerChoice(
      answer: LocalizedString.fromJson(json['answer']),
      isCorrect: json['isCorrect'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': answer.toJson(),
      'isCorrect': isCorrect,
    };
  }
}
