import 'package:accessboard_models/src/models/project_data/item_target_group_ids.dart';
import 'package:accessboard_models/src/models/project_data/placeholder_id_matcher.dart';
import 'package:accessboard_models/src/models/switch/widget_switch.dart';

class ProjectData {
  final List<PlaceholderIdMatcher> multipleChoiceIds;
  final List<PlaceholderIdMatcher> bannerAdIds;
  final List<PlaceholderIdMatcher> popUpAdIds;
  final List<ItemTargetGroupIds> adIds;
  final List<ItemTargetGroupIds> adPopIds;
  final List<PlaceholderIdMatcher> feedbackItemIds;
  final List<PlaceholderIdMatcher> pollIds;
  final List<ItemTargetGroupIds> blogPostIds;
  final List<ItemTargetGroupIds> faqIds;
  final List<ItemTargetGroupIds> multipleChoiceSelectionIds;
  final List<ItemTargetGroupIds> feedbackAnswerIds;
  final List<ItemTargetGroupIds> pollAnswerIds;
  final List<ItemTargetGroupIds> faqUserQuestionIds;
  final List<WidgetSwitch> switches;
  final ItemTargetGroupIds? feedId;
  final ItemTargetGroupIds? imprintId;
  final ItemTargetGroupIds? termsId;
  final ItemTargetGroupIds? privacyPolicyId;

