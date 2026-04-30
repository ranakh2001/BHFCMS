import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/pdf_picker.dart';
import '../../../../core/utils/responsive_helper.dart';

// ── Document type ─────────────────────────────────────────────────────────────

enum _DocType { image, pdf }

// ── Screen ────────────────────────────────────────────────────────────────────

class AddChildScreen extends ConsumerStatefulWidget {
  const AddChildScreen({super.key});

  @override
  ConsumerState<AddChildScreen> createState() => _AddChildScreenState();
}

class _AddChildScreenState extends ConsumerState<AddChildScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  // Page 1 state
  final _infoFormKey = GlobalKey<FormState>();
  final _childNameCtrl = TextEditingController();
  final _nationalIdCtrl = TextEditingController();
  final _ageCtrl = TextEditingController();
  String? _selectedGender;
  String? _selectedDiagnosis;
  DateTime? _birthDate;
  String? _selectedFamily;

  // Page 2 state
  final _documents = <_DocumentEntry>[];

  bool _isSaving = false;

  static const _genders = <String>['male', 'female'];
  static const _diagnoses = [
    'اضطراب طيف التوحد',
    'تأخر اللغة',
    'صعوبات التعلم',
    'فرط الحركة وتشتت الانتباه',
    'إعاقة ذهنية',
    'أخرى',
  ];
  static const _families = [
    'عائلة محمد الأحمد',
    'عائلة فهد العتيبي',
    'عائلة عمر فاروق',
    'عائلة زيد السلطان',
    'عائلة سالم المطيري',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    _childNameCtrl.dispose();
    _nationalIdCtrl.dispose();
    _ageCtrl.dispose();
    super.dispose();
  }

  void _goToPage2() {
    if (!_infoFormKey.currentState!.validate()) return;
    _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
    setState(() => _currentPage = 1);
  }

  Future<void> _save() async {
    setState(() => _isSaving = true);
    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;
    setState(() => _isSaving = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.saveSuccess),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
    Navigator.of(context).pop();
  }

  Future<void> _pickDate(BuildContext context, ResponsiveHelper res) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime(2015),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: AppColors.primary),
        ),
        child: child!,
      ),
    );
    if (picked != null) {
      setState(() {
        _birthDate = picked;
        final age = DateTime.now().year - picked.year;
        _ageCtrl.text = age.toString();
      });
    }
  }

  Future<void> _addDocument(AppLocalizations l10n) async {
    final nameCtrl = TextEditingController();
    String? pickedPath;
    String? pickedFileName;
    _DocType? pickedType;
    final isTablet = MediaQuery.of(context).size.width >= 600;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        final sheet = _AddDocumentSheet(
          l10n: l10n,
          nameCtrl: nameCtrl,
          onFilePicked: (path, fileName, type) {
            pickedPath = path;
            pickedFileName = fileName;
            pickedType = type;
          },
          onConfirm: () {
            if (nameCtrl.text.isNotEmpty && pickedPath != null) {
              setState(() {
                _documents.add(_DocumentEntry(
                  name: nameCtrl.text,
                  filePath: pickedPath!,
                  fileName: pickedFileName!,
                  type: pickedType!,
                ));
              });
              Navigator.of(ctx).pop();
            }
          },
        );
        if (isTablet) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: sheet,
            ),
          );
        }
        return sheet;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.surfaceDark : Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          l10n.addChildTitle,
          style: TextStyle(
            fontSize: res.scaleText(18),
            fontWeight: FontWeight.w700,
            color: isDark ? Colors.white : AppColors.textPrimary,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded,
              size: res.scaleText(20),
              color: isDark ? Colors.white : AppColors.textPrimary),
          onPressed: () {
            if (_currentPage == 1) {
              _pageController.animateToPage(0,
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOut);
              setState(() => _currentPage = 0);
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(res.scaleHeight(4)),
          child: _ProgressBar(res: res, currentPage: _currentPage),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _Page1PersonalInfo(
              res: res,
              isDark: isDark,
              l10n: l10n,
              formKey: _infoFormKey,
              childNameCtrl: _childNameCtrl,
              nationalIdCtrl: _nationalIdCtrl,
              ageCtrl: _ageCtrl,
              selectedGender: _selectedGender,
              selectedDiagnosis: _selectedDiagnosis,
              birthDate: _birthDate,
              selectedFamily: _selectedFamily,
              genders: _genders,
              diagnoses: _diagnoses,
              families: _families,
              onGenderChanged: (v) => setState(() => _selectedGender = v),
              onDiagnosisChanged: (v) =>
                  setState(() => _selectedDiagnosis = v),
              onFamilyChanged: (v) => setState(() => _selectedFamily = v),
              onPickDate: () => _pickDate(context, res),
              onNext: _goToPage2,
            ),
            _Page2Documents(
              res: res,
              isDark: isDark,
              l10n: l10n,
              documents: _documents,
              isSaving: _isSaving,
              onAddDocument: () => _addDocument(l10n),
              onRemoveDocument: (i) => setState(() => _documents.removeAt(i)),
              onSave: _save,
            ),
          ],
        ),
      ),
    );
  }
}

