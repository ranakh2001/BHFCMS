import '../entities/case_study_form_data.dart';

abstract class CaseStudyRepository {
  Future<CaseStudyFormData?> loadFormData(String userId);
  Future<void> saveFormData(String userId, CaseStudyFormData data);
  Future<void> clearFormData(String userId);
  bool isParentFirstLogin(String userId);
  Future<void> setParentFirstLogin(String userId, {required bool value});
}
