import 'package:accessboard_models/src/models/faq/faq_item.dart';
import 'package:accessboard_models/src/models/faq/faq_meta.dart';

class FAQ {
  final String faqId;
  final List<FaqItem> faqItems;
  final FaqMeta meta;

  FAQ({
    required this.faqId,
    required this.faqItems,
    required this.meta,
  });

  factory FAQ.fromJson(Map<String, dynamic> json) {
    var faqItemsJson = json['faqItems'] as List;
    List<FaqItem> faqItems =
        faqItemsJson.map((item) => FaqItem.fromJson(item)).toList();

    return FAQ(
      faqId: json['faqId'] as String,
      faqItems: faqItems,
      meta: FaqMeta.fromJson(json['meta']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'faqId': faqId,
      'faqItems': faqItems.map((item) => item.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }

  FAQ copyWith({
    String? faqId,
    List<FaqItem>? faqItems,
    FaqMeta? meta,
  }) {
    return FAQ(
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
        other.faqItems == faqItems &&
        other.meta == meta;
  }

  @override
  int get hashCode => faqId.hashCode ^ faqItems.hashCode ^ meta.hashCode;
}
