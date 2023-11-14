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
      languageCode: Language.values[json['languageCode']],
      translation: json['translation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'languageCode': languageCode.index,
      'translation': translation,
    };
  }
}