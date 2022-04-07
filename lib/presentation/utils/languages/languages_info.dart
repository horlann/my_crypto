import 'dart:ui';

class LangArraysInfo {
  static List<Locale> getTranslateList() => [
        const Locale('en'),
        const Locale('ru'),
        const Locale('uk'),
      ];

  static List<String> getLanguageNames() => [
        'English',
        'Русский',
        'Українська',
      ];

  static List<String> getLanguageEnglishNames() => [
        'English',
        'Russian',
        'Ukrainian',
      ];

  static List<String> getLanguageCodes() => ['en', 'ru', 'uk'];

  static List<String> getFlags() => [
        'en',
        'ru',
        'uk',
      ];
}
