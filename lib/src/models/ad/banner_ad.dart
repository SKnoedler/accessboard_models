import 'package:accessboard_models/src/models/localized_string/localized_string.dart';
import 'package:accessboard_models/src/models/meta/item_meta.dart';
import 'package:accessboard_models/src/models/target_group.dart/target_group.dart';

class BannerAd {
  final String adId;
  final String projectId;
  final BannerAdItem adData;
  final ItemMeta meta;
  final List<TargetGroup> targetGroups;

  BannerAd({
    required this.adId,
    required this.projectId,
    required this.adData,
    required this.meta,
    this.targetGroups = const [],
  });

  factory BannerAd.fromJson(Map<String, dynamic> json) {
    var targetGroupsJson = json['targetGroups'] as List;
    List<TargetGroup> targetGroups =
        targetGroupsJson.map((item) => TargetGroup.fromJson(item)).toList();

    return BannerAd(
      adId: json['adId'] as String,
      projectId: json['projectId'] as String,
      adData: BannerAdItem.fromJson(json['adData']),
      meta: ItemMeta.fromJson(json['meta']),
      targetGroups: targetGroups,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adId': adId,
      'projectId': projectId,
      'adData': adData.toJson(),
      'meta': meta.toJson(),
      'targetGroups': targetGroups.map((item) => item.toJson()).toList(),
    };
  }

  BannerAd copyWith({
    BannerAdItem? adData,
    ItemMeta? meta,
    List<TargetGroup>? targetGroups,
  }) {
    return BannerAd(
      adId: adId,
      projectId: projectId,
      adData: adData ?? this.adData,
      meta: meta ?? this.meta,
      targetGroups: targetGroups ?? this.targetGroups,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BannerAd &&
        other.adId == adId &&
        other.projectId == projectId &&
        other.adData == adData &&
        other.targetGroups == targetGroups &&
        other.meta == meta;
  }

  @override
  int get hashCode =>
      targetGroups.hashCode ^
      projectId.hashCode ^
      adId.hashCode ^
      adData.hashCode ^
      meta.hashCode;
}

class BannerAdItem {
  final String adItemId;
  final LocalizedString title;
  final LocalizedString description;
  final String imageUrl;
  final String buttonUrl;

  BannerAdItem({
    required this.adItemId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.buttonUrl,
  });

  factory BannerAdItem.fromJson(Map<String, dynamic> json) {
    return BannerAdItem(
      adItemId: json['adItemId'] as String,
      title: LocalizedString.fromJson(json['title']),
      description: LocalizedString.fromJson(json['description']),
      imageUrl: json['imageUrl'] as String,
      buttonUrl: json['buttonUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adItemId': adItemId,
      'title': title.toJson(),
      'description': description.toJson(),
      'imageUrl': imageUrl,
      'buttonUrl': buttonUrl,
    };
  }

  BannerAdItem copyWith({
    String? adItemId,
    LocalizedString? title,
    LocalizedString? description,
    String? imageUrl,
    String? buttonUrl,
  }) {
    return BannerAdItem(
      adItemId: adItemId ?? this.adItemId,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      buttonUrl: buttonUrl ?? this.buttonUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BannerAdItem &&
        other.adItemId == adItemId &&
        other.title == title &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.buttonUrl == buttonUrl;
  }

  @override
  int get hashCode =>
      adItemId.hashCode ^
      title.hashCode ^
      description.hashCode ^
      imageUrl.hashCode ^
      buttonUrl.hashCode;
}
