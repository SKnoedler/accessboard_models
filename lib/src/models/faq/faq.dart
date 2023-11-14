import 'package:accessboard_models/src/models/faq/faq_item.dart';
import 'package:accessboard_models/src/models/faq/faq_meta.dart';
import 'package:accessboard_models/src/models/localized_string/localized_string.dart';

class FAQ {
  final String faqId;
  final List<FaqItem> faqItems;
  final LocalizedString? openFaqQuestion;
  final FaqMeta meta;

  FAQ({
    required this.faqId,
    required this.faqItems,
    required this.meta,
    this.openFaqQuestion,
  });

  factory FAQ.fromJson(Map<String, dynamic> json) {
    var faqItemsJson = json['faqItems'] as List;
    List<FaqItem> faqItems =
        faqItemsJson.map((item) => FaqItem.fromJson(item)).toList();

    return FAQ(
      openFaqQuestion: json['openFaqQuestion'] != null
          ? LocalizedString.fromJson(json['openFaqQuestion'])
          : null,
      faqId: json['faqId'] as String,
      faqItems: faqItems,
      meta: FaqMeta.fromJson(json['meta']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'openFaqQuestion':
          openFaqQuestion != null ? openFaqQuestion!.toJson() : null,
      'faqId': faqId,
      'faqItems': faqItems.map((item) => item.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }

  FAQ copyWith({
    String? faqId,
    List<FaqItem>? faqItems,
    FaqMeta? meta,
    LocalizedString? openFaqQuestion,
  }) {
    return FAQ(
      openFaqQuestion: openFaqQuestion ?? this.openFaqQuestion,
      faqId: faqId ?? this.faqId,
      faqItems: faqItems ?? this.faqItems,
      meta: meta ?? this.meta,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FAQ &&
        other.faqId == faqId &&
        other.openFaqQuestion == openFaqQuestion &&
        other.faqItems == faqItems &&
        other.meta == meta;
  }

  @override
  int get hashCode =>
      openFaqQuestion.hashCode ^
      faqId.hashCode ^
      faqItems.hashCode ^
      meta.hashCode;
}
