import 'package:accessboard_models/src/models/localized_string/language.dart';

class LocalizedString {
  final List<TranslationItem> translations;

  LocalizedString({
    required this.translations,
  }) {
    assert(translations.isNotEmpty,
        'translations must have at least one translation');
  }

  factory LocalizedString.fromJson(Map<String, dynamic> json) {
    var translationsList = json['translations'] as List;
    List<TranslationItem> translations =
        translationsList.map((item) => TranslationItem.fromJson(item)).toList();

    return LocalizedString(
      translations: translations,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> translationsJson =
        translations.map((item) => item.toJson()).toList();

    return {
      'translations': translationsJson,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocalizedString &&
        _listEquals(other.translations, translations);
  }

  @override
  int get hashCode => translations.hashCode;

  bool _listEquals(List<TranslationItem> a, List<TranslationItem> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}

class TranslationItem {
  final Language languageCode;
  final String translation;

  TranslationItem({
    required this.languageCode,
    required this.translation,
  });

  factory TranslationItem.fromJson(Map<String, dynamic> json) {
    return TranslationItem(
      languageCode: LanguageExtension.fromCode(json['languageCode']),
      translation: json['translation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'languageCode': languageCode.code,
      'translation': translation,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TranslationItem &&
        other.languageCode == languageCode &&
        other.translation == translation;
  }

  @override
  int get hashCode => languageCode.hashCode ^ translation.hashCode;
}
