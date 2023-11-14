import 'package:accessboard_models/accessboard_models.dart';
import 'package:accessboard_models/src/models/faq/faq_meta.dart';

class FAQ {
  final String faqId;
  final List<FaqItem> faqItems;
  final LocalizedString? openFaqQuestion;
  final FaqMeta meta;
  final List<TargetGroup> targetGroups;
  //TODO: add targetgroups to all objects

  FAQ({
    required this.faqId,
    required this.faqItems,
    required this.meta,
    this.openFaqQuestion,
    this.targetGroups = const [],
  });

  factory FAQ.fromJson(Map<String, dynamic> json) {
    var faqItemsJson = json['faqItems'] as List;
    List<FaqItem> faqItems =
        faqItemsJson.map((item) => FaqItem.fromJson(item)).toList();

    var targetGroupsList = json['targetGroups'] as List;
    List<TargetGroup> targetGroups =
        targetGroupsList.map((item) => TargetGroup.fromJson(item)).toList();

    return FAQ(
      targetGroups: targetGroups,
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
      'targetGroups': targetGroups.map((e) => e.toJson()).toList(),
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
    List<TargetGroup>? targetGroups,
  }) {
    return FAQ(
      targetGroups: targetGroups ?? this.targetGroups,
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
        other.targetGroups == targetGroups &&
        other.openFaqQuestion == openFaqQuestion &&
        other.faqItems == faqItems &&
        other.meta == meta;
  }

  @override
  int get hashCode =>
      openFaqQuestion.hashCode ^
      faqId.hashCode ^
      targetGroups.hashCode ^
      faqItems.hashCode ^
      meta.hashCode;
}
