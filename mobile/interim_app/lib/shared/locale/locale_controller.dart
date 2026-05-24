import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleController extends ChangeNotifier {
  LocaleController({LocaleStore? store}) : _store = store ?? LocaleStore();

  final LocaleStore _store;

  Locale? _locale;
  bool _isLoaded = false;

  Locale? get locale => _locale;
  bool get isLoaded => _isLoaded;

  Future<void> load() async {
    _locale = await _store.readLocale();
    _isLoaded = true;
    notifyListeners();
  }

  Future<void> setLocale(Locale? locale) async {
    _locale = locale;

    if (locale == null) {
      await _store.clearLocale();
    } else {
      await _store.saveLocale(locale);
    }

    notifyListeners();
  }
}

class LocaleStore {
  static const _localeKey = 'interim_locale_code';

  Future<Locale?> readLocale() async {
    final preferences = await SharedPreferences.getInstance();
    final code = preferences.getString(_localeKey);

    if (code == null || code.isEmpty) {
      return null;
    }

    return Locale(code);
  }

  Future<void> saveLocale(Locale locale) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_localeKey, locale.languageCode);
  }

  Future<void> clearLocale() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_localeKey);
  }
}
