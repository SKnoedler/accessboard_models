// collection feedback
// 1 feedback object per project
import 'package:accessboard_models/src/models/meta/item_meta.dart';
import 'package:accessboard_models/src/models/multiple_choice/multiple_choice_item.dart';

class Feedback {
  final String feedbackId;
  final List<FeedbackItem> feedbackItems;

  Feedback({
    required this.feedbackId,
    required this.feedbackItems,
  });

  factory Feedback.fromJson(Map<String, dynamic> json) {
    return Feedback(
      feedbackId: json['feedbackId'] as String,
      feedbackItems: (json['feedbackItems'] as List<dynamic>)
          .map((e) => FeedbackItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Feedback copyWith({
    String? feedbackId,
    List<FeedbackItem>? feedbackItems,
  }) {
    return Feedback(
      feedbackId: feedbackId ?? this.feedbackId,
      feedbackItems: feedbackItems ?? this.feedbackItems,
    );
  }
}

abstract class FeedbackItem {
  final String feedbackItemId;
  final String type;

  final ItemMeta meta;

  FeedbackItem({
    required this.feedbackItemId,
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
    required String feedbackItemId,
    required ItemMeta meta,
  }) : super(
          feedbackItemId: feedbackItemId,
          meta: meta,
          type: typeName,
        );

  factory OpenFeedbackQuestion.fromJson(Map<String, dynamic> json) {
    return OpenFeedbackQuestion(
      question: json['question'] as String,
      feedbackItemId: json['feedbackItemId'] as String,
      meta: ItemMeta.fromJson(json['meta']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'feedbackItemId': feedbackItemId,
      'meta': meta.toJson(),
      'type': typeName
    };
  }

  OpenFeedbackQuestion copyWith({
    String? question,
    String? feedbackItemId,
    ItemMeta? meta,
  }) {
    return OpenFeedbackQuestion(
      question: question ?? this.question,
      feedbackItemId: feedbackItemId ?? this.feedbackItemId,
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
    required String feedbackItemId,
    required ItemMeta meta,
  }) : super(
          feedbackItemId: feedbackItemId,
          meta: meta,
          type: typeName,
        );

  factory MultipleChoiceFeedbackQuestion.fromJson(Map<String, dynamic> json) {
    return MultipleChoiceFeedbackQuestion(
      question: json['question'] as String,
      choices: (json['choices'] as List<dynamic>)
          .map((e) =>
              MultipleChoiceAnswerChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      feedbackItemId: json['feedbackItemId'] as String,
      meta: ItemMeta.fromJson(json['meta']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'choices': choices.map((e) => e.toJson()).toList(),
      'feedbackItemId': feedbackItemId,
      'meta': meta.toJson(),
      'type': typeName,
    };
  }

  MultipleChoiceFeedbackQuestion copyWith({
    String? question,
    List<MultipleChoiceAnswerChoice>? choices,
    String? feedbackItemId,
    ItemMeta? meta,
  }) {
    return MultipleChoiceFeedbackQuestion(
      question: question ?? this.question,
      choices: choices ?? this.choices,
      feedbackItemId: feedbackItemId ?? this.feedbackItemId,
      meta: meta ?? this.meta,
    );
  }

  static const String typeName = 'MultipleChoiceFeedbackQuestion';
}
