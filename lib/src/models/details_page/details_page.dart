import 'package:accessboard_models/src/models/details_page/page_meta.dart';

class DetailsPage {
  final String pageId;
  final String htmlContent;
  final String title;
  final PageMeta meta;
  final List<dynamic>? quillDocData;

  DetailsPage({
    required this.pageId,
    required this.htmlContent,
    required this.title,
    required this.meta,
    this.quillDocData,
  });

  factory DetailsPage.fromJson(Map<String, dynamic> json) {
    return DetailsPage(
      pageId: json['pageId'] as String,
      htmlContent: json['htmlContent'] as String,
      title: json['title'] as String,
      meta: PageMeta.fromJson(json['meta']),
      quillDocData: json['quillDocData'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pageId': pageId,
      'htmlContent': htmlContent,
      'title': title,
      'meta': meta.toJson(),
      'quillDocData': quillDocData,
    };
  }

  DetailsPage copyWith({
    String? pageId,
    String? htmlContent,
    String? title,
    PageMeta? meta,
    List<dynamic>? quillDocData,
  }) {
    return DetailsPage(
      pageId: pageId ?? this.pageId,
      htmlContent: htmlContent ?? this.htmlContent,
      title: title ?? this.title,
      meta: meta ?? this.meta,
      quillDocData: quillDocData ?? this.quillDocData,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DetailsPage &&
        other.pageId == pageId &&
        other.htmlContent == htmlContent &&
        other.title == title &&
        other.meta == meta &&
        other.quillDocData == quillDocData;
  }

  @override
  int get hashCode =>
      pageId.hashCode ^
      htmlContent.hashCode ^
      title.hashCode ^
      meta.hashCode ^
      quillDocData.hashCode;
}
