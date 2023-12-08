import 'package:accessboard_models/src/models/meta/item_meta.dart';
import 'package:accessboard_models/src/models/multiple_choice/multiple_choice_item.dart';

abstract class FeedbackItem {
  final String id;
  final String type;
  final String projectId;

  final ItemMeta meta;

  FeedbackItem({
    required this.id,
    required this.projectId,
    required this.meta,
    required this.type,
  });

  factory FeedbackItem.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case OpenFeedbackQuestion.typeName:
        return OpenFeedbackQuestion.fromJson(json);
      case MultipleChoiceFeedbackQuestion.typeName:
        return MultipleChoiceFeedbackQuestion.fromJson(json);
      default:
        throw ArgumentError('Invalid type: ${json['type']}');
    }
  }

  Map<String, dynamic> toJson() {
    switch (type) {
      case MultipleChoiceFeedbackQuestion.typeName:
        return (this as MultipleChoiceFeedbackQuestion).toJson();
      case OpenFeedbackQuestion.typeName:
        return (this as OpenFeedbackQuestion).toJson();
      default:
        throw StateError('Invalid type: $type');
    }
  }
}

class OpenFeedbackQuestion extends FeedbackItem {
  final String question;

  OpenFeedbackQuestion({
    required this.question,
    required String id,
    required String projectId,
    required ItemMeta meta,
  }) : super(
          id: id,
          meta: meta,
          type: typeName,
          projectId: projectId,
        );

  factory OpenFeedbackQuestion.fromJson(Map<String, dynamic> json) {
    return OpenFeedbackQuestion(
      projectId: json['projectId'] as String,
      question: json['question'] as String,
      id: json['id'] as String,
      meta: ItemMeta.fromJson(json['meta']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'projectId': projectId,
      'question': question,
      'id': id,
      'meta': meta.toJson(),
      'type': typeName,
    };
  }

  OpenFeedbackQuestion copyWith({
    String? question,
    ItemMeta? meta,
  }) {
    return OpenFeedbackQuestion(
      projectId: projectId,
      id: id,
      question: question ?? this.question,
      meta: meta ?? this.meta,
    );
  }

  static const String typeName = 'OpenFeedbackQuestion';
}

class MultipleChoiceFeedbackQuestion extends FeedbackItem {
  final String question;
  final List<MultipleChoiceAnswerChoice> choices;

  MultipleChoiceFeedbackQuestion({
    required this.question,
    required this.choices,
    required String id,
    required String projectId,
    required ItemMeta meta,
  }) : super(
          id: id,
          meta: meta,
          type: typeName,
          projectId: projectId,
        );

  factory MultipleChoiceFeedbackQuestion.fromJson(Map<String, dynamic> json) {
    return MultipleChoiceFeedbackQuestion(
      projectId: json['projectId'] as String,
      question: json['question'] as String,
      choices: (json['choices'] as List<dynamic>)
          .map((e) =>
              MultipleChoiceAnswerChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      meta: ItemMeta.fromJson(json['meta']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'projectId': projectId,
      'question': question,
      'choices': choices.map((e) => e.toJson()).toList(),
      'id': id,
      'meta': meta.toJson(),
      'type': typeName,
    };
  }

  MultipleChoiceFeedbackQuestion copyWith({
    String? question,
    List<MultipleChoiceAnswerChoice>? choices,
    ItemMeta? meta,
  }) {
    return MultipleChoiceFeedbackQuestion(
      question: question ?? this.question,
      choices: choices ?? this.choices,
      id: id,
      projectId: projectId,
      meta: meta ?? this.meta,
    );
  }

  static const String typeName = 'MultipleChoiceFeedbackQuestion';
}
