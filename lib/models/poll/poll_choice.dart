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
