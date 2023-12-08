import 'package:accessboard_models/src/models/project_data/item_target_group_ids.dart';
import 'package:accessboard_models/src/models/project_data/placeholder_id_matcher.dart';
import 'package:accessboard_models/src/models/switch/widget_switch.dart';

class ProjectData {
  final List<PlaceholderIdMatcher> multipleChoiceIds;
  final List<PlaceholderIdMatcher> bannerAdIds;
  final List<ItemTargetGroupIds> popUpAdIds;
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

  static const multipleChoiceIdsKey = 'multipleChoiceIds';
  static const bannerAdIdsKey = 'bannerAdIds';
  static const popUpAdIdsKey = 'popUpAdIds';
  static const feedbackItemIdsKey = 'feedbackItemIds';
  static const pollIdsKey = 'pollIds';
  static const blogPostIdsKey = 'blogPostIds';
  static const faqIdsKey = 'faqIds';
  static const multipleChoiceSelectionIdsKey = 'multipleChoiceSelectionIds';
  static const feedbackAnswerIdsKey = 'feedbackAnswerIds';
  static const pollAnswerIdsKey = 'pollAnswerIds';
  static const faqUserQuestionIdsKey = 'faqUserQuestionIds';
  static const switchesKey = 'switches';
  static const feedIdKey = 'feedId';
  static const imprintIdKey = 'imprintId';
  static const termsIdKey = 'termsId';
  static const privacyPolicyIdKey = 'privacyPolicyId';

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
                  ItemTargetGroupIds.fromJson(item as Map<String, dynamic>))
              .toList(),
      switches: json['switches'] == null
          ? []
          : (json['switches'] as List<dynamic>)
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
      blogPostIds: blogPostIds ?? this.blogPostIds,
      faqIds: faqIds ?? this.faqIds,
      faqUserQuestionIds: faqUserQuestionIds ?? this.faqUserQuestionIds,
      feedbackAnswerIds: feedbackAnswerIds ?? this.feedbackAnswerIds,
      feedbackItemIds: feedbackItemIds ?? this.feedbackItemIds,
      multipleChoiceSelectionIds:
          multipleChoiceSelectionIds ?? this.multipleChoiceSelectionIds,
      pollAnswerIds: pollAnswerIds ?? this.pollAnswerIds,
      pollIds: pollIds ?? this.pollIds,
      switches: switches ?? this.switches,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProjectData &&
        _equals(other.multipleChoiceIds, multipleChoiceIds) &&
        _equals(other.bannerAdIds, bannerAdIds) &&
        other.feedId == feedId &&
        other.imprintId == imprintId &&
        other.termsId == termsId &&
        other.privacyPolicyId == privacyPolicyId &&
        _equals(other.blogPostIds, blogPostIds) &&
        _equals(other.faqIds, faqIds) &&
        _equals(other.faqUserQuestionIds, faqUserQuestionIds) &&
        _equals(other.feedbackAnswerIds, feedbackAnswerIds) &&
        _equals(other.feedbackItemIds, feedbackItemIds) &&
        _equals(other.multipleChoiceSelectionIds, multipleChoiceSelectionIds) &&
        _equals(other.pollAnswerIds, pollAnswerIds) &&
        _equals(other.pollIds, pollIds) &&
        _equals(other.popUpAdIds, popUpAdIds) &&
        _equals(other.switches, switches);
  }

  @override
  int get hashCode => _hashValues([
        ...multipleChoiceIds,
        ...bannerAdIds,
        feedId,
        imprintId,
        termsId,
        privacyPolicyId,
        ...blogPostIds,
        ...faqIds,
        ...faqUserQuestionIds,
        ...feedbackAnswerIds,
        ...feedbackItemIds,
        ...multipleChoiceSelectionIds,
        ...pollAnswerIds,
        ...pollIds,
        ...popUpAdIds,
        ...switches,
      ]);

  bool _equals<T>(List<T>? a, List<T>? b) {
    if (a == null) return b == null;
    if (b == null) return false;
    if (a.length != b.length) return false;

    return a.every((element) => b.contains(element));
  }

  int _hashValues(List<dynamic> values) =>
      values.fold(0, (hash, value) => hash ^ value.hashCode);
}
