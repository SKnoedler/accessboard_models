// collection: multipleChoiceSelections
class MultipleChoiceSelections {
  final List<MultipleChoiceSelectionItem> selectionItems;
  final DateTime updatedAt;

  MultipleChoiceSelections({
    required this.selectionItems,
    required this.updatedAt,
  });
  factory MultipleChoiceSelections.fromJson(Map<String, dynamic> json) {
    var multipleChoiceSelectionItemsList = json['selectionItems'] as List;
    List<MultipleChoiceSelectionItem> multipleChoiceSelectionItems =
        multipleChoiceSelectionItemsList
            .map((item) => MultipleChoiceSelectionItem.fromJson(item))
            .toList();

    return MultipleChoiceSelections(
      selectionItems: multipleChoiceSelectionItems,
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> multipleChoiceSelectionItemsJson =
        selectionItems.map((item) => item.toJson()).toList();

    return {
      'selectionItems': multipleChoiceSelectionItemsJson,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

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
