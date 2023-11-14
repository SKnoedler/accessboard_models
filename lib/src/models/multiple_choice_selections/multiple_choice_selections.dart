// collection: MultipleChoiceSelectionItems

class MultipleChoiceSelectionItem {
  final String multipleChoiceFeedbackId;
  final String deviceId;
  final String selectedAnswer;
  final DateTime selectedAt;

  MultipleChoiceSelectionItem({
    required this.multipleChoiceFeedbackId,
    required this.deviceId,
    required this.selectedAnswer,
    required this.selectedAt,
  });

  factory MultipleChoiceSelectionItem.fromJson(Map<String, dynamic> json) {
    return MultipleChoiceSelectionItem(
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
