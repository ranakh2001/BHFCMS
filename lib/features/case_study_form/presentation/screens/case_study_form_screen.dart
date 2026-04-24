import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../domain/entities/case_study_form_data.dart';
import '../providers/case_study_provider.dart';
import '../sections/section_1_child_info.dart';
import '../sections/section_2_family_info.dart';
import '../sections/section_3_socioeconomic.dart';
import '../sections/section_4_medical_pregnancy.dart';
import '../sections/section_5_birth_period.dart';
import '../sections/section_6_post_birth.dart';
import '../sections/section_7_behavioral.dart';
import '../sections/section_8_motor_development.dart';
import '../sections/section_9_language.dart';
import '../sections/section_10_cognitive.dart';
import '../sections/section_11_social.dart';
import '../sections/section_12_educational.dart';
import '../sections/section_13_self_care.dart';
import '../widgets/form_step_indicator.dart';

/// Main wrapper that hosts all 13 sections in a non-swipeable [PageView].
/// Navigation happens only via the validated "Next" button in each section.
class CaseStudyFormScreen extends ConsumerStatefulWidget {
  const CaseStudyFormScreen({super.key});

  @override
  ConsumerState<CaseStudyFormScreen> createState() =>
      _CaseStudyFormScreenState();
}

class _CaseStudyFormScreenState extends ConsumerState<CaseStudyFormScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _animateToStep(int step) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        step,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _onSection1Next(Section1Data data) async {
    await ref.read(caseStudyFormProvider.notifier).submitSection1(data);
    _animateToStep(1);
  }

  Future<void> _onSection2Next(Section2Data data) async {
    await ref.read(caseStudyFormProvider.notifier).submitSection2(data);
    _animateToStep(2);
  }

  Future<void> _onSection3Next(Section3Data data) async {
    await ref.read(caseStudyFormProvider.notifier).submitSection3(data);
    _animateToStep(3);
  }

  Future<void> _onSection4Next(Section4Data data) async {
    await ref.read(caseStudyFormProvider.notifier).submitSection4(data);
    _animateToStep(4);
  }

  Future<void> _onSection5Next(Section5Data data) async {
    await ref.read(caseStudyFormProvider.notifier).submitSection5(data);
    _animateToStep(5);
  }

  Future<void> _onSection6Next(Section6Data data) async {
    await ref.read(caseStudyFormProvider.notifier).submitSection6(data);
    _animateToStep(6);
  }

  Future<void> _onSection7Next(Section7Data data) async {
    await ref.read(caseStudyFormProvider.notifier).submitSection7(data);
    _animateToStep(7);
  }

  Future<void> _onSection8Next(Section8Data data) async {
    await ref.read(caseStudyFormProvider.notifier).submitSection8(data);
    _animateToStep(8);
  }

  Future<void> _onSection9Next(Section9Data data) async {
    await ref.read(caseStudyFormProvider.notifier).submitSection9(data);
    _animateToStep(9);
  }

  Future<void> _onSection10Next(Section10Data data) async {
    await ref.read(caseStudyFormProvider.notifier).submitSection10(data);
    _animateToStep(10);
  }

  Future<void> _onSection11Next(Section11Data data) async {
    await ref.read(caseStudyFormProvider.notifier).submitSection11(data);
    _animateToStep(11);
  }

  Future<void> _onSection12Next(Section12Data data) async {
    await ref.read(caseStudyFormProvider.notifier).submitSection12(data);
    _animateToStep(12);
  }

  Future<void> _onSection13Next(Section13Data data) async {
    await ref.read(caseStudyFormProvider.notifier).submitSection13(data);
    if (mounted) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.main);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(caseStudyFormProvider);

    // Handles two post-load scenarios detected by the isLoading transition:
    // 1. Form already completed (crash-recovery path) → navigate to Home.
    // 2. In-progress form restored → jump PageView to the saved step.
    ref.listen<CaseStudyFormState>(caseStudyFormProvider, (prev, next) {
      if (!next.isLoading && prev?.isLoading == true) {
        if (next.isCompleted) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              Navigator.of(context).pushReplacementNamed(AppRoutes.main);
            }
          });
        } else if (next.currentStep > 0 && _pageController.hasClients) {
          _pageController.jumpToPage(next.currentStep);
        }
      }
    });

    return PopScope(
      canPop: formState.currentStep == 0,
      onPopInvokedWithResult: (didPop, _) async {
        if (!didPop && formState.currentStep > 0) {
          final prev = formState.currentStep - 1;
          await ref.read(caseStudyFormProvider.notifier).goBack();
          _animateToStep(prev);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: formState.isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: AppColors.primary))
              : Column(
                  children: [
                    // ── Progress bar ────────────────────────────────────
                    FormStepIndicator(
                      currentStep: formState.currentStep,
                      totalSteps: CaseStudyFormState.totalSteps,
                    ),

                    // ── Section pages ───────────────────────────────────
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          // ── Section 1: Child Info ─────────────────────
                          _SectionPage(
                            child: Section1ChildInfo(
                              initialData: formState.section1,
                              onNext: _onSection1Next,
                              isSaving: formState.isSaving,
                            ),
                          ),
                          // ── Section 2: Family Info ────────────────────
                          _SectionPage(
                            child: Section2FamilyInfo(
                              initialData: formState.section2,
                              onNext: _onSection2Next,
                              isSaving: formState.isSaving,
                            ),
                          ),
                          // ── Section 3: Socioeconomic ──────────────────
                          _SectionPage(
                            child: Section3Socioeconomic(
                              initialData: formState.section3,
                              onNext: _onSection3Next,
                              isSaving: formState.isSaving,
                            ),
                          ),
                          // ── Section 4: Medical (Pregnancy) ────────────
                          _SectionPage(
                            child: Section4MedicalPregnancy(
                              initialData: formState.section4,
                              onNext: _onSection4Next,
                              isSaving: formState.isSaving,
                            ),
                          ),
                          // ── Section 5: Birth Period ───────────────────
                          _SectionPage(
                            child: Section5BirthPeriod(
                              initialData: formState.section5,
                              onNext: _onSection5Next,
                              isSaving: formState.isSaving,
                            ),
                          ),
                          // ── Section 6: Post-Birth ─────────────────────
                          _SectionPage(
                            child: Section6PostBirth(
                              initialData: formState.section6,
                              onNext: _onSection6Next,
                              isSaving: formState.isSaving,
                            ),
                          ),
                          // ── Section 7: Behavioral ─────────────────────
                          _SectionPage(
                            child: Section7Behavioral(
                              initialData: formState.section7,
                              onNext: _onSection7Next,
                              isSaving: formState.isSaving,
                            ),
                          ),
                          // ── Section 8: Motor Development ──────────────
                          _SectionPage(
                            child: Section8MotorDevelopment(
                              initialData: formState.section8,
                              onNext: _onSection8Next,
                              isSaving: formState.isSaving,
                            ),
                          ),
                          // ── Section 9: Language ───────────────────────
                          _SectionPage(
                            child: Section9Language(
                              initialData: formState.section9,
                              onNext: _onSection9Next,
                              isSaving: formState.isSaving,
                            ),
                          ),
                          // ── Section 10: Cognitive ─────────────────────
                          _SectionPage(
                            child: Section10Cognitive(
                              initialData: formState.section10,
                              onNext: _onSection10Next,
                              isSaving: formState.isSaving,
                            ),
                          ),
                          // ── Section 11: Social ────────────────────────
                          _SectionPage(
                            child: Section11Social(
                              initialData: formState.section11,
                              onNext: _onSection11Next,
                              isSaving: formState.isSaving,
                            ),
                          ),
                          // ── Section 12: Educational ───────────────────
                          _SectionPage(
                            child: Section12Educational(
                              initialData: formState.section12,
                              onNext: _onSection12Next,
                              isSaving: formState.isSaving,
                            ),
                          ),
                          // ── Section 13: Self-Care ─────────────────────
                          _SectionPage(
                            child: Section13SelfCare(
                              initialData: formState.section13,
                              onNext: _onSection13Next,
                              isSaving: formState.isSaving,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

/// Scrollable page wrapper with consistent horizontal padding.
class _SectionPage extends StatelessWidget {
  final Widget child;

  const _SectionPage({required this.child});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveHelper(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.scaleSpacing(20),
        vertical: responsive.scaleSpacing(20),
      ),
      child: child,
    );
  }
}
