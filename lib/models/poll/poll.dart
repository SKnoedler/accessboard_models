import 'package:accessboard_models/models/feed/feed_item.dart';

class Poll extends FeedItem {
  final String pollId;
  final String question;
  final List<String> choices;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Poll({
    required this.pollId,
    required this.question,
    required this.choices,
    required this.createdAt,
    this.updatedAt,
  }) : super(
          id: pollId,
          type: typeName,
        );

  factory Poll.fromJson(Map<String, dynamic> json) {
    return Poll(
      pollId: json['pollId'],
      question: json['question'],
      choices: List<String>.from(json['choices']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'pollId': pollId,
      'question': question,
      'choices': choices,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'id': id,
      'type': type,
    };
  }

  static const String typeName = 'poll';
}
