import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';

import '../../../../core/theme/colors.dart';
import '../../../case_study_form/presentation/providers/case_study_provider.dart';
import '../../../case_study_form/presentation/providers/pdf_providers.dart';
import '../../../case_study_form/services/pdf_generator.dart';

class PdfPreviewScreen extends ConsumerWidget {
  const PdfPreviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final letterheadAsync = ref.watch(letterheadBgProvider);
    final overlayLetterhead = ref.watch(overlayLetterheadProvider);
    final formState = ref.watch(caseStudyFormProvider);
    final isArabic = Directionality.of(context) == TextDirection.rtl;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: Text(
          isArabic ? 'معاينة دراسة الحالة' : 'Case Study Preview',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ── Overlay toggle ────────────────────────────────────────────────
          Material(
            color: Colors.white,
            elevation: 1,
            child: SwitchListTile(
              activeThumbColor: AppColors.primary,
              title: Text(
                isArabic ? 'تضمين الترويسة في PDF' : 'Embed letterhead in PDF',
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 14),
              ),
              subtitle: Text(
                overlayLetterhead
                    ? (isArabic
                        ? 'للمشاركة الرقمية والبريد الإلكتروني'
                        : 'For digital sharing / email')
                    : (isArabic
                        ? 'للطباعة على ورق الترويسة الجاهز'
                        : 'For printing on pre-printed letterhead'),
                style: TextStyle(
                    fontSize: 12, color: Colors.grey.shade600),
              ),
              value: overlayLetterhead,
              onChanged: (v) =>
                  ref.read(overlayLetterheadProvider.notifier).state = v,
            ),
          ),

          // ── Preview area ──────────────────────────────────────────────────
          Expanded(
            child: letterheadAsync.when(
              loading: () => const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(color: AppColors.primary),
                    SizedBox(height: 12),
                    Text('جارٍ تحميل الترويسة...'),
                  ],
                ),
              ),
              error: (e, _) => _ErrorState(
                message: e.toString(),
                overlayLetterhead: overlayLetterhead,
                formState: formState,
              ),
              data: (letterheadBg) => PdfPreview(
                // A new key forces PdfPreview to rebuild when the toggle changes.
                key: ValueKey(overlayLetterhead),
                build: (format) async {
                  final generator = await PdfGenerator.create(
                    overlayLetterhead: overlayLetterhead,
                    letterheadBg: letterheadBg,
                  );
                  return generator.build(formState);
                },
                allowPrinting: true,
                allowSharing: true,
                canChangePageFormat: false,
                canChangeOrientation: false,
                pdfFileName:
                    'case_study_${DateTime.now().millisecondsSinceEpoch}.pdf',
                loadingWidget: const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Error state (letterhead failed, still lets user generate content-only PDF)

class _ErrorState extends ConsumerWidget {
  final String message;
  final bool overlayLetterhead;
  final dynamic formState;

  const _ErrorState({
    required this.message,
    required this.overlayLetterhead,
    required this.formState,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            border: Border.all(color: Colors.orange.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Icon(Icons.warning_amber_rounded,
                    color: Colors.orange.shade700, size: 20),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'الترويسة غير متاحة — سيتم إنشاء PDF بدون خلفية.',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ]),
              const SizedBox(height: 4),
              Text(
                'انسخ ملف PRINT-FILE-LETTERHEAD.pdf إلى assets/letterhead.pdf '
                'ثم أعد تشغيل التطبيق.',
                style: TextStyle(
                    fontSize: 12, color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
        Expanded(
          child: PdfPreview(
            key: ValueKey('no-letterhead-$overlayLetterhead'),
            build: (format) async {
              final generator = await PdfGenerator.create(
                overlayLetterhead: false,
                letterheadBg: null,
              );
              return generator.build(formState);
            },
            allowPrinting: true,
            allowSharing: true,
            canChangePageFormat: false,
            canChangeOrientation: false,
            pdfFileName:
                'case_study_${DateTime.now().millisecondsSinceEpoch}.pdf',
          ),
        ),
      ],
    );
  }
}
