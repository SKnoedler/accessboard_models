class MultipleChoiceSelectionItem {
  final String projectId;
  final String id;
  final String multipleChoiceItemId;
  final String multipleChoiceQuestionId;
  final String deviceId;

  final String selectedAnswer;
  final DateTime selectedAt;

  MultipleChoiceSelectionItem({
    required this.projectId,
    required this.id,
    required this.multipleChoiceItemId,
    required this.multipleChoiceQuestionId,
    required this.deviceId,
    required this.selectedAnswer,
    required this.selectedAt,
  });

  factory MultipleChoiceSelectionItem.fromJson(Map<String, dynamic> json) {
    return MultipleChoiceSelectionItem(
      projectId: json['projectId'] as String,
      id: json['id'] as String,
      multipleChoiceItemId: json['multipleChoiceItemId'] as String,
      multipleChoiceQuestionId: json['multipleChoiceQuestionId'] as String,
      deviceId: json['deviceId'] as String,
      selectedAnswer: json['selectedAnswer'] as String,
      selectedAt: DateTime.parse(json['selectedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'projectId': projectId,
      'id': id,
      'multipleChoiceItemId': multipleChoiceItemId,
      'multipleChoiceQuestionId': multipleChoiceQuestionId,
      'deviceId': deviceId,
      'selectedAnswer': selectedAnswer,
      'selectedAt': selectedAt.toIso8601String(),
    };
  }

  MultipleChoiceSelectionItem copyWith({
    String? selectedAnswer,
    DateTime? selectedAt,
  }) {
    return MultipleChoiceSelectionItem(
      id: id,
      multipleChoiceItemId: multipleChoiceItemId,
      multipleChoiceQuestionId: multipleChoiceQuestionId,
      deviceId: deviceId,
      projectId: projectId,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      selectedAt: selectedAt ?? this.selectedAt,
    );
  }
}
