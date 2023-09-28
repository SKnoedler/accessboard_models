import 'package:accessboard_models/models/multiple_choice/multiple_choice_answer_choice.dart';

abstract class FeedItem {
  final String id;
  final String type;

  FeedItem({
    required this.id,
    required this.type,
  });

  factory FeedItem.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'blog_post':
        return BlogPost.fromJson(json);
      case 'multiple_choice_question':
        return MultipleChoiceQuestion.fromJson(json);
      default:
        throw ArgumentError('Invalid type: ${json['type']}');
    }
  }

  Map<String, dynamic> toJson() {
    switch (type) {
      case 'blog_post':
        return (this as BlogPost).toJson();
      case 'multiple_choice_question':
        return (this as MultipleChoiceQuestion).toJson();
      default:
        throw StateError('Invalid type: $type');
    }
  }
}

class BlogPost extends FeedItem {
  final String blogPostId;
  final String title;
  final String description;
  final String htmlContent;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime expiresAt;
  final String? image;
  final String? feedbackQuestion;
  final List<String> newsletterFeedbackIds;

  BlogPost({
    required this.blogPostId,
    required this.title,
    required this.description,
    required this.htmlContent,
    required this.createdAt,
    required this.updatedAt,
    required this.expiresAt,
    this.image,
    this.feedbackQuestion,
    this.newsletterFeedbackIds = const [],
  }) : super(
          id: blogPostId,
          type: 'blog_post',
        );

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      blogPostId: json['blogPostId'],
      title: json['title'],
      description: json['description'],
      htmlContent: json['htmlContent'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      expiresAt: DateTime.parse(json['expiresAt']),
      image: json['image'],
      feedbackQuestion: json['feedbackQuestion'],
      newsletterFeedbackIds: List<String>.from(json['newsletterFeedbackIds']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'blogPostId': blogPostId,
      'title': title,
      'description': description,
      'htmlContent': htmlContent,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'expiresAt': expiresAt.toIso8601String(),
      'image': image,
      'feedbackQuestion': feedbackQuestion,
      'newsletterFeedbackIds': newsletterFeedbackIds,
    };
  }
}

class MultipleChoiceQuestion extends FeedItem {
  final String multipleChoiceQuestionId;
  final String question;
  final List<MultipleChoiceAnswerChoice> choices;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime expiresAt;
  final List<String> multipleChoiceFeedbackIds;

  MultipleChoiceQuestion({
    required this.multipleChoiceQuestionId,
    required this.question,
    required this.choices,
    required this.createdAt,
    required this.updatedAt,
    required this.expiresAt,
    this.multipleChoiceFeedbackIds = const [],
  }) : super(id: multipleChoiceQuestionId, type: 'multiple_choice_question');

  factory MultipleChoiceQuestion.fromJson(Map<String, dynamic> json) {
    return MultipleChoiceQuestion(
      multipleChoiceQuestionId: json['multipleChoiceQuestionId'],
      question: json['question'],
      choices: List<MultipleChoiceAnswerChoice>.from(json['choices']
          .map((choice) => MultipleChoiceAnswerChoice.fromJson(choice))),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      expiresAt: DateTime.parse(json['expiresAt']),
      multipleChoiceFeedbackIds:
          List<String>.from(json['multipleChoiceFeedbackIds']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'multipleChoiceQuestionId': multipleChoiceQuestionId,
      'question': question,
      'choices': choices.map((choice) => choice.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'expiresAt': expiresAt.toIso8601String(),
      'multipleChoiceFeedbackIds': multipleChoiceFeedbackIds,
    };
  }
}
