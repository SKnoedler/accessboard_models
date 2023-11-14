import 'package:accessboard_models/src/models/localized_string/language.dart';

class LocalizedQuillData {
  final List<LocalizedQuillDataItem> translations;

  LocalizedQuillData({
    required this.translations,
  }) {
    assert(translations.isNotEmpty,
        'translations must have at least one translation');
  }

  factory LocalizedQuillData.fromJson(Map<String, dynamic> json) {
    var translationsList = json['translations'] as List;
    List<LocalizedQuillDataItem> translations = translationsList
        .map((item) => LocalizedQuillDataItem.fromJson(item))
        .toList();

    return LocalizedQuillData(
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

class LocalizedQuillDataItem {
  final Language languageCode;
  final List<dynamic> translation;

  LocalizedQuillDataItem({
    required this.languageCode,
    required this.translation,
  });

  factory LocalizedQuillDataItem.fromJson(Map<String, dynamic> json) {
    return LocalizedQuillDataItem(
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