// ── Progress bar ──────────────────────────────────────────────────────────────

class _ProgressBar extends StatelessWidget {
  final ResponsiveHelper res;
  final int currentPage;

  const _ProgressBar({required this.res, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: res.scaleHeight(4),
            color: AppColors.primary,
          ),
        ),
        Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: res.scaleHeight(4),
            color: currentPage >= 1
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.2),
          ),
        ),
      ],
    );
  }
}

// ── Page 1 ────────────────────────────────────────────────────────────────────

class _Page1PersonalInfo extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final AppLocalizations l10n;
  final GlobalKey<FormState> formKey;
  final TextEditingController childNameCtrl;
  final TextEditingController nationalIdCtrl;
  final TextEditingController ageCtrl;
  final String? selectedGender;
  final String? selectedDiagnosis;
  final DateTime? birthDate;
  final String? selectedFamily;
  final List<String> genders;
  final List<String> diagnoses;
  final List<String> families;
  final ValueChanged<String?> onGenderChanged;
  final ValueChanged<String?> onDiagnosisChanged;
  final ValueChanged<String?> onFamilyChanged;
  final VoidCallback onPickDate;
  final VoidCallback onNext;

  const _Page1PersonalInfo({
    required this.res,
    required this.isDark,
    required this.l10n,
    required this.formKey,
    required this.childNameCtrl,
    required this.nationalIdCtrl,
    required this.ageCtrl,
    required this.selectedGender,
    required this.selectedDiagnosis,
    required this.birthDate,
    required this.selectedFamily,
    required this.genders,
    required this.diagnoses,
    required this.families,
    required this.onGenderChanged,
    required this.onDiagnosisChanged,
    required this.onFamilyChanged,
    required this.onPickDate,
    required this.onNext,
  });

  String _genderLabel(String code) {
    if (code == 'male') return l10n.male;
    return l10n.female;
  }

  String _formatDate(DateTime dt) {
    return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
        children: [
          SizedBox(height: res.scaleHeight(AppSpacing.p8)),
          _FormCard(
            res: res,
            isDark: isDark,
            child: Column(
              children: [
                _LabeledField(
                  res: res,
                  isDark: isDark,
                  label: l10n.childNameLabel,
                  hint: l10n.childNameHint,
                  controller: childNameCtrl,
                  validator: (v) =>
                      (v == null || v.isEmpty) ? l10n.fieldRequired : null,
                ),
                SizedBox(height: res.scaleHeight(AppSpacing.p16)),
                _LabeledField(
                  res: res,
                  isDark: isDark,
                  label: l10n.nationalId,
                  hint: l10n.nationalIdHint,
                  controller: nationalIdCtrl,
                  keyboardType: TextInputType.number,
                  validator: (v) =>
                      (v == null || v.isEmpty) ? l10n.fieldRequired : null,
                ),
                SizedBox(height: res.scaleHeight(AppSpacing.p16)),
                _DropdownField<String>(
                  res: res,
                  isDark: isDark,
                  label: l10n.selectGenderLabel,
                  hint: l10n.genderSelectHint,
                  value: selectedGender,
                  items: genders
                      .map((g) => DropdownMenuItem(
                          value: g,
                          child: Text(_genderLabel(g),
                              style: TextStyle(
                                  fontSize: res.scaleText(14),
                                  color: isDark
                                      ? Colors.white
                                      : AppColors.textPrimary))))
                      .toList(),
                  onChanged: onGenderChanged,
                  validator: (_) =>
                      selectedGender == null ? l10n.fieldRequired : null,
                ),
                SizedBox(height: res.scaleHeight(AppSpacing.p16)),
                _DropdownField<String>(
                  res: res,
                  isDark: isDark,
                  label: l10n.diagnosisLabel,
                  hint: l10n.diagnosisHint,
                  value: selectedDiagnosis,
                  items: diagnoses
                      .map((d) => DropdownMenuItem(
                          value: d,
                          child: Text(d,
                              style: TextStyle(
                                  fontSize: res.scaleText(14),
                                  color: isDark
                                      ? Colors.white
                                      : AppColors.textPrimary))))
                      .toList(),
                  onChanged: onDiagnosisChanged,
                  validator: (_) =>
                      selectedDiagnosis == null ? l10n.fieldRequired : null,
                ),
                SizedBox(height: res.scaleHeight(AppSpacing.p16)),
                // Birth date picker
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.birthDateLabel,
                        style: TextStyle(
                            fontSize: res.scaleText(13),
                            fontWeight: FontWeight.w600,
                            color: isDark
                                ? Colors.white70
                                : AppColors.textPrimary)),
                    SizedBox(height: res.scaleHeight(6)),
                    InkWell(
                      onTap: onPickDate,
                      borderRadius: BorderRadius.circular(
                          res.scaleRadius(AppSpacing.radiusLg)),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: res.scaleSpacing(AppSpacing.p16),
                          vertical: res.scaleHeight(AppSpacing.p12),
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0xFF2A2A2A)
                              : const Color(0xFFF5F7FA),
                          borderRadius: BorderRadius.circular(
                              res.scaleRadius(AppSpacing.radiusLg)),
                          border: Border.all(
                              color: isDark
                                  ? Colors.grey[700]!
                                  : Colors.grey[200]!),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_today_outlined,
                                size: res.scaleText(18),
                                color: birthDate != null
                                    ? AppColors.primary
                                    : AppColors.textSecondary),
                            SizedBox(width: res.scaleWidth(10)),
                            Text(
                              birthDate != null
                                  ? _formatDate(birthDate!)
                                  : l10n.birthDateLabel,
                              style: TextStyle(
                                  fontSize: res.scaleText(14),
                                  color: birthDate != null
                                      ? (isDark
                                          ? Colors.white
                                          : AppColors.textPrimary)
                                      : AppColors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: res.scaleHeight(AppSpacing.p16)),
                _LabeledField(
                  res: res,
                  isDark: isDark,
                  label: l10n.ageFieldLabel,
                  hint: l10n.ageFieldHint,
                  controller: ageCtrl,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: res.scaleHeight(AppSpacing.p16)),
                _DropdownField<String>(
                  res: res,
                  isDark: isDark,
                  label: l10n.assignFamily,
                  hint: l10n.selectFamilyHint,
                  value: selectedFamily,
                  items: families
                      .map((f) => DropdownMenuItem(
                          value: f,
                          child: Text(f,
                              style: TextStyle(
                                  fontSize: res.scaleText(14),
                                  color: isDark
                                      ? Colors.white
                                      : AppColors.textPrimary))))
                      .toList(),
                  onChanged: onFamilyChanged,
                  validator: (_) =>
                      selectedFamily == null ? l10n.fieldRequired : null,
                ),
              ],
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p32)),
          SizedBox(
            width: double.infinity,
            height: res.scaleHeight(52),
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      res.scaleRadius(AppSpacing.radiusXl)),
                ),
                elevation: 2,
              ),
              child: Text(
                l10n.nextButton,
                style: TextStyle(
                    fontSize: res.scaleText(16),
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p32)),
        ],
      ),
    );
  }
}

