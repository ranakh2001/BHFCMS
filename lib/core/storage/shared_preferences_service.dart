import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _prefs;

  SharedPreferencesService(this._prefs);

  static const String _keyLanguage = 'app_language';
  static const String _keyThemeMode = 'app_theme_mode';
  static const String _keyFirstLaunch = 'app_first_launch';

  // Language
  String get language => _prefs.getString(_keyLanguage) ?? 'en';
  Future<void> setLanguage(String langCode) async => await _prefs.setString(_keyLanguage, langCode);

  // Theme Mode (light, dark, system)
  String get themeMode => _prefs.getString(_keyThemeMode) ?? 'system';
  Future<void> setThemeMode(String mode) async => await _prefs.setString(_keyThemeMode, mode);

  // First Launch / Onboarding
  bool get isFirstLaunch => _prefs.getBool(_keyFirstLaunch) ?? true;
  Future<void> setFirstLaunch(bool value) async => await _prefs.setBool(_keyFirstLaunch, value);
}
