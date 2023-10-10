import 'package:accessboard_models/models/blog_post/feed_item_meta.dart';
import 'package:accessboard_models/models/design/custom_design.dart';
import 'package:accessboard_models/models/feed/feed_item.dart';

// collection: polls

class Poll extends FeedItem {
  final String pollId;
  final String question;
  final List<PollChoice> choices;
  final FeedItemMeta meta;
  final CustomDesign? customDesign;

  Poll({
    required this.pollId,
    required this.question,
    required this.choices,
    required this.meta,
    this.customDesign,
  }) : super(
          id: pollId,
          type: typeName,
        );

  factory Poll.fromJson(Map<String, dynamic> json) {
    var choicesList = json['choices'] as List;
    List<PollChoice> choices =
        choicesList.map((choice) => PollChoice.fromJson(choice)).toList();

    return Poll(
      pollId: json['pollId'],
      question: json['question'],
      choices: choices,
      meta: FeedItemMeta.fromJson(json['createdAt']),
      customDesign: json['customDesign'] != null
          ? CustomDesign.fromJson(json['customDesign'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> choicesJson =
        choices.map((choice) => choice.toJson()).toList();

    return {
      'pollId': pollId,
      'question': question,
      'choices': choicesJson,
      'meta': meta.toJson(),
      'customDesign': customDesign?.toJson(),
      'type': type,
    };
  }

  static const String typeName = 'poll';

  Poll copyWith({
    String? pollId,
    String? question,
    List<PollChoice>? choices,
    DateTime? createdAt,
    DateTime? updatedAt,
    CustomDesign? customDesign,
    FeedItemMeta? meta,
  }) {
    return Poll(
      pollId: pollId ?? this.pollId,
      question: question ?? this.question,
      choices: choices ?? this.choices,
      customDesign: customDesign ?? this.customDesign,
      meta: meta ?? this.meta,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Poll &&
          runtimeType == other.runtimeType &&
          pollId == other.pollId;

  @override
  int get hashCode => pollId.hashCode;
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
