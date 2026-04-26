import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/providers.dart';
import '../../../auth/domain/entities/user_role.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/repositories/case_study_repository_impl.dart';
import '../../data/sources/case_study_local_data_source.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../../domain/repositories/case_study_repository.dart';

// ---------------------------------------------------------------------------
// Infrastructure providers
// ---------------------------------------------------------------------------

final caseStudyLocalDataSourceProvider =
    Provider<CaseStudyLocalDataSource>((ref) {
  return CaseStudyLocalDataSource(ref.watch(sharedPrefServiceProvider));
});

final caseStudyRepositoryProvider = Provider<CaseStudyRepository>((ref) {
  return CaseStudyRepositoryImpl(ref.watch(caseStudyLocalDataSourceProvider));
});

// ---------------------------------------------------------------------------
// Form state
// ---------------------------------------------------------------------------

class CaseStudyFormState {
  static const int totalSteps = 15;

  final int currentStep;
  final bool isLoading;
  final bool isSaving;
  final Section1Data? section1;
  final Section2Data? section2;
  final Section3Data? section3;
  final Section4Data? section4;
  final Section5Data? section5;
  final Section6Data? section6;
  final Section7Data? section7;
  final Section8Data? section8;
  final Section9Data? section9;
  final Section10Data? section10;
  final Section11Data? section11;
  final SectionDocumentsConsentData? sectionDocs;
  final Section13Data? section13;
  final Section14Data? section14;
  final Section15Data? section15;
  final bool isCompleted;

  const CaseStudyFormState({
    this.currentStep = 0,
    this.isLoading = false,
    this.isSaving = false,
    this.section1,
    this.section2,
    this.section3,
    this.section4,
    this.section5,
    this.section6,
    this.section7,
    this.section8,
    this.section9,
    this.section10,
    this.section11,
    this.sectionDocs,
    this.section13,
    this.section14,
    this.section15,
    this.isCompleted = false,
  });

  CaseStudyFormState copyWith({
    int? currentStep,
    bool? isLoading,
    bool? isSaving,
    Section1Data? section1,
    Section2Data? section2,
    Section3Data? section3,
    Section4Data? section4,
    Section5Data? section5,
    Section6Data? section6,
    Section7Data? section7,
    Section8Data? section8,
    Section9Data? section9,
    Section10Data? section10,
    Section11Data? section11,
    SectionDocumentsConsentData? sectionDocs,
    Section13Data? section13,
    Section14Data? section14,
    Section15Data? section15,
    bool? isCompleted,
  }) =>
      CaseStudyFormState(
        currentStep: currentStep ?? this.currentStep,
        isLoading: isLoading ?? this.isLoading,
        isSaving: isSaving ?? this.isSaving,
        section1: section1 ?? this.section1,
        section2: section2 ?? this.section2,
        section3: section3 ?? this.section3,
        section4: section4 ?? this.section4,
        section5: section5 ?? this.section5,
        section6: section6 ?? this.section6,
        section7: section7 ?? this.section7,
        section8: section8 ?? this.section8,
        section9: section9 ?? this.section9,
        section10: section10 ?? this.section10,
        section11: section11 ?? this.section11,
        sectionDocs: sectionDocs ?? this.sectionDocs,
        section13: section13 ?? this.section13,
        section14: section14 ?? this.section14,
        section15: section15 ?? this.section15,
        isCompleted: isCompleted ?? this.isCompleted,
      );
}

// ---------------------------------------------------------------------------
// Notifier
// ---------------------------------------------------------------------------

class CaseStudyFormNotifier extends Notifier<CaseStudyFormState> {
  String _userId = '';

  @override
  CaseStudyFormState build() {
    final user = ref.watch(currentUserProvider);
    _userId = user?.id ?? '';
    _loadSavedData();
    return const CaseStudyFormState(isLoading: true);
  }

  Future<void> _loadSavedData() async {
    if (_userId.isEmpty) {
      state = state.copyWith(isLoading: false);
      return;
    }
    final saved =
        await ref.read(caseStudyRepositoryProvider).loadFormData(_userId);
    if (saved == null) {
      state = state.copyWith(isLoading: false);
      return;
    }
    // Self-heal: if the form was completed but the first-login flag was never
    // cleared (e.g. app was killed between the two writes), fix it now.
    if (saved.isCompleted) {
      await ref
          .read(caseStudyRepositoryProvider)
          .setParentFirstLogin(_userId, value: false);
    }
    state = state.copyWith(
      isLoading: false,
      currentStep: saved.currentStep,
      section1: saved.section1,
      section2: saved.section2,
      section3: saved.section3,
      section4: saved.section4,
      section5: saved.section5,
      section6: saved.section6,
      section7: saved.section7,
      section8: saved.section8,
      section9: saved.section9,
      section10: saved.section10,
      section11: saved.section11,
      sectionDocs: saved.sectionDocs,
      section13: saved.section13,
      section14: saved.section14,
      section15: saved.section15,
      isCompleted: saved.isCompleted,
    );
  }

