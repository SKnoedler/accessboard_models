// collection: multipleChoiceSelections

class UserMultipleChoiceSelection {
  final String multipleChoiceFeedbackId;
  final String userId;
  final String selectedAnswer;
  final DateTime selectedAt;

  UserMultipleChoiceSelection({
    required this.multipleChoiceFeedbackId,
    required this.userId,
    required this.selectedAnswer,
    required this.selectedAt,
  });

  factory UserMultipleChoiceSelection.fromJson(Map<String, dynamic> json) {
    return UserMultipleChoiceSelection(
      multipleChoiceFeedbackId: json['multipleChoiceFeedbackId'] as String,
      userId: json['userId'] as String,
      selectedAnswer: json['selectedAnswer'] as String,
      selectedAt: DateTime.parse(json['selectedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'multipleChoiceFeedbackId': multipleChoiceFeedbackId,
      'userId': userId,
      'selectedAnswer': selectedAnswer,
      'selectedAt': selectedAt.toIso8601String(),
    };
  }
}
