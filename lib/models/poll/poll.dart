import 'package:accessboard_models/models/design/custom_design.dart';
import 'package:accessboard_models/models/feed/feed_item.dart';

// collection: polls

class Poll extends FeedItem {
  final String pollId;
  final String question;
  final List<PollChoice> choices;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final CustomDesign? customDesign;

  Poll({
    required this.pollId,
    required this.question,
    required this.choices,
    required this.createdAt,
    super.isNew = false,
    this.updatedAt,
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
      createdAt: DateTime.parse(json['createdAt']),
      customDesign: json['customDesign'] != null
          ? CustomDesign.fromJson(json['customDesign'])
          : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
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
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
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
    bool? isNew,
  }) {
    return Poll(
      pollId: pollId ?? this.pollId,
      question: question ?? this.question,
      choices: choices ?? this.choices,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      customDesign: customDesign ?? this.customDesign,
      isNew: isNew ?? this.isNew,
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