  Future<void> _persist() async {
    if (_userId.isEmpty) return;
    await ref.read(caseStudyRepositoryProvider).saveFormData(
          _userId,
          CaseStudyFormData(
            currentStep: state.currentStep,
            section1: state.section1,
            section2: state.section2,
            section3: state.section3,
            section4: state.section4,
            section5: state.section5,
            section6: state.section6,
            section7: state.section7,
            section8: state.section8,
            section9: state.section9,
            section10: state.section10,
            section11: state.section11,
            sectionDocs: state.sectionDocs,
            section13: state.section13,
            section14: state.section14,
            section15: state.section15,
            isCompleted: state.isCompleted,
          ),
        );
  }

  Future<void> submitSection1(Section1Data data) async {
    state = state.copyWith(section1: data, currentStep: 1, isSaving: true);
    await _persist();
    state = state.copyWith(isSaving: false);
  }

  Future<void> submitSection2(Section2Data data) async {
    state = state.copyWith(section2: data, currentStep: 2, isSaving: true);
    await _persist();
    state = state.copyWith(isSaving: false);
  }

  Future<void> submitSection3(Section3Data data) async {
    state = state.copyWith(section3: data, currentStep: 3, isSaving: true);
    await _persist();
    state = state.copyWith(isSaving: false);
  }

  Future<void> submitSection4(Section4Data data) async {
    state = state.copyWith(section4: data, currentStep: 4, isSaving: true);
    await _persist();
    state = state.copyWith(isSaving: false);
  }

  Future<void> submitSection5(Section5Data data) async {
    state = state.copyWith(section5: data, currentStep: 5, isSaving: true);
    await _persist();
    state = state.copyWith(isSaving: false);
  }

  Future<void> submitSection6(Section6Data data) async {
    state = state.copyWith(section6: data, currentStep: 6, isSaving: true);
    await _persist();
    state = state.copyWith(isSaving: false);
  }

  Future<void> submitSection7(Section7Data data) async {
    state = state.copyWith(section7: data, currentStep: 7, isSaving: true);
    await _persist();
    state = state.copyWith(isSaving: false);
  }

  Future<void> submitSection8(Section8Data data) async {
    state = state.copyWith(section8: data, currentStep: 8, isSaving: true);
    await _persist();
    state = state.copyWith(isSaving: false);
  }

  Future<void> submitSection9(Section9Data data) async {
    state = state.copyWith(section9: data, currentStep: 9, isSaving: true);
    await _persist();
    state = state.copyWith(isSaving: false);
  }

  Future<void> submitSection10(Section10Data data) async {
    state = state.copyWith(section10: data, currentStep: 10, isSaving: true);
    await _persist();
    state = state.copyWith(isSaving: false);
  }

  Future<void> submitSection11(Section11Data data) async {
    state = state.copyWith(section11: data, currentStep: 11, isSaving: true);
    await _persist();
    state = state.copyWith(isSaving: false);
  }

  Future<void> submitSectionDocs(SectionDocumentsConsentData data) async {
    state = state.copyWith(sectionDocs: data, currentStep: 12, isSaving: true);
    await _persist();
    state = state.copyWith(isSaving: false);
  }

  Future<void> submitSection13(Section13Data data) async {
    state = state.copyWith(section13: data, currentStep: 13, isSaving: true);
    await _persist();
    state = state.copyWith(isSaving: false);
  }

  Future<void> submitSection14(Section14Data data) async {
    state = state.copyWith(section14: data, currentStep: 14, isSaving: true);
    await _persist();
    state = state.copyWith(isSaving: false);
  }

  Future<void> submitSection15(Section15Data data) async {
    state = state.copyWith(section15: data, isSaving: true);
    // Clear the first-login flag BEFORE marking the form as complete in state.
    // This ensures that if the app is killed between the two writes, the flag
    // is already false on the next launch and the user goes straight to Home.
    await ref
        .read(caseStudyRepositoryProvider)
        .setParentFirstLogin(_userId, value: false);
    state = state.copyWith(isCompleted: true);
    await _persist();
    state = state.copyWith(isSaving: false);
  }

  /// Moves back one step without losing saved section data.
  Future<void> goBack() async {
    if (state.currentStep == 0) return;
    final prev = state.currentStep - 1;
    state = state.copyWith(currentStep: prev, isSaving: true);
    await _persist();
    state = state.copyWith(isSaving: false);
  }

  /// Called after ALL 15 sections are completed (kept for compatibility).
  Future<void> completeForm() async {
    if (_userId.isEmpty) return;
    state = state.copyWith(isSaving: true);
    await ref
        .read(caseStudyRepositoryProvider)
        .setParentFirstLogin(_userId, value: false);
    state = state.copyWith(isCompleted: true);
    await _persist();
    state = state.copyWith(isSaving: false);
  }
}

final caseStudyFormProvider =
    NotifierProvider<CaseStudyFormNotifier, CaseStudyFormState>(
  CaseStudyFormNotifier.new,
);

/// Convenience: whether the currently-logged parent still needs to fill the form.
final parentNeedsFormProvider = Provider<bool>((ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null || user.role != UserRole.parent) return false;
  final repo = ref.watch(caseStudyRepositoryProvider);
  return repo.isParentFirstLogin(user.id);
});

/// Access control for the case study form.
final caseStudyAccessProvider = Provider<bool>((ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null) return false;
  return user.role == UserRole.therapist || user.role == UserRole.receptionist;
});
