// collection: MultipleChoiceSelectionItems

class MultipleChoiceSelectionItem {
  final String multipleChoiceSelectionItemId;
  final String multipleChoiceItemId;
  final String multipleChoiceQuestionId;
  final String deviceId;

  final String selectedAnswer;
  final DateTime selectedAt;

  MultipleChoiceSelectionItem({
    required this.multipleChoiceSelectionItemId,
    required this.multipleChoiceItemId,
    required this.multipleChoiceQuestionId,
    required this.deviceId,
    required this.selectedAnswer,
    required this.selectedAt,
  });

  factory MultipleChoiceSelectionItem.fromJson(Map<String, dynamic> json) {
    return MultipleChoiceSelectionItem(
      multipleChoiceSelectionItemId:
          json['multipleChoiceSelectionItemId'] as String,
      multipleChoiceItemId: json['multipleChoiceItemId'] as String,
      multipleChoiceQuestionId: json['multipleChoiceQuestionId'] as String,
      deviceId: json['deviceId'] as String,
      selectedAnswer: json['selectedAnswer'] as String,
      selectedAt: DateTime.parse(json['selectedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'multipleChoiceSelectionItemId': multipleChoiceSelectionItemId,
      'multipleChoiceItemId': multipleChoiceItemId,
      'multipleChoiceQuestionId': multipleChoiceQuestionId,
      'deviceId': deviceId,
      'selectedAnswer': selectedAnswer,
      'selectedAt': selectedAt.toIso8601String(),
    };
  }

  MultipleChoiceSelectionItem copyWith({
    String? multipleChoiceSelectionItemId,
    String? multipleChoiceItemId,
    String? multipleChoiceQuestionId,
    String? deviceId,
    String? selectedAnswer,
    DateTime? selectedAt,
  }) {
    return MultipleChoiceSelectionItem(
      multipleChoiceSelectionItemId:
          multipleChoiceSelectionItemId ?? this.multipleChoiceSelectionItemId,
      multipleChoiceItemId: multipleChoiceItemId ?? this.multipleChoiceItemId,
      multipleChoiceQuestionId:
          multipleChoiceQuestionId ?? this.multipleChoiceQuestionId,
      deviceId: deviceId ?? this.deviceId,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      selectedAt: selectedAt ?? this.selectedAt,
    );
  }
}
