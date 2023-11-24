import 'package:accessboard_models/src/models/localized_string/localized_string.dart';
import 'package:accessboard_models/src/models/meta/item_meta.dart';
import 'package:accessboard_models/src/models/target_group.dart/target_group.dart';

class Ad {
  final String adId;
  final String projectId;
  final List<AdItem> adItems;
  final ItemMeta meta;
  final List<TargetGroup> targetGroups;

  Ad({
    required this.adId,
    required this.projectId,
    required this.adItems,
    required this.meta,
    this.targetGroups = const [],
  });

  factory Ad.fromJson(Map<String, dynamic> json) {
    var adItemsJson = json['adItems'] as List;
    List<AdItem> adItems =
        adItemsJson.map((item) => AdItem.fromJson(item)).toList();
    var targetGroupsJson = json['targetGroups'] as List;
    List<TargetGroup> targetGroups =
        targetGroupsJson.map((item) => TargetGroup.fromJson(item)).toList();

    return Ad(
      adId: json['adId'] as String,
      projectId: json['projectId'] as String,
      adItems: adItems,
      meta: ItemMeta.fromJson(json['meta']),
      targetGroups: targetGroups,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adId': adId,
      'projectId': projectId,
      'adItems': adItems.map((item) => item.toJson()).toList(),
      'meta': meta.toJson(),
      'targetGroups': targetGroups.map((item) => item.toJson()).toList(),
    };
  }

  Ad copyWith({
    List<AdItem>? adItems,
    ItemMeta? meta,
    List<TargetGroup>? targetGroups,
  }) {
    return Ad(
      adId: adId,
      projectId: projectId,
      adItems: adItems ?? this.adItems,
      meta: meta ?? this.meta,
      targetGroups: targetGroups ?? this.targetGroups,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ad &&
        other.adId == adId &&
        other.projectId == projectId &&
        other.adItems == adItems &&
        other.targetGroups == targetGroups &&
        other.meta == meta;
  }

  @override
  int get hashCode =>
      targetGroups.hashCode ^
      projectId.hashCode ^
      adId.hashCode ^
      adItems.hashCode ^
      meta.hashCode;
}

class AdItem {
  final String adItemId;
  final LocalizedString title;
  final LocalizedString description;
  final String imageUrl;
  final String buttonUrl;

  AdItem({
    required this.adItemId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.buttonUrl,
  });

  factory AdItem.fromJson(Map<String, dynamic> json) {
    return AdItem(
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

  AdItem copyWith({
    String? adItemId,
    LocalizedString? title,
    LocalizedString? description,
    String? imageUrl,
    String? buttonUrl,
  }) {
    return AdItem(
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

    return other is AdItem &&
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
