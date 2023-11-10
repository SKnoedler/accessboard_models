import 'package:accessboard_models/src/models/multiple_choice/multiple_choice_item.dart';

// collection: multipleChoices
// contains many MultipleChoices
class MultipleChoices {
  final String multipleChoicesId;
  final List<MultipleChoiceQuestion> multipleChoices;

  MultipleChoices({
    required this.multipleChoicesId,
    required this.multipleChoices,
  });

  factory MultipleChoices.fromJson(Map<String, dynamic> json) {
    return MultipleChoices(
      multipleChoicesId: json['multipleChoicesId'] as String,
      multipleChoices: (json['multipleChoices'] as List<dynamic>)
          .map(
              (e) => MultipleChoiceQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'multipleChoicesId': multipleChoicesId,
      'multipleChoices': multipleChoices.map((e) => e.toJson()).toList(),
    };
  }

  MultipleChoices copyWith({
    String? multipleChoicesId,
    List<MultipleChoiceQuestion>? multipleChoices,
  }) {
    return MultipleChoices(
      multipleChoicesId: multipleChoicesId ?? this.multipleChoicesId,
      multipleChoices: multipleChoices ?? this.multipleChoices,
    );
  }
}
