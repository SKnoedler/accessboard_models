class FaqItem {
  final String faqItemId;
  final String question;
  final String answer;

  FaqItem({
    required this.faqItemId,
    required this.question,
    required this.answer,
  });

  factory FaqItem.fromJson(Map<String, dynamic> json) {
    return FaqItem(
      faqItemId: json['faqItemId'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'faqItemId': faqItemId,
      'question': question,
      'answer': answer,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FaqItem &&
        other.faqItemId == faqItemId &&
        other.question == question &&
        other.answer == answer;
  }

  @override
  int get hashCode => faqItemId.hashCode ^ question.hashCode ^ answer.hashCode;
}
