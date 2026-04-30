import 'dart:convert';

import '../../../../core/storage/shared_preferences_service.dart';
import '../../domain/entities/case_study_form_data.dart';

class CaseStudyLocalDataSource {
  final SharedPreferencesService _prefs;

  CaseStudyLocalDataSource(this._prefs);

  Future<CaseStudyFormData?> loadFormData(String userId) async {
    final raw = _prefs.getCaseStudyFormData(userId);
    if (raw == null) return null;
    try {
      return CaseStudyFormData.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> saveFormData(String userId, CaseStudyFormData data) =>
      _prefs.saveCaseStudyFormData(userId, jsonEncode(data.toJson()));

  Future<void> clearFormData(String userId) =>
      _prefs.clearCaseStudyFormData(userId);

  bool isParentFirstLogin(String userId) => _prefs.isParentFirstLogin(userId);

  Future<void> setParentFirstLogin(String userId, {required bool value}) =>
      _prefs.setParentFirstLogin(userId, value: value);
}