// ── Page 2 ────────────────────────────────────────────────────────────────────

class _Page2Documents extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final AppLocalizations l10n;
  final List<_DocumentEntry> documents;
  final bool isSaving;
  final VoidCallback onAddDocument;
  final ValueChanged<int> onRemoveDocument;
  final VoidCallback onSave;

  const _Page2Documents({
    required this.res,
    required this.isDark,
    required this.l10n,
    required this.documents,
    required this.isSaving,
    required this.onAddDocument,
    required this.onRemoveDocument,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
      children: [
        SizedBox(height: res.scaleHeight(AppSpacing.p8)),
        _FormCard(
          res: res,
          isDark: isDark,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.documentsTitle,
                style: TextStyle(
                    fontSize: res.scaleText(15),
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : AppColors.textPrimary),
              ),
              SizedBox(height: res.scaleHeight(AppSpacing.p16)),
              ...documents.asMap().entries.map((e) => _DocumentTile(
                    res: res,
                    isDark: isDark,
                    entry: e.value,
                    onRemove: () => onRemoveDocument(e.key),
                  )),
              if (documents.isNotEmpty)
                SizedBox(height: res.scaleHeight(AppSpacing.p8)),
              OutlinedButton.icon(
                onPressed: onAddDocument,
                icon: Icon(Icons.add_rounded,
                    size: res.scaleText(18), color: AppColors.primary),
                label: Text(
                  l10n.addDocumentLabel,
                  style: TextStyle(
                      fontSize: res.scaleText(14),
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.primary, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        res.scaleRadius(AppSpacing.radiusLg)),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: res.scaleSpacing(AppSpacing.p16),
                    vertical: res.scaleHeight(AppSpacing.p12),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: res.scaleHeight(AppSpacing.p32)),
        SizedBox(
          width: double.infinity,
          height: res.scaleHeight(52),
          child: ElevatedButton(
            onPressed: isSaving ? null : onSave,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              disabledBackgroundColor:
                  AppColors.primary.withValues(alpha: 0.6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    res.scaleRadius(AppSpacing.radiusXl)),
              ),
              elevation: 2,
            ),
            child: isSaving
                ? SizedBox(
                    width: res.scaleWidth(22),
                    height: res.scaleWidth(22),
                    child: const CircularProgressIndicator(
                        color: Colors.white, strokeWidth: 2.5),
                  )
                : Text(
                    l10n.saveButton,
                    style: TextStyle(
                        fontSize: res.scaleText(16),
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
          ),
        ),
        SizedBox(height: res.scaleHeight(AppSpacing.p32)),
      ],
    );
  }
}

