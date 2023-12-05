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
      multipleChoiceIds: (json['multipleChoiceIds'] as List<dynamic>)
          .map((item) =>
              PlaceholderIdMatcher.fromJson(item as Map<String, dynamic>))
          .toList(),
      bannerAdIds: (json['bannerAdIds'] as List<dynamic>)
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
      adIds: (json['bannerAdIds'] as List<dynamic>)
          .map((item) =>
              ItemTargetGroupIds.fromJson(item as Map<String, dynamic>))
          .toList(),
      adPopIds: (json['adPopIds'] as List<dynamic>)
          .map((item) =>
              ItemTargetGroupIds.fromJson(item as Map<String, dynamic>))
          .toList(),
      blogPostIds: (json['blogPostIds'] as List<dynamic>)
          .map((item) =>
              ItemTargetGroupIds.fromJson(item as Map<String, dynamic>))
          .toList(),
      faqIds: (json['faqIds'] as List<dynamic>)
          .map((item) =>
              ItemTargetGroupIds.fromJson(item as Map<String, dynamic>))
          .toList(),
      faqUserQuestionIds: (json['faqUserQuestionIds'] as List<dynamic>)
          .map((item) =>
              ItemTargetGroupIds.fromJson(item as Map<String, dynamic>))
          .toList(),
      feedbackAnswerIds: (json['feedbackAnswerIds'] as List<dynamic>)
          .map((item) =>
              ItemTargetGroupIds.fromJson(item as Map<String, dynamic>))
          .toList(),
      feedbackItemIds: (json['feedbackItemIds'] as List<dynamic>)
          .map((item) =>
              PlaceholderIdMatcher.fromJson(item as Map<String, dynamic>))
          .toList(),
      multipleChoiceSelectionIds:
          (json['multipleChoiceSelectionIds'] as List<dynamic>)
              .map((item) =>
                  ItemTargetGroupIds.fromJson(item as Map<String, dynamic>))
              .toList(),
      pollAnswerIds: (json['pollAnswerIds'] as List<dynamic>)
          .map((item) =>
              ItemTargetGroupIds.fromJson(item as Map<String, dynamic>))
          .toList(),
      pollIds: (json['pollIds'] as List<dynamic>)
          .map((item) =>
              PlaceholderIdMatcher.fromJson(item as Map<String, dynamic>))
          .toList(),
      popUpAdIds: (json['popUpAdIds'] as List<dynamic>)
          .map((item) =>
              PlaceholderIdMatcher.fromJson(item as Map<String, dynamic>))
          .toList(),
      switches: (json['multipleChoiceSelectionIds'] as List<dynamic>)
          .map((item) => WidgetSwitch.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
        other.multipleChoiceIds == multipleChoiceIds &&
        other.bannerAdIds == bannerAdIds &&
        other.feedId == feedId &&
        other.imprintId == imprintId &&
        other.termsId == termsId &&
        other.privacyPolicyId == privacyPolicyId &&
        other.adIds == adIds &&
        other.adPopIds == adPopIds &&
        other.blogPostIds == blogPostIds &&
        other.faqIds == faqIds &&
        other.faqUserQuestionIds == faqUserQuestionIds &&
        other.feedbackAnswerIds == feedbackAnswerIds &&
        other.feedbackItemIds == feedbackItemIds &&
        other.multipleChoiceSelectionIds == multipleChoiceSelectionIds &&
        other.pollAnswerIds == pollAnswerIds &&
        other.pollIds == pollIds &&
        other.popUpAdIds == popUpAdIds &&
        other.switches == switches;
  }

  @override
  int get hashCode {
    return multipleChoiceIds.hashCode ^
        bannerAdIds.hashCode ^
        feedId.hashCode ^
        imprintId.hashCode ^
        termsId.hashCode ^
        privacyPolicyId.hashCode ^
        adIds.hashCode ^
        adPopIds.hashCode ^
        blogPostIds.hashCode ^
        faqIds.hashCode ^
        faqUserQuestionIds.hashCode ^
        feedbackAnswerIds.hashCode ^
        feedbackItemIds.hashCode ^
        multipleChoiceSelectionIds.hashCode ^
        pollAnswerIds.hashCode ^
        pollIds.hashCode ^
        popUpAdIds.hashCode ^
        switches.hashCode;
  }
}

class ItemTargetGroupIds {
  final String itemId;
  final List<String>? targetGroupIds;

  ItemTargetGroupIds({
    required this.itemId,
    this.targetGroupIds,
  });

  factory ItemTargetGroupIds.fromJson(Map<String, dynamic> json) {
    return ItemTargetGroupIds(
      itemId: json['itemId'] as String,
      targetGroupIds: (json['targetGroupIds'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'itemId': itemId,
      'targetGroupIds': targetGroupIds,
    };
  }

  ItemTargetGroupIds copyWith({
    String? itemId,
    List<String>? targetGroupIds,
  }) {
    return ItemTargetGroupIds(
      itemId: itemId ?? this.itemId,
      targetGroupIds: targetGroupIds ?? this.targetGroupIds,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemTargetGroupIds &&
        other.itemId == itemId &&
        other.targetGroupIds == targetGroupIds;
  }

  @override
  int get hashCode => itemId.hashCode ^ targetGroupIds.hashCode;
}

class PlaceholderIdMatcher {
  final int placeholderId;
  final String itemId;
  final List<String>? targetGroupIds;

  PlaceholderIdMatcher({
    required this.placeholderId,
    required this.itemId,
    this.targetGroupIds,
  });

  factory PlaceholderIdMatcher.fromJson(Map<String, dynamic> json) {
    return PlaceholderIdMatcher(
      placeholderId: json['placeholderId'] as int,
      itemId: json['itemId'] as String,
      targetGroupIds: (json['targetGroupIds'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'placeholderId': placeholderId,
      'itemId': itemId,
      'targetGroupIds': targetGroupIds,
    };
  }

  PlaceholderIdMatcher copyWith({
    int? placeholderId,
    String? itemId,
    List<String>? targetGroupIds,
  }) {
    return PlaceholderIdMatcher(
      placeholderId: placeholderId ?? this.placeholderId,
      itemId: itemId ?? this.itemId,
      targetGroupIds: targetGroupIds ?? this.targetGroupIds,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PlaceholderIdMatcher &&
        other.placeholderId == placeholderId &&
        other.itemId == itemId &&
        other.targetGroupIds == targetGroupIds;
  }

  @override
  int get hashCode =>
      placeholderId.hashCode ^ itemId.hashCode ^ targetGroupIds.hashCode;
}
