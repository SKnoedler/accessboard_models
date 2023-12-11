import 'package:accessboard_models/src/models/blog_post/feed_item_meta.dart';
import 'package:accessboard_models/src/models/design/flutter_custom_design.dart';
import 'package:accessboard_models/src/models/feed/feed_item.dart';
import 'package:accessboard_models/src/models/localized_string/localized_string.dart';
import 'package:accessboard_models/src/models/target_group.dart/target_group.dart';

class Poll extends FeedItem {
  final String id;
  final LocalizedString question; // Changed this line
  final List<PollChoice> choices;
  final FeedItemMeta meta;
  final FlutterCustomDesign? customDesign;
  final List<TargetGroup> targetGroups;

  Poll({
    required this.id,
    required this.question, // And this line
    required this.choices,
    required this.meta,
    this.targetGroups = const [],
    this.customDesign,
  }) : super(
          id: id,
          type: typeName,
        );

  factory Poll.fromJson(Map<String, dynamic> json) {
    var choicesList = json['choices'] as List;
    List<PollChoice> choices =
        choicesList.map((choice) => PollChoice.fromJson(choice)).toList();
    var targetGroupsJson = json['targetGroups'] as List;
    List<TargetGroup> targetGroups =
        targetGroupsJson.map((item) => TargetGroup.fromJson(item)).toList();

    return Poll(
      targetGroups: targetGroups,
      id: json['id'],
      question: LocalizedString.fromJson(json['question']), // And this line
      choices: choices,
      meta: FeedItemMeta.fromJson(json['meta']),
      customDesign: json['customDesign'] != null
          ? FlutterCustomDesign.fromJson(json['customDesign'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> choicesJson =
        choices.map((choice) => choice.toJson()).toList();

    return {
      'id': id,
      'question': question.toJson(), // And this line
      'choices': choicesJson,
      'meta': meta.toJson(),
      'customDesign': customDesign?.toJson(),
      'type': type,
      'targetGroups': targetGroups.map((item) => item.toJson()).toList(),
    };
  }

  static const String typeName = 'poll';

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

  Poll copyWith({
    String? id,
    LocalizedString? question,
    List<PollChoice>? choices,
    DateTime? createdAt,
    DateTime? updatedAt,
    FlutterCustomDesign? customDesign,
    FeedItemMeta? meta,
  }) {
    return Poll(
      id: id ?? this.id,
      question: question ?? this.question,
      choices: choices ?? this.choices,
      customDesign: customDesign ?? this.customDesign,
      meta: meta ?? this.meta,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Poll && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class PollChoice {
  final String pollChoiceId;
  final String choice;

  PollChoice({
    required this.pollChoiceId,
    required this.choice,
  });

  factory PollChoice.fromJson(Map<String, dynamic> json) {
    return PollChoice(
      pollChoiceId: json['pollChoiceId'],
      choice: json['choice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pollChoiceId': pollChoiceId,
      'choice': choice,
    };
  }
}