// ── Document tile ─────────────────────────────────────────────────────────────

class _DocumentTile extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final _DocumentEntry entry;
  final VoidCallback onRemove;

  const _DocumentTile({
    required this.res,
    required this.isDark,
    required this.entry,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final isPdf = entry.type == _DocType.pdf;

    return Container(
      margin: EdgeInsets.only(bottom: res.scaleHeight(AppSpacing.p8)),
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p12)),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF2A2A2A)
            : AppColors.primary.withValues(alpha: 0.05),
        borderRadius:
            BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
        border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.2), width: 1),
      ),
      child: Row(
        children: [
          // Thumbnail / icon
          Container(
            width: res.scaleWidth(44),
            height: res.scaleWidth(44),
            decoration: BoxDecoration(
              color: isPdf
                  ? Colors.red.withValues(alpha: 0.1)
                  : Colors.transparent,
              borderRadius:
                  BorderRadius.circular(res.scaleRadius(AppSpacing.radiusMd)),
              image: isPdf
                  ? null
                  : DecorationImage(
                      image: FileImage(File(entry.filePath)),
                      fit: BoxFit.cover,
                    ),
            ),
            child: isPdf
                ? Icon(Icons.picture_as_pdf_rounded,
                    color: Colors.red[700],
                    size: res.scaleText(26))
                : null,
          ),
          SizedBox(width: res.scaleWidth(AppSpacing.p12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.name,
                  style: TextStyle(
                      fontSize: res.scaleText(14),
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : AppColors.textPrimary),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: res.scaleHeight(2)),
                Text(
                  entry.fileName,
                  style: TextStyle(
                      fontSize: res.scaleText(11),
                      color: AppColors.textSecondary),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.close_rounded,
                size: res.scaleText(18), color: AppColors.error),
            onPressed: onRemove,
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(
              minWidth: res.scaleWidth(32),
              minHeight: res.scaleWidth(32),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Add Document bottom sheet ─────────────────────────────────────────────────

typedef _FilePickedCallback = void Function(
    String path, String fileName, _DocType type);

class _AddDocumentSheet extends StatefulWidget {
  final AppLocalizations l10n;
  final TextEditingController nameCtrl;
  final _FilePickedCallback onFilePicked;
  final VoidCallback onConfirm;

  const _AddDocumentSheet({
    required this.l10n,
    required this.nameCtrl,
    required this.onFilePicked,
    required this.onConfirm,
  });

  @override
  State<_AddDocumentSheet> createState() => _AddDocumentSheetState();
}

class _AddDocumentSheetState extends State<_AddDocumentSheet> {
  String? _pickedPath;
  String? _pickedDisplayName;
  _DocType? _pickedType;
  bool _isPickingPdf = false;

  final _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final file = await _picker.pickImage(source: source, imageQuality: 85);
    if (file != null && mounted) {
      setState(() {
        _pickedPath = file.path;
        _pickedDisplayName = file.name;
        _pickedType = _DocType.image;
      });
      widget.onFilePicked(file.path, file.name, _DocType.image);
    }
  }

  Future<void> _pickPdf() async {
    setState(() => _isPickingPdf = true);
    final result = await PdfPicker.pick();
    if (!mounted) return;
    setState(() => _isPickingPdf = false);
    if (result != null) {
      setState(() {
        _pickedPath = result.path;
        _pickedDisplayName = result.name;
        _pickedType = _DocType.pdf;
      });
      widget.onFilePicked(result.path, result.name, _DocType.pdf);
    }
  }

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final l10n = widget.l10n;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(res.scaleRadius(AppSpacing.radiusXxl))),
      ),
      padding: EdgeInsets.fromLTRB(
        res.scaleSpacing(AppSpacing.p20),
        res.scaleHeight(AppSpacing.p20),
        res.scaleSpacing(AppSpacing.p20),
        res.scaleHeight(AppSpacing.p20) +
            MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: res.scaleWidth(40),
              height: res.scaleHeight(4),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[600] : Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p20)),

          // Sheet title
          Text(l10n.addDocumentLabel,
              style: TextStyle(
                  fontSize: res.scaleText(16),
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : AppColors.textPrimary)),
          SizedBox(height: res.scaleHeight(AppSpacing.p16)),

          // Document name field
          Text(l10n.documentNameLabel,
              style: TextStyle(
                  fontSize: res.scaleText(13),
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white70 : AppColors.textPrimary)),
          SizedBox(height: res.scaleHeight(6)),
          TextField(
            controller: widget.nameCtrl,
            style: TextStyle(
                fontSize: res.scaleText(14),
                color: isDark ? Colors.white : AppColors.textPrimary),
            decoration: _inputDeco(res, isDark, l10n.documentNameHint),
          ),
          SizedBox(height: res.scaleHeight(AppSpacing.p16)),

          // Upload section label
          Text(l10n.uploadDocumentLabel,
              style: TextStyle(
                  fontSize: res.scaleText(13),
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white70 : AppColors.textPrimary)),
          SizedBox(height: res.scaleHeight(AppSpacing.p8)),

          // Three picker buttons: Camera | Gallery | PDF
          Row(
            children: [
              Expanded(
                child: _PickerSourceButton(
                  res: res,
                  isDark: isDark,
                  icon: Icons.camera_alt_outlined,
                  label: l10n.cameraButton,
                  onTap: () => _pickImage(ImageSource.camera),
                ),
              ),
              SizedBox(width: res.scaleWidth(AppSpacing.p8)),
              Expanded(
                child: _PickerSourceButton(
                  res: res,
                  isDark: isDark,
                  icon: Icons.photo_library_outlined,
                  label: l10n.galleryButton,
                  onTap: () => _pickImage(ImageSource.gallery),
                ),
              ),
              SizedBox(width: res.scaleWidth(AppSpacing.p8)),
              Expanded(
                child: _PickerSourceButton(
                  res: res,
                  isDark: isDark,
                  icon: Icons.picture_as_pdf_rounded,
                  label: l10n.pickPdfFile,
                  iconColor: Colors.red[700],
                  isLoading: _isPickingPdf,
                  onTap: _pickPdf,
                ),
              ),
            ],
          ),

          // Picked file indicator
          if (_pickedPath != null) ...[
            SizedBox(height: res.scaleHeight(AppSpacing.p12)),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p8)),
              decoration: BoxDecoration(
                color: _pickedType == _DocType.pdf
                    ? Colors.red.withValues(alpha: 0.08)
                    : AppColors.success.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(
                    res.scaleRadius(AppSpacing.radiusMd)),
                border: Border.all(
                  color: _pickedType == _DocType.pdf
                      ? Colors.red.withValues(alpha: 0.3)
                      : AppColors.success.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _pickedType == _DocType.pdf
                        ? Icons.picture_as_pdf_rounded
                        : Icons.check_circle_outline_rounded,
                    color: _pickedType == _DocType.pdf
                        ? Colors.red[700]
                        : AppColors.success,
                    size: res.scaleText(18),
                  ),
                  SizedBox(width: res.scaleWidth(8)),
                  Expanded(
                    child: Text(
                      _pickedDisplayName ?? '',
                      style: TextStyle(
                          fontSize: res.scaleText(13),
                          fontWeight: FontWeight.w500,
                          color: _pickedType == _DocType.pdf
                              ? Colors.red[700]
                              : AppColors.success),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],

          SizedBox(height: res.scaleHeight(AppSpacing.p20)),

          // Confirm button
          SizedBox(
            width: double.infinity,
            height: res.scaleHeight(50),
            child: ElevatedButton(
              onPressed: (_pickedPath != null &&
                      widget.nameCtrl.text.isNotEmpty)
                  ? widget.onConfirm
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                disabledBackgroundColor:
                    AppColors.primary.withValues(alpha: 0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      res.scaleRadius(AppSpacing.radiusXl)),
                ),
              ),
              child: Text(l10n.saveButton,
                  style: TextStyle(
                      fontSize: res.scaleText(15),
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Picker source button ──────────────────────────────────────────────────────

class _PickerSourceButton extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;
  final bool isLoading;

  const _PickerSourceButton({
    required this.res,
    required this.isDark,
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveIconColor = iconColor ?? AppColors.primary;

    return InkWell(
      onTap: isLoading ? null : onTap,
      borderRadius:
          BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: res.scaleHeight(AppSpacing.p16)),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF2A2A2A) : const Color(0xFFF5F7FA),
          borderRadius:
              BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
          border: Border.all(
              color: isDark ? Colors.grey[700]! : Colors.grey[200]!),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isLoading
                ? SizedBox(
                    width: res.scaleText(24),
                    height: res.scaleText(24),
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: effectiveIconColor),
                  )
                : Icon(icon,
                    color: effectiveIconColor, size: res.scaleText(28)),
            SizedBox(height: res.scaleHeight(6)),
            Text(label,
                style: TextStyle(
                    fontSize: res.scaleText(12),
                    fontWeight: FontWeight.w500,
                    color:
                        isDark ? Colors.white70 : AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }
}

// ── Data model ────────────────────────────────────────────────────────────────

class _DocumentEntry {
  final String name;
  final String filePath;
  final String fileName;
  final _DocType type;

  const _DocumentEntry({
    required this.name,
    required this.filePath,
    required this.fileName,
    required this.type,
  });
}

// ── Shared form widgets ───────────────────────────────────────────────────────

class _FormCard extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final Widget child;

  const _FormCard(
      {required this.res, required this.isDark, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p16)),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius:
            BorderRadius.circular(res.scaleRadius(AppSpacing.radiusXl)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _LabeledField extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _LabeledField({
    required this.res,
    required this.isDark,
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: res.scaleText(13),
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white70 : AppColors.textPrimary)),
        SizedBox(height: res.scaleHeight(6)),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          style: TextStyle(
              fontSize: res.scaleText(14),
              color: isDark ? Colors.white : AppColors.textPrimary),
          decoration: _inputDeco(res, isDark, hint),
          validator: validator,
        ),
      ],
    );
  }
}

