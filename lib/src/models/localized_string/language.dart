enum Language {
  english('en'),
  spanish('es'),
  french('fr'),
  german('de'),
  chinese('zh'),
  japanese('ja'),
  russian('ru'),
  portuguese('pt'),
  arabic('ar'),
  korean('ko');

  const Language(this.languageCode);

  final String languageCode;
}
