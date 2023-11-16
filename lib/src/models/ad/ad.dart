import 'package:accessboard_models/src/models/meta/item_meta.dart';

class Ad {
  final String adId;
  final List<AdItem> adItems;
  final ItemMeta meta;

  Ad({
    required this.adId,
    required this.adItems,
    required this.meta,
  });

  factory Ad.fromJson(Map<String, dynamic> json) {
    var adItemsJson = json['adItems'] as List;
    List<AdItem> adItems =
        adItemsJson.map((item) => AdItem.fromJson(item)).toList();

    return Ad(
      adId: json['adId'] as String,
      adItems: adItems,
      meta: ItemMeta.fromJson(json['meta']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adId': adId,
      'adItems': adItems.map((item) => item.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }

  Ad copyWith({
    String? adId,
    List<AdItem>? adItems,
    ItemMeta? meta,
  }) {
    return Ad(
      adId: adId ?? this.adId,
      adItems: adItems ?? this.adItems,
      meta: meta ?? this.meta,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ad &&
        other.adId == adId &&
        other.adItems == adItems &&
        other.meta == meta;
  }

  @override
  int get hashCode => adId.hashCode ^ adItems.hashCode ^ meta.hashCode;
}

class AdItem {
  final String adItemId;
  final String title;
  final String description;
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
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      buttonUrl: json['buttonUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adItemId': adItemId,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'buttonUrl': buttonUrl,
    };
  }

  AdItem copyWith({
    String? adItemId,
    String? title,
    String? description,
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
