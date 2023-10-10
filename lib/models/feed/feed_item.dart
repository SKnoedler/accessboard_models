import 'package:accessboard_models/models/blog_post/blog_post_model.dart';
import 'package:accessboard_models/models/multiple_choice/multiple_choice_question.dart';
import 'package:accessboard_models/models/poll/poll.dart';

abstract class FeedItem {
  final String id;
  final String type;
  final bool isNew;

  FeedItem({
    required this.id,
    required this.type,
    this.isNew = false,
  });

  factory FeedItem.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case Poll.typeName:
        return Poll.fromJson(json);
      case BlogPost.typeName:
        return BlogPost.fromJson(json);
      case MultipleChoiceItem.typeName:
        return MultipleChoiceItem.fromJson(json);
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
      case MultipleChoiceItem.typeName:
        return (this as MultipleChoiceItem).toJson();
      default:
        throw StateError('Invalid type: $type');
    }
  }

  Map<String, dynamic> toStorageJson() {
    switch (type) {
      case Poll.typeName:
        return (this as ExtendedPoll).toJson();
      case BlogPost.typeName:
        return (this as BlogPost).toJson();
      case MultipleChoiceItem.typeName:
        return (this as MultipleChoiceItem).toJson();
      default:
        throw StateError('Invalid type: $type');
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          type == other.type &&
          isNew == other.isNew;

  @override
  int get hashCode => id.hashCode ^ type.hashCode ^ isNew.hashCode;
}

class ExtendedPoll extends Poll {
  ExtendedPoll({
    required super.pollId,
    required super.question,
    required super.choices,
    required super.createdAt,
    required this.isCompleted,
  });

  final bool isCompleted;

  static ExtendedPoll fromPoll({
    required Poll poll,
    required bool isCompleted,
  }) {
    return ExtendedPoll(
      pollId: poll.pollId,
      question: poll.question,
      choices: poll.choices,
      createdAt: poll.createdAt,
      isCompleted: isCompleted,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'pollId': pollId,
      'question': question,
      'choices': choices.map((choice) => choice.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }
}

class ExtendedMultipleChoiceItem extends MultipleChoiceItem {
  final bool isCompleted;

  ExtendedMultipleChoiceItem({
    required super.multipleChoiceItemId,
    required super.multipleChoiceQuestions,
    required this.isCompleted,
  });
  static ExtendedMultipleChoiceItem fromMultipleChoiceItem({
    required MultipleChoiceItem item,
    required bool isCompleted,
  }) {
    return ExtendedMultipleChoiceItem(
      multipleChoiceItemId: item.multipleChoiceItemId,
      multipleChoiceQuestions: item.multipleChoiceQuestions,
      isCompleted: isCompleted,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'multipleChoiceItemId': multipleChoiceItemId,
      'multipleChoiceQuestions':
          multipleChoiceQuestions.map((question) => question.toJson()).toList(),
      'isCompleted': isCompleted,
    };
  }
}

class ExtendedBlogPost extends BlogPost {
  ExtendedBlogPost({
    required super.blogPostId,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.htmlContent,
    required super.meta,
    required super.quillDocData,
    required this.isCompleted,
  });

  final bool isCompleted;

  static ExtendedBlogPost fromBlogPost({
    required BlogPost blogPost,
    required bool isCompleted,
  }) {
    return ExtendedBlogPost(
      quillDocData: blogPost.quillDocData,
      blogPostId: blogPost.blogPostId,
      title: blogPost.title,
      description: blogPost.description,
      imageUrl: blogPost.imageUrl,
      htmlContent: blogPost.htmlContent,
      meta: blogPost.meta,
      isCompleted: isCompleted,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'blogPostId': blogPostId,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'htmlContent': htmlContent,
      'meta': meta.toJson(),
      'quillDocData': quillDocData,
      'isCompleted': isCompleted,
    };
  }
}