class _DropdownField<T> extends StatelessWidget {
  final ResponsiveHelper res;
  final bool isDark;
  final String label;
  final String hint;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final String? Function(T?)? validator;

  const _DropdownField({
    required this.res,
    required this.isDark,
    required this.label,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: res.scaleText(13),
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white70 : AppColors.textPrimary)),
        SizedBox(height: res.scaleHeight(6)),
        DropdownButtonFormField<T>(
          initialValue: value,
          decoration: _inputDeco(res, isDark, hint),
          hint: Text(hint,
              style: TextStyle(
                  fontSize: res.scaleText(14),
                  color: AppColors.textSecondary)),
          items: items,
          onChanged: onChanged,
          validator: validator,
          dropdownColor: isDark ? AppColors.surfaceDark : Colors.white,
          icon: Icon(Icons.keyboard_arrow_down_rounded,
              color: AppColors.textSecondary, size: res.scaleText(20)),
        ),
      ],
    );
  }
}

InputDecoration _inputDeco(ResponsiveHelper res, bool isDark, String hint) {
  return InputDecoration(
    hintText: hint,
    hintStyle:
        TextStyle(fontSize: res.scaleText(14), color: AppColors.textSecondary),
    filled: true,
    fillColor: isDark ? const Color(0xFF2A2A2A) : const Color(0xFFF5F7FA),
    contentPadding: EdgeInsets.symmetric(
      horizontal: res.scaleSpacing(AppSpacing.p16),
      vertical: res.scaleHeight(AppSpacing.p12),
    ),
    border: OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
      borderSide: BorderSide(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
      borderSide: const BorderSide(color: AppColors.error, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(res.scaleRadius(AppSpacing.radiusLg)),
      borderSide: const BorderSide(color: AppColors.error, width: 1.5),
    ),
  );
}
