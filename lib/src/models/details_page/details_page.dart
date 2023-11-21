import 'package:accessboard_models/src/models/details_page/page_meta.dart';
import 'package:accessboard_models/src/models/localized_string/localized_quill_data.dart';
import 'package:accessboard_models/src/models/localized_string/localized_string.dart';

class DetailsPage {
  final String pageId;
  final String projectId;
  final LocalizedString htmlContent;
  final LocalizedString title;
  final PageMeta meta;
  final LocalizedQuillData? quillDocData;

  DetailsPage({
    required this.pageId,
    required this.projectId,
    required this.htmlContent,
    required this.title,
    required this.meta,
    this.quillDocData,
  });

  factory DetailsPage.fromJson(Map<String, dynamic> json) {
    return DetailsPage(
      pageId: json['pageId'] as String,
      projectId: json['projectId'] as String,
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
      'projectId': projectId,
      'htmlContent': htmlContent.toJson(),
      'title': title.toJson(),
      'meta': meta.toJson(),
      'quillDocData': quillDocData?.toJson(),
    };
  }

  DetailsPage copyWith({
    LocalizedString? htmlContent,
    LocalizedString? title,
    PageMeta? meta,
    LocalizedQuillData? quillDocData,
  }) {
    return DetailsPage(
      pageId: pageId,
      projectId: projectId,
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
        other.projectId == projectId &&
        other.htmlContent == htmlContent &&
        other.title == title &&
        other.meta == meta &&
        other.quillDocData == quillDocData;
  }

  @override
  int get hashCode =>
      pageId.hashCode ^
      htmlContent.hashCode ^
      projectId.hashCode ^
      title.hashCode ^
      meta.hashCode ^
      quillDocData.hashCode;
}
