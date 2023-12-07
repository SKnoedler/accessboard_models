import 'package:accessboard_models/src/models/localized_string/localized_string.dart';
import 'package:accessboard_models/src/models/meta/item_meta.dart';
import 'package:accessboard_models/src/models/target_group.dart/target_group.dart';

class PopupAd {
  final String id;
  final String projectId;
  final List<PopupAdItem> adItems;
  final ItemMeta meta;
  final List<TargetGroup> targetGroups;

  PopupAd({
    required this.id,
    required this.projectId,
    required this.adItems,
    required this.meta,
    this.targetGroups = const [],
  });

  factory PopupAd.fromJson(Map<String, dynamic> json) {
    var adItemsJson = json['adItems'] as List;
    List<PopupAdItem> adItems =
        adItemsJson.map((item) => PopupAdItem.fromJson(item)).toList();
    var targetGroupsJson = json['targetGroups'] as List;
    List<TargetGroup> targetGroups =
        targetGroupsJson.map((item) => TargetGroup.fromJson(item)).toList();

    return PopupAd(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      adItems: adItems,
      meta: ItemMeta.fromJson(json['meta']),
      targetGroups: targetGroups,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectId': projectId,
      'adItems': adItems.map((item) => item.toJson()).toList(),
      'meta': meta.toJson(),
      'targetGroups': targetGroups.map((item) => item.toJson()).toList(),
    };
  }

  PopupAd copyWith({
    List<PopupAdItem>? adItems,
    ItemMeta? meta,
    List<TargetGroup>? targetGroups,
  }) {
    return PopupAd(
      id: id,
      projectId: projectId,
      adItems: adItems ?? this.adItems,
      meta: meta ?? this.meta,
      targetGroups: targetGroups ?? this.targetGroups,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PopupAd &&
        other.id == id &&
        other.projectId == projectId &&
        other.adItems == adItems &&
        other.targetGroups == targetGroups &&
        other.meta == meta;
  }

  @override
  int get hashCode =>
      targetGroups.hashCode ^
      projectId.hashCode ^
      id.hashCode ^
      adItems.hashCode ^
      meta.hashCode;
}

class PopupAdItem {
  final String adItemId;
  final LocalizedString title;
  final LocalizedString description;
  final String imageUrl;
  final String buttonUrl;

  PopupAdItem({
    required this.adItemId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.buttonUrl,
  });

  factory PopupAdItem.fromJson(Map<String, dynamic> json) {
    return PopupAdItem(
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

  PopupAdItem copyWith({
    String? adItemId,
    LocalizedString? title,
    LocalizedString? description,
    String? imageUrl,
    String? buttonUrl,
  }) {
    return PopupAdItem(
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

    return other is PopupAdItem &&
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
