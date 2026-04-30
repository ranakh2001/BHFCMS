import '../../domain/entities/case_study_form_data.dart';
import '../../domain/repositories/case_study_repository.dart';
import '../sources/case_study_local_data_source.dart';

class CaseStudyRepositoryImpl implements CaseStudyRepository {
  final CaseStudyLocalDataSource _local;

  CaseStudyRepositoryImpl(this._local);

  @override
  Future<CaseStudyFormData?> loadFormData(String userId) =>
      _local.loadFormData(userId);

  @override
  Future<void> saveFormData(String userId, CaseStudyFormData data) =>
      _local.saveFormData(userId, data);

  @override
  Future<void> clearFormData(String userId) => _local.clearFormData(userId);

  @override
  bool isParentFirstLogin(String userId) => _local.isParentFirstLogin(userId);

  @override
  Future<void> setParentFirstLogin(String userId, {required bool value}) =>
      _local.setParentFirstLogin(userId, value: value);
}
