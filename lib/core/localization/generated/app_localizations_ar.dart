// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'النظام';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get welcomeMessage => 'مرحباً بعودتك!';

  @override
  String get settings => 'الإعدادات';

  @override
  String get language => 'اللغة';

  @override
  String get theme => 'المظهر';

  @override
  String get centerName => 'مركز الأفق المشرق';

  @override
  String get splashSubtitle => 'رعاية متميزة، رؤى ذكية';

  @override
  String get loginTitle => 'تسجيل الدخول';

  @override
  String get welcomeSubtitle => 'أهلاً وسهلاً بك';

  @override
  String get loginStepByStep => 'معًا لمتابعة وتطوير الحالات خطوة بخطوة';

  @override
  String get emailLabel => 'البريد الإلكتروني';

  @override
  String get emailHint => 'name@example.com';

  @override
  String get passwordLabel => 'كلمة المرور';

  @override
  String get passwordHint => '**********';

  @override
  String get loginButton => 'دخول';

  @override
  String get adminAccountNote => 'يتم إنشاء الحسابات من قبل إدارة المركز فقط';

  @override
  String get validationRequired => 'هذا الحقل مطلوب';

  @override
  String get validationEmail => 'يرجى إدخال عنوان بريد إلكتروني صحيح';

  @override
  String get validationPasswordLength =>
      'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل';
}
