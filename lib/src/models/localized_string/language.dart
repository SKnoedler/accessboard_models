enum Language {
  english,
  spanish,
  french,
  german,
  chinese,
  japanese,
  russian,
  portuguese,
  arabic,
  korean,
}

extension LanguageExtension on Language {
  String get code {
    switch (this) {
      case Language.english:
        return 'en';
      case Language.spanish:
        return 'es';
      case Language.french:
        return 'fr';
      case Language.german:
        return 'de';
      case Language.chinese:
        return 'zh';
      case Language.japanese:
        return 'ja';
      case Language.russian:
        return 'ru';
      case Language.portuguese:
        return 'pt';
      case Language.arabic:
        return 'ar';
      case Language.korean:
        return 'ko';
    }
  }

  static Language fromCode(String code) {
    switch (code) {
      case 'en':
        return Language.english;
      case 'es':
        return Language.spanish;
      case 'fr':
        return Language.french;
      case 'de':
        return Language.german;
      case 'zh':
        return Language.chinese;
      case 'ja':
        return Language.japanese;
      case 'ru':
        return Language.russian;
      case 'pt':
        return Language.portuguese;
      case 'ar':
        return Language.arabic;
      case 'ko':
        return Language.korean;
      default:
        throw ArgumentError('Invalid language code: $code');
    }
  }
}
