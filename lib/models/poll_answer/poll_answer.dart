// collection: pollAnswers
class PollAnswer {
  final List<PollAnswerItem> pollAnswerItems;
  final DateTime updatedAt;

  PollAnswer({
    required this.pollAnswerItems,
    required this.updatedAt,
  });
  factory PollAnswer.fromJson(Map<String, dynamic> json) {
    var answerItemsList = json['pollAnswerItems'] as List;
    List<PollAnswerItem> answerItems =
        answerItemsList.map((item) => PollAnswerItem.fromJson(item)).toList();

    return PollAnswer(
      pollAnswerItems: answerItems,
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> answerItemsJson =
        pollAnswerItems.map((item) => item.toJson()).toList();

    return {
      'pollAnswerItems': answerItemsJson,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class PollAnswerItem {
  final String pollId;
  final String deviceId;
  final String selectedPollChoiceId;
  final DateTime selectedAt;

  PollAnswerItem({
    required this.pollId,
    required this.deviceId,
    required this.selectedPollChoiceId,
    required this.selectedAt,
  });

  factory PollAnswerItem.fromJson(Map<String, dynamic> json) {
    return PollAnswerItem(
      pollId: json['pollId'] as String,
      deviceId: json['deviceId'] as String,
      selectedPollChoiceId: json['selectedPollChoiceId'] as String,
      selectedAt: DateTime.parse(json['selectedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pollId': pollId,
      'deviceId': deviceId,
      'selectedPollChoiceId': selectedPollChoiceId,
      'selectedAt': selectedAt.toIso8601String(),
    };
  }
}
