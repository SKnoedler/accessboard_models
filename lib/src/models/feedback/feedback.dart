// collection feedbackItems
// 1 feedback object per project
import 'package:accessboard_models/src/models/meta/item_meta.dart';
import 'package:accessboard_models/src/models/multiple_choice/multiple_choice_item.dart';
import 'package:accessboard_models/src/models/target_group.dart/target_group.dart';

abstract class FeedbackItem {
  final String feedbackItemId;
  final String type;
  final String projectId;
  final List<TargetGroup> targetGroups;

  final ItemMeta meta;

  FeedbackItem({
    required this.feedbackItemId,
    required this.projectId,
    required this.meta,
    required this.type,
    this.targetGroups = const [],
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
    required String projectId,
    required ItemMeta meta,
    List<TargetGroup> targetGroups = const [],
  }) : super(
          feedbackItemId: feedbackItemId,
          meta: meta,
          type: typeName,
          projectId: projectId,
          targetGroups: targetGroups,
        );

  factory OpenFeedbackQuestion.fromJson(Map<String, dynamic> json) {
    var targetGroupsList = json['targetGroups'] as List;
    List<TargetGroup> targetGroups =
        targetGroupsList.map((item) => TargetGroup.fromJson(item)).toList();

    return OpenFeedbackQuestion(
      targetGroups: targetGroups,
      projectId: json['projectId'] as String,
      question: json['question'] as String,
      feedbackItemId: json['feedbackItemId'] as String,
      meta: ItemMeta.fromJson(json['meta']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'projectId': projectId,
      'question': question,
      'feedbackItemId': feedbackItemId,
      'meta': meta.toJson(),
      'type': typeName,
      'targetGroups': targetGroups.map((e) => e.toJson()).toList(),
    };
  }

  OpenFeedbackQuestion copyWith({
    String? question,
    ItemMeta? meta,
  }) {
    return OpenFeedbackQuestion(
      projectId: projectId,
      feedbackItemId: feedbackItemId,
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
    required String feedbackItemId,
    required String projectId,
    required ItemMeta meta,
    List<TargetGroup> targetGroups = const [],
  }) : super(
          feedbackItemId: feedbackItemId,
          meta: meta,
          type: typeName,
          projectId: projectId,
          targetGroups: targetGroups,
        );

  factory MultipleChoiceFeedbackQuestion.fromJson(Map<String, dynamic> json) {
    var targetGroupsList = json['targetGroups'] as List;
    List<TargetGroup> targetGroups =
        targetGroupsList.map((item) => TargetGroup.fromJson(item)).toList();
    return MultipleChoiceFeedbackQuestion(
      targetGroups: targetGroups,
      projectId: json['projectId'] as String,
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
      'targetGroups': targetGroups.map((e) => e.toJson()).toList(),
      'projectId': projectId,
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
    ItemMeta? meta,
  }) {
    return MultipleChoiceFeedbackQuestion(
      question: question ?? this.question,
      choices: choices ?? this.choices,
      feedbackItemId: feedbackItemId,
      projectId: projectId,
      meta: meta ?? this.meta,
    );
  }

  static const String typeName = 'MultipleChoiceFeedbackQuestion';
}
