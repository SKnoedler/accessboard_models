// collection: multipleChoiceSelections

class UserMultipleChoiceSelection {
  final String multipleChoiceFeedbackId;
  final String deviceId;
  final String selectedAnswer;
  final DateTime selectedAt;

  UserMultipleChoiceSelection({
    required this.multipleChoiceFeedbackId,
    required this.deviceId,
    required this.selectedAnswer,
    required this.selectedAt,
  });

  factory UserMultipleChoiceSelection.fromJson(Map<String, dynamic> json) {
    return UserMultipleChoiceSelection(
      multipleChoiceFeedbackId: json['multipleChoiceFeedbackId'] as String,
      deviceId: json['deviceId'] as String,
      selectedAnswer: json['selectedAnswer'] as String,
      selectedAt: DateTime.parse(json['selectedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'multipleChoiceFeedbackId': multipleChoiceFeedbackId,
      'deviceId': deviceId,
      'selectedAnswer': selectedAnswer,
      'selectedAt': selectedAt.toIso8601String(),
    };
  }
}
