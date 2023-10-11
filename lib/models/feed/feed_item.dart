import 'package:accessboard_models/models/blog_post/blog_post_feedback_question.dart';
import 'package:accessboard_models/models/blog_post/blog_post_model.dart';
import 'package:accessboard_models/models/blog_post/feed_item_meta.dart';
import 'package:accessboard_models/models/design/custom_design.dart';
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
      case MultipleChoiceItem.typeName:
        return MultipleChoiceItem.fromJson(json);
      default:
        throw ArgumentError('Invalid type: ${json['type']}');
    }
  }

  factory FeedItem.fromStorageJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case Poll.typeName:
        return ExtendedPoll.fromJson(json);
      case BlogPost.typeName:
        return ExtendedBlogPost.fromJson(json);
      case MultipleChoiceItem.typeName:
        return ExtendedMultipleChoiceItem.fromJson(json);
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
        return (this as ExtendedBlogPost).toJson();
      case MultipleChoiceItem.typeName:
        return (this as ExtendedMultipleChoiceItem).toJson();
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
          type == other.type;

  @override
  int get hashCode => id.hashCode ^ type.hashCode;
}

class ExtendedPoll extends Poll {
  ExtendedPoll({
    required super.pollId,
    required super.question,
    required super.choices,
    required super.customDesign,
    required this.isNew,
    required super.meta,
    required this.isCompleted,
  });

  final bool isCompleted;
  final bool isNew;

  static ExtendedPoll fromPoll({
    required Poll poll,
    required bool isCompleted,
    required bool isNew,
  }) {
    return ExtendedPoll(
      pollId: poll.pollId,
      question: poll.question,
      choices: poll.choices,
      customDesign: poll.customDesign,
      isNew: isNew,
      meta: poll.meta,
      isCompleted: isCompleted,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'pollId': pollId,
      'question': question,
      'choices': choices.map((choice) => choice.toJson()).toList(),
      'meta': meta.toJson(),
      'isCompleted': isCompleted,
      'type': type,
    };
  }

  factory ExtendedPoll.fromJson(Map<String, dynamic> json) {
    var choicesList = json['choices'] as List;
    List<PollChoice> choices =
        choicesList.map((choice) => PollChoice.fromJson(choice)).toList();

    return ExtendedPoll(
      pollId: json['pollId'],
      question: json['question'],
      choices: choices,
      meta: FeedItemMeta.fromJson(json['meta']),
      isCompleted: json['isCompleted'] ?? false,
      customDesign: json['customDesign'] != null
          ? CustomDesign.fromJson(json['customDesign'])
          : null,
      isNew: false,
    );
  }
}

class ExtendedMultipleChoiceItem extends MultipleChoiceItem {
  final bool isCompleted;
  final bool isNew;

  ExtendedMultipleChoiceItem({
    required super.multipleChoiceItemId,
    required super.multipleChoiceQuestions,
    required super.meta,
    required this.isCompleted,
    required this.isNew,
  });
  static ExtendedMultipleChoiceItem fromMultipleChoiceItem({
    required MultipleChoiceItem item,
    required bool isCompleted,
    required bool isNew,
  }) {
    return ExtendedMultipleChoiceItem(
      multipleChoiceItemId: item.multipleChoiceItemId,
      multipleChoiceQuestions: item.multipleChoiceQuestions,
      isCompleted: isCompleted,
      meta: item.meta,
      isNew: isNew,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'multipleChoiceItemId': multipleChoiceItemId,
      'multipleChoiceQuestions':
          multipleChoiceQuestions.map((question) => question.toJson()).toList(),
      'isCompleted': isCompleted,
      'meta': meta.toJson(),
      'type': type,
    };
  }

  @override
  factory ExtendedMultipleChoiceItem.fromJson(Map<String, dynamic> json) {
    var questionsList = json['multipleChoiceQuestions'] as List;
    List<MultipleChoiceQuestion> questions = questionsList
        .map((question) => MultipleChoiceQuestion.fromJson(question))
        .toList();

    return ExtendedMultipleChoiceItem(
      multipleChoiceItemId: json['multipleChoiceItemId'],
      multipleChoiceQuestions: questions,
      isCompleted: json['isCompleted'] ?? false,
      meta: FeedItemMeta.fromJson(json['meta']),
      isNew: false,
    );
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
    required this.isNew,
    required super.feedbackQuestion,
    required super.customDesign,
  });

  final bool isCompleted;
  final bool isNew;

  static ExtendedBlogPost fromBlogPost({
    required BlogPost blogPost,
    required bool isCompleted,
    required bool isNew,
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
      feedbackQuestion: blogPost.feedbackQuestion,
      customDesign: blogPost.customDesign,
      isNew: isNew,
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
      'type': type,
    };
  }

  @override
  factory ExtendedBlogPost.fromJson(Map<String, dynamic> json) {
    return ExtendedBlogPost(
      quillDocData: json['quillDocData'] != null
          ? (json['quillDocData'] as List<dynamic>)
          : null,
      blogPostId: json['blogPostId'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      htmlContent: json['htmlContent'],
      meta: FeedItemMeta.fromJson(json['meta']),
      isCompleted: json['isCompleted'] ?? false,
      feedbackQuestion: json['feedbackQuestion'] != null
          ? BlogPostFeedbackQuestion.fromJson(json['feedbackQuestion'])
          : null,
      customDesign: json['customDesign'] != null
          ? CustomDesign.fromJson(json['customDesign'])
          : null,
      isNew: false,
    );
  }
}
