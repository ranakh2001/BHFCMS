import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _prefs;

  SharedPreferencesService(this._prefs);

  // -------------------------------------------------------------------------
  // Keys
  // -------------------------------------------------------------------------

  static const _keyLanguage = 'app_language';
  static const _keyThemeMode = 'app_theme_mode';
  static const _keyFirstLaunch = 'app_first_launch';

  /// Persisted as a JSON string so no extra dependency is needed.
  static const _keySessionUser = 'session_user';

  // -------------------------------------------------------------------------
  // App settings
  // -------------------------------------------------------------------------

  String get language => _prefs.getString(_keyLanguage) ?? 'ar';
  Future<void> setLanguage(String langCode) =>
      _prefs.setString(_keyLanguage, langCode);

  String get themeMode => _prefs.getString(_keyThemeMode) ?? 'light';
  Future<void> setThemeMode(String mode) =>
      _prefs.setString(_keyThemeMode, mode);

  bool get isFirstLaunch => _prefs.getBool(_keyFirstLaunch) ?? true;
  Future<void> setFirstLaunch(bool value) =>
      _prefs.setBool(_keyFirstLaunch, value);

  // -------------------------------------------------------------------------
  // Session persistence
  // -------------------------------------------------------------------------

  /// Returns the raw JSON string of the persisted user, or null if none.
  String? get sessionUserJson => _prefs.getString(_keySessionUser);

  /// Stores [userJson] so the user stays logged in across restarts.
  Future<void> saveSessionUser(String userJson) =>
      _prefs.setString(_keySessionUser, userJson);

  /// Removes the persisted user — called on logout.
  Future<void> clearSessionUser() => _prefs.remove(_keySessionUser);

  // -------------------------------------------------------------------------
  // Parent first-login & case-study form persistence
  // -------------------------------------------------------------------------

  static const _keyParentFirstLoginPrefix = 'parent_first_login_';
  static const _keyCaseStudyFormPrefix = 'case_study_form_';

  /// Returns true (default) until the parent completes all 13 form sections.
  bool isParentFirstLogin(String userId) =>
      _prefs.getBool('$_keyParentFirstLoginPrefix$userId') ?? true;

  Future<void> setParentFirstLogin(String userId, {required bool value}) =>
      _prefs.setBool('$_keyParentFirstLoginPrefix$userId', value);

  /// Raw JSON of saved form progress for [userId], or null if none.
  String? getCaseStudyFormData(String userId) =>
      _prefs.getString('$_keyCaseStudyFormPrefix$userId');

  Future<void> saveCaseStudyFormData(String userId, String json) =>
      _prefs.setString('$_keyCaseStudyFormPrefix$userId', json);

  Future<void> clearCaseStudyFormData(String userId) =>
      _prefs.remove('$_keyCaseStudyFormPrefix$userId');
}
