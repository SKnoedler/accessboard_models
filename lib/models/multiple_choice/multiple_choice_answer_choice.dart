class MultipleChoiceAnswerChoice {
  final String answer;
  final bool isCorrect;

  MultipleChoiceAnswerChoice({
    required this.answer,
    required this.isCorrect,
  });

  factory MultipleChoiceAnswerChoice.fromJson(Map<String, dynamic> json) {
    return MultipleChoiceAnswerChoice(
      answer: json['answer'] as String,
      isCorrect: json['isCorrect'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'isCorrect': isCorrect,
    };
  }
}