  ProjectData({
    this.multipleChoiceIds = const [],
    this.bannerAdIds = const [],
    this.popUpAdIds = const [],
    this.adIds = const [],
    this.adPopIds = const [],
    this.feedbackItemIds = const [],
    this.pollIds = const [],
    this.blogPostIds = const [],
    this.faqIds = const [],
    this.multipleChoiceSelectionIds = const [],
    this.feedbackAnswerIds = const [],
    this.pollAnswerIds = const [],
    this.faqUserQuestionIds = const [],
    this.switches = const [],
    this.feedId,
    this.imprintId,
    this.termsId,
    this.privacyPolicyId,
  });
  factory ProjectData.fromJson(Map<String, dynamic> json) {
    return ProjectData(
      multipleChoiceIds: json['multipleChoiceIds'] == null
          ? []
          : (json['multipleChoiceIds'] as List<dynamic>)
              .map((item) =>
                  PlaceholderIdMatcher.fromJson(item as Map<String, dynamic>))
              .toList(),
      bannerAdIds: json['bannerAdIds'] == null
          ? []
          : (json['bannerAdIds'] as List<dynamic>)
              .map((item) =>
                  PlaceholderIdMatcher.fromJson(item as Map<String, dynamic>))
              .toList(),
      feedId: json['feedId'] != null
          ? ItemTargetGroupIds.fromJson(json['feedId'] as Map<String, dynamic>)
          : null,
      imprintId: json['imprintId'] != null
          ? ItemTargetGroupIds.fromJson(
              json['imprintId'] as Map<String, dynamic>)
          : null,
      termsId: json['termsId'] != null
          ? ItemTargetGroupIds.fromJson(json['termsId'] as Map<String, dynamic>)
          : null,
      privacyPolicyId: json['privacyPolicyId'] != null
          ? ItemTargetGroupIds.fromJson(
              json['privacyPolicyId'] as Map<String, dynamic>)
          : null,
      adIds: json['bannerAdIds'] == null
          ? []
          : (json['bannerAdIds'] as List<dynamic>)
              .map((item) =>
                  ItemTargetGroupIds.fromJson(item as Map<String, dynamic>))
              .toList(),
      adPopIds: json['adPopIds'] == null
          ? []
          : (json['adPopIds'] as List<dynamic>)
              .map((item) =>
                  ItemTargetGroupIds.fromJson(item as Map<String, dynamic>))
              .toList(),
      blogPostIds: json['blogPostIds'] == null
          ? []
          : (json['blogPostIds'] as List<dynamic>)
              .map((item) =>
                  ItemTargetGroupIds.fromJson(item as Map<String, dynamic>))
              .toList(),
      faqIds: json['faqIds'] == null
          ? []
          : (json['faqIds'] as List<dynamic>)
              .map((item) =>
                  ItemTargetGroupIds.fromJson(item as Map<String, dynamic>))
              .toList(),
      faqUserQuestionIds: json['faqUserQuestionIds'] == null
          ? []
          : (json['faqUserQuestionIds'] as List<dynamic>)
              .map((item) =>
                  ItemTargetGroupIds.fromJson(item as Map<String, dynamic>))
              .toList(),
      feedbackAnswerIds: json['feedbackAnswerIds'] == null
          ? []
          : (json['feedbackAnswerIds'] as List<dynamic>)
              .map((item) =>
                  ItemTargetGroupIds.fromJson(item as Map<String, dynamic>))
              .toList(),
      feedbackItemIds: json['feedbackItemIds'] == null
          ? []
          : (json['feedbackItemIds'] as List<dynamic>)
              .map((item) =>
                  PlaceholderIdMatcher.fromJson(item as Map<String, dynamic>))
              .toList(),
      multipleChoiceSelectionIds: json['multipleChoiceSelectionIds'] == null
          ? []
          : (json['multipleChoiceSelectionIds'] as List<dynamic>)
              .map((item) =>
                  ItemTargetGroupIds.fromJson(item as Map<String, dynamic>))
              .toList(),
      pollAnswerIds: json['pollAnswerIds'] == null
          ? []
          : (json['pollAnswerIds'] as List<dynamic>)
              .map((item) =>
                  ItemTargetGroupIds.fromJson(item as Map<String, dynamic>))
              .toList(),
      pollIds: json['pollIds'] == null
          ? []
          : (json['pollIds'] as List<dynamic>)
              .map((item) =>
                  PlaceholderIdMatcher.fromJson(item as Map<String, dynamic>))
              .toList(),
      popUpAdIds: json['popUpAdIds'] == null
          ? []
          : (json['popUpAdIds'] as List<dynamic>)
              .map((item) =>
                  PlaceholderIdMatcher.fromJson(item as Map<String, dynamic>))
              .toList(),
      switches: json['multipleChoiceSelectionIds'] == null
          ? []
          : (json['multipleChoiceSelectionIds'] as List<dynamic>)
              .map(
                  (item) => WidgetSwitch.fromJson(item as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jsonData = {
      'multipleChoiceIds':
          multipleChoiceIds.map((item) => item.toJson()).toList(),
      'bannerAdIds': bannerAdIds.map((item) => item.toJson()).toList(),
      'feedId': feedId?.toJson(),
      'imprintId': imprintId?.toJson(),
      'termsId': termsId?.toJson(),
      'privacyPolicyId': privacyPolicyId?.toJson(),
      'adIds': adIds.map((item) => item.toJson()).toList(),
      'adPopIds': adPopIds.map((item) => item.toJson()).toList(),
      'blogPostIds': blogPostIds.map((item) => item.toJson()).toList(),
      'faqIds': faqIds.map((item) => item.toJson()).toList(),
      'faqUserQuestionIds':
          faqUserQuestionIds.map((item) => item.toJson()).toList(),
      'feedbackAnswerIds':
          feedbackAnswerIds.map((item) => item.toJson()).toList(),
      'feedbackItemIds': feedbackItemIds.map((item) => item.toJson()).toList(),
      'multipleChoiceSelectionIds':
          multipleChoiceSelectionIds.map((item) => item.toJson()).toList(),
      'pollAnswerIds': pollAnswerIds.map((item) => item.toJson()).toList(),
      'pollIds': pollIds.map((item) => item.toJson()).toList(),
      'popUpAdIds': popUpAdIds.map((item) => item.toJson()).toList(),
      'switches': switches.map((item) => item.toJson()).toList(),
    };

    jsonData.removeWhere((key, value) {
      if (value is List) {
        return value.isEmpty;
      } else {
        return value == null;
      }
    });

    return jsonData;
  }

  ProjectData copyWith({
    List<PlaceholderIdMatcher>? multipleChoiceIds,
    List<PlaceholderIdMatcher>? bannerAdIds,
    ItemTargetGroupIds? feedId,
    ItemTargetGroupIds? imprintId,
    ItemTargetGroupIds? termsId,
    ItemTargetGroupIds? privacyPolicyId,
    List<ItemTargetGroupIds>? adIds,
    List<ItemTargetGroupIds>? adPopIds,
    List<ItemTargetGroupIds>? blogPostIds,
    List<ItemTargetGroupIds>? faqIds,
    List<ItemTargetGroupIds>? faqUserQuestionIds,
    List<ItemTargetGroupIds>? feedbackAnswerIds,
    List<PlaceholderIdMatcher>? feedbackItemIds,
    List<ItemTargetGroupIds>? multipleChoiceSelectionIds,
    List<ItemTargetGroupIds>? pollAnswerIds,
    List<PlaceholderIdMatcher>? pollIds,
    List<PlaceholderIdMatcher>? popUpAdIds,
    List<WidgetSwitch>? switches,
  }) {
    return ProjectData(
      multipleChoiceIds: multipleChoiceIds ?? this.multipleChoiceIds,
      bannerAdIds: bannerAdIds ?? this.bannerAdIds,
      feedId: feedId ?? this.feedId,
      imprintId: imprintId ?? this.imprintId,
      termsId: termsId ?? this.termsId,
      privacyPolicyId: privacyPolicyId ?? this.privacyPolicyId,
      adIds: adIds ?? this.adIds,
      adPopIds: adPopIds ?? this.adPopIds,
      blogPostIds: blogPostIds ?? this.blogPostIds,
      faqIds: faqIds ?? this.faqIds,
      faqUserQuestionIds: faqUserQuestionIds ?? this.faqUserQuestionIds,
      feedbackAnswerIds: feedbackAnswerIds ?? this.feedbackAnswerIds,
      feedbackItemIds: feedbackItemIds ?? this.feedbackItemIds,
      multipleChoiceSelectionIds:
          multipleChoiceSelectionIds ?? this.multipleChoiceSelectionIds,
      pollAnswerIds: pollAnswerIds ?? this.pollAnswerIds,
      pollIds: pollIds ?? this.pollIds,
      popUpAdIds: popUpAdIds ?? this.popUpAdIds,
      switches: switches ?? this.switches,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProjectData &&
        _listEquals(other.multipleChoiceIds, multipleChoiceIds) &&
        _listEquals(other.bannerAdIds, bannerAdIds) &&
        other.feedId == feedId &&
        other.imprintId == imprintId &&
        other.termsId == termsId &&
        other.privacyPolicyId == privacyPolicyId &&
        _listEquals(other.adIds, adIds) &&
        _listEquals(other.adPopIds, adPopIds) &&
        _listEquals(other.blogPostIds, blogPostIds) &&
        _listEquals(other.faqIds, faqIds) &&
        _listEquals(other.faqUserQuestionIds, faqUserQuestionIds) &&
        _listEquals(other.feedbackAnswerIds, feedbackAnswerIds) &&
        _listEquals(other.feedbackItemIds, feedbackItemIds) &&
        _listEquals(
            other.multipleChoiceSelectionIds, multipleChoiceSelectionIds) &&
        _listEquals(other.pollAnswerIds, pollAnswerIds) &&
        _listEquals(other.pollIds, pollIds) &&
        _listEquals(other.popUpAdIds, popUpAdIds) &&
        _listEquals(other.switches, switches);
  }

  @override
  int get hashCode {
    return _hashValues([
      ...multipleChoiceIds.map((e) => e.hashCode),
      ...bannerAdIds.map((e) => e.hashCode),
      feedId.hashCode,
      imprintId.hashCode,
      termsId.hashCode,
      privacyPolicyId.hashCode,
      ...adIds.map((e) => e.hashCode),
      ...adPopIds.map((e) => e.hashCode),
      ...blogPostIds.map((e) => e.hashCode),
      ...faqIds.map((e) => e.hashCode),
      ...faqUserQuestionIds.map((e) => e.hashCode),
      ...feedbackAnswerIds.map((e) => e.hashCode),
      ...feedbackItemIds.map((e) => e.hashCode),
      ...multipleChoiceSelectionIds.map((e) => e.hashCode),
      ...pollAnswerIds.map((e) => e.hashCode),
      ...pollIds.map((e) => e.hashCode),
      ...popUpAdIds.map((e) => e.hashCode),
      ...switches.map((e) => e.hashCode),
    ]);
  }
}

bool _listEquals<T>(List<T>? a, List<T>? b) {
  if (a == null) return b == null;
  if (b == null || a.length != b.length) return false;
  if (identical(a, b)) return true;
  for (int index = 0; index < a.length; index++) {
    if (a[index] != b[index]) return false;
  }
  return true;
}

int _hashValues(List<dynamic> values) {
  return _finish(_combineHashCodes(values.map((e) => e.hashCode).toList()));
}

int _combineHashCodes(List<int> codes) {
  return codes.fold(0, (value, code) => _combine(value, code));
}

int _combine(int hash, int value) {
  hash = 0x1fffffff & (hash + value);
  hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
  return hash ^ (hash >> 6);
}

int _finish(int hash) {
  hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
  hash = hash ^ (hash >> 11);
  return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
}
