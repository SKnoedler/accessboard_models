import 'package:accessboard_models/models/blog_post/blog_post_model.dart';
import 'package:accessboard_models/models/multiple_choice/multiple_choice_question.dart';
import 'package:accessboard_models/models/poll/poll.dart';

abstract class FeedItem {
  final String id;
  final String type;

  FeedItem({
    required this.id,
    required this.type,
  });

  factory FeedItem.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case Poll.typeName:
        return Poll.fromJson(json);
      case BlogPost.typeName:
        return BlogPost.fromJson(json);
      case MultipleChoiceQuestion.typeName:
        return MultipleChoiceQuestion.fromJson(json);
      default:
        throw ArgumentError('Invalid type: ${json['type']}');
    }
  }

  Map<String, dynamic> toJson() {
    switch (type) {
      case Poll.typeName:
        return (this as Poll).toJson();
      case BlogPost.typeName:
        return (this as BlogPost).toJson();
      case MultipleChoiceQuestion.typeName:
        return (this as MultipleChoiceQuestion).toJson();
      default:
        throw StateError('Invalid type: $type');
    }
  }
}
