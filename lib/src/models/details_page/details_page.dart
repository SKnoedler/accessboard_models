import 'package:accessboard_models/src/models/details_page/page_meta.dart';
import 'package:accessboard_models/src/models/localized_string/localized_quill_data.dart';
import 'package:accessboard_models/src/models/localized_string/localized_string.dart';

class DetailsPage {
  final String pageId;
  final LocalizedString htmlContent;
  final LocalizedString title;
  final PageMeta meta;
  final LocalizedQuillData? quillDocData;

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
      htmlContent: LocalizedString.fromJson(json['htmlContent']),
      title: LocalizedString.fromJson(json['title']),
      meta: PageMeta.fromJson(json['meta']),
      quillDocData: json['quillDocData'] != null
          ? LocalizedQuillData.fromJson(
              json['quillDocData'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pageId': pageId,
      'htmlContent': htmlContent.toJson(),
      'title': title.toJson(),
      'meta': meta.toJson(),
      'quillDocData': quillDocData != null ? quillDocData!.toJson() : null,
    };
  }

  DetailsPage copyWith({
    String? pageId,
    LocalizedString? htmlContent,
    LocalizedString? title,
    PageMeta? meta,
    LocalizedQuillData? quillDocData,
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
