// collection: pollAnswers
class PollAnswer {
  final String pollId;
  final String deviceId;
  final String selectedPollChoiceId;
  final DateTime selectedAt;

  PollAnswer({
    required this.pollId,
    required this.deviceId,
    required this.selectedPollChoiceId,
    required this.selectedAt,
  });

  factory PollAnswer.fromJson(Map<String, dynamic> json) {
    return PollAnswer(
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
