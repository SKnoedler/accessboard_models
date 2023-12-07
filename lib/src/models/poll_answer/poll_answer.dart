class PollAnswer {
  final String pollId;
  final String id;
  final String deviceId;
  final String selectedPollChoiceId;
  final DateTime selectedAt;

  PollAnswer({
    required this.pollId,
    required this.id,
    required this.deviceId,
    required this.selectedPollChoiceId,
    required this.selectedAt,
  });

  factory PollAnswer.fromJson(Map<String, dynamic> json) {
    return PollAnswer(
      pollId: json['pollId'] as String,
      id: json['id'] as String,
      deviceId: json['deviceId'] as String,
      selectedPollChoiceId: json['selectedPollChoiceId'] as String,
      selectedAt: DateTime.parse(json['selectedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pollId': pollId,
      'id': id,
      'deviceId': deviceId,
      'selectedPollChoiceId': selectedPollChoiceId,
      'selectedAt': selectedAt.toIso8601String(),
    };
  }

  PollAnswer copyWith({
    String? pollId,
    String? id,
    String? deviceId,
    String? selectedPollChoiceId,
    DateTime? selectedAt,
  }) {
    return PollAnswer(
      pollId: pollId ?? this.pollId,
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      selectedPollChoiceId: selectedPollChoiceId ?? this.selectedPollChoiceId,
      selectedAt: selectedAt ?? this.selectedAt,
    );
  }
}
