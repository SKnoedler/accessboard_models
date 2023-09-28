import 'package:accessboard_models/models/feed/feed_item.dart';

// collection: feeds

class InteractiveFeed {
  final String feedId;
  final String projectId;
  final String projectSecret;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<FeedItem> feedItems;

  InteractiveFeed({
    required this.feedId,
    required this.projectId,
    required this.projectSecret,
    required this.createdAt,
    required this.updatedAt,
    this.feedItems = const [],
  });

  factory InteractiveFeed.fromJson(Map<String, dynamic> json) {
    final List<dynamic> feedItemsJson = json['feedItems'] ?? [];
    final List<FeedItem> feedItems = feedItemsJson
        .map((itemJson) => FeedItem.fromJson(itemJson as Map<String, dynamic>))
        .toList();

    return InteractiveFeed(
      feedId: json['feedId'] as String,
      projectId: json['projectId'] as String,
      projectSecret: json['projectSecret'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      feedItems: feedItems,
    );
  }

  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> feedItemsJson =
        feedItems.map((item) => item.toJson()).toList();

    return {
      'feedId': feedId,
      'projectId': projectId,
      'projectSecret': projectSecret,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'feedItems': feedItemsJson,
    };
  }
}