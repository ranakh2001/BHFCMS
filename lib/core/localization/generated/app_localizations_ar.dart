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

  @override
  String welcomeBack(String name) {
    return 'أهلاً بك مجدداً $name';
  }

  @override
  String get todayTasks => 'إليك أهم مهامك وتوصيات اليوم ...';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get upcomingSessions => 'الجلسات القادمة';

  @override
  String get todayGoals => 'أهداف اليوم';

  @override
  String get speechSession => 'جلسة تخاطب';

  @override
  String room(String number) {
    return 'الغرفة $number';
  }

  @override
  String get statusCompleted => 'مكتملة';

  @override
  String get statusInProgress => 'قيد التنفيذ';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get noNotificationsYet => 'لا توجد إشعارات بعد';

  @override
  String get notificationNewSession => 'تم تعيين جلسة جديدة';

  @override
  String get notificationGoalUpdated => 'تم تحديث الهدف';

  @override
  String get notificationReminder => 'تذكير بالجلسة';

  @override
  String get childDetails => 'تفاصيل الطفل';

  @override
  String get sessionInfo => 'معلومات الجلسة';

  @override
  String get goals => 'الأهداف';

  @override
  String get beneficiaries => 'المستفيدين';

  @override
  String get searchBeneficiary => 'البحث عن مستفيد...';

  @override
  String get filterActive => 'نشط';

  @override
  String get filterCompleted => 'مكتمل';

  @override
  String get progressAchieved => 'التقدم المحرز';

  @override
  String get viewDetails => 'عرض التفاصيل';

  @override
  String get speechImprovement => 'تحسين النطق';

  @override
  String get schedule => 'الجدول الزمني';

  @override
  String get scheduleTitle => 'الجدول الزمني';

  @override
  String get upcomingSessionLegend => 'جلسة قادمة';

  @override
  String get completedSessionLegend => 'جلسة مكتملة';

  @override
  String get holidayLegend => 'اجازة';

  @override
  String get noSessionsOnDay => 'لا توجد جلسات في هذا اليوم';

  @override
  String get sessionTime => 'وقت الجلسة';

  @override
  String get child => 'الطفل';

  @override
  String get therapist => 'المعالج';

  @override
  String get messages => 'الرسائل';

  @override
  String get searchGuardian => 'البحث عن ولي أمر...';

  @override
  String get typeMessage => 'اكتب رسالة....';

  @override
  String get noConversations => 'لا توجد محادثات بعد';

  @override
  String get noMessages => 'لا توجد رسائل بعد';

  @override
  String guardianOf(String name) {
    return 'والد/ة $name';
  }

  @override
  String get messageSent => 'تم الإرسال';

  @override
  String get messageDelivered => 'تم التسليم';

  @override
  String get messageRead => 'مقروءة';

  @override
  String get profileTitle => 'الصفحة الشخصية';

  @override
  String get generalSettings => 'الاعدادات العامة';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'الإنجليزية';

  @override
  String get notificationsLabel => 'الاشعارات';

  @override
  String get speechTherapist => 'أخصائي نطق و تخاطب';

  @override
  String get logoutConfirmTitle => 'تسجيل الخروج';

  @override
  String get logoutConfirmMessage => 'هل أنت متأكد أنك تريد تسجيل الخروج؟';

  @override
  String get cancel => 'إلغاء';

  @override
  String get confirm => 'تأكيد';

  @override
  String get childFile => 'ملف الطفل';

  @override
  String get sessionTab => 'الجلسة';

  @override
  String get sessionGoalsTab => 'أهداف الجلسة';

  @override
  String get treatmentPlanTab => 'الخطة العلاجية';

  @override
  String get overviewTab => 'نظرة عامة';

  @override
  String get activeStatus => 'نشط';

  @override
  String get uploadSessionVideo => 'رفع مقطع فيديو للجلسة';

  @override
  String get uploadSessionAudio => 'رفع مقطع صوتي للجلسة';

  @override
  String get assessmentsSection => 'الاختبارات';

  @override
  String get visualCommunicationTest => 'اختبار التواصل البصري';

  @override
  String get behavioralSkillsTest => 'اختبار المهارات السلوكية';

  @override
  String get commandResponseTest => 'اختبار الاستجابة للأوامر';

  @override
  String get addParentTask => 'إضافة المهمة للقيام بها مع ولي الأمر';

  @override
  String get startButton => 'البدء';

  @override
  String get assessmentTitle => 'الاختبار';

  @override
  String get finishAssessment => 'إنهاء الاختبار';

  @override
  String get doesChildLookQuestion => 'هل ينظر الطفل عند مناداته باسمه؟';

  @override
  String get ratingWeak => 'ضعيف';

  @override
  String get ratingGood => 'جيد';

  @override
  String get ratingMedium => 'متوسط';

  @override
  String get ratingExcellent => 'ممتاز';

  @override
  String get chooseMainGoal => 'اختر الهدف الرئيسي للجلسة';

  @override
  String get sessionNotesTitle => 'ملاحظات الجلسة';

  @override
  String get childSessionRating => 'تقييم الطفل خلال الجلسة';

  @override
  String get childInteractionLevel => 'مستوى تفاعل الطفل';

  @override
  String get childInteractionHint => 'تفاعل الطفل';

  @override
  String get goalAchievementLabel => 'تحقيق الاهداف';

  @override
  String get notAchieved => 'لم يتحقق';

  @override
  String get partialAchievement => 'جزئي';

  @override
  String get goalAchieved => 'تم تحقيق الهدف';

  @override
  String get performanceTypeLabel => 'نوع الأداء';

  @override
  String get performanceTypeHint => 'نوع الاداء';

  @override
  String get notesLabel => 'ملاحظات';

  @override
  String get saveButton => 'حفظ';

  @override
  String get smartSuggestions => 'اقتراحات ذكية';

  @override
  String get getNewGoals => 'احصل على أهداف جديدة بناء على حالة الطفل';

  @override
  String get suggestGoals => 'إقترح أهداف';

  @override
  String get endSession => 'انهاء الجلسة';

  @override
  String get currentTreatmentPlan => 'الخطة العلاجية الحالية';

  @override
  String get planDuration => 'المدة الزمنية';

  @override
  String get startedIn => 'بدأت في';

  @override
  String get statusNotStarted => 'لم يبدأ';

  @override
  String get progressTitle => 'مدى التقدم';

  @override
  String get notableImprovement => 'تحسن ملحوظ خلال آخر الجلسات';

  @override
  String get remainingGoals => 'الأهداف المتبقية';

  @override
  String get achievedGoals => 'الأهداف المنجزة';

  @override
  String get aiSuggestionsTitle => 'اقتراحات الذكاء الاصطناعي';

  @override
  String get personalProfile => 'الملف الشخصي';

  @override
  String get goalsSummary => 'ملخص الأهداف';

  @override
  String get achievedCount => 'تم تحقيقه';

  @override
  String get remainingCount => 'متبقي';

  @override
  String get aiSuggestedGoals => 'أهداف مقترحة بواسطة الذكاء الاصطناعي';

  @override
  String get highPriority => 'اولوية عالية';

  @override
  String get mediumPriority => 'اولوية متوسطة';

  @override
  String get continuousDevelopment => 'تطوير مستمر';

  @override
  String get addToPlan => 'إضافة إلى الخطة';

  @override
  String get updateSuggestions => 'تحديث المقترحات';

  @override
  String get saveToTreatmentPlan => 'حفظ في خطة العلاج';

  @override
  String get viewPlan => 'عرض الخطة';

  @override
  String get sessionNotesRecord => 'تسجيل ملاحظات الجلسة';
}
