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
  String get emailHint => 'أدخل البريد الإلكتروني';

  @override
  String get passwordLabel => 'كلمة المرور';

  @override
  String get passwordHint => 'أدخل كلمة المرور';

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
  String get parentsWelocome =>
      'تابع جلسات طفلك، المهام، والتحديثات الجديدة...';

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

  @override
  String get csFormIntroTitle => 'قبل البدء';

  @override
  String get csFormIntroBody =>
      'لتوثيق دراسة حالة الطفل بشكل دقيق وشامل، يرجى تعبئة جميع أقسام النموذج بعناية. يمكنك تعبئة هذه الاستمارة أكثر من مرة.';

  @override
  String csFormIntroNote(int count) {
    return 'النموذج عبارة عن $count قسم الرجاء تعبئة جميع الأقسام بدقة';
  }

  @override
  String get csFormStartButton => 'ابدأ الأن';

  @override
  String get csFormContinueButton => 'متابعة';

  @override
  String get csFormNext => 'التالي';

  @override
  String get csFormFinish => 'إنهاء';

  @override
  String csFormResumeNote(int section) {
    return 'سيتم استئناف التقدم من القسم $section';
  }

  @override
  String get csSection1Title => 'المعلومات الشخصية للطفل';

  @override
  String get csChildName => 'اسم الطفل';

  @override
  String get csChildNameHint => 'ادخل اسم الطفل';

  @override
  String get csPlaceOfBirth => 'مكان الميلاد';

  @override
  String get csPlaceOfBirthHint => 'ادخل مكان الميلاد';

  @override
  String get csDateOfBirth => 'تاريخ الميلاد';

  @override
  String get csGrade => 'الصف';

  @override
  String get csGradeHint => 'ادخل صف الطفل';

  @override
  String get csChildAge => 'عمر الطفل';

  @override
  String get csChildAgeHint => 'ادخل عمر الطفل';

  @override
  String get csGender => 'الجنس';

  @override
  String get csGenderHint => 'اختر جنس الطفل';

  @override
  String get csGenderMale => 'ذكر';

  @override
  String get csGenderFemale => 'أنثى';

  @override
  String get csNationality => 'الجنسية';

  @override
  String get csNationalityHint => 'ادخل جنسية الطفل';

  @override
  String get csFamilyRank => 'مرتبة الطفل فالعائلة';

  @override
  String get csFamilyRankHint => 'ادخل مرتبة الطفل بالعائلة';

  @override
  String get csCenterJoinDate => 'تاريخ التحاق الطفل بالمركز';

  @override
  String get csChildInfoDisplaySection => 'بيانات الطفل';

  @override
  String get csReferenceNumber => 'رقم الملف المرجعي';

  @override
  String get csPrimaryLanguage => 'اللغة الأساسية';

  @override
  String get csFullAddress => 'العنوان بالكامل';

  @override
  String get csCaregiverName => 'اسم مقدم الرعاية الأساسي';

  @override
  String get csCaregiverRelationship => 'صلة القرابة';

  @override
  String get csPhoneNumber => 'رقم الجوال';

  @override
  String get csEmailAddress => 'البريد الالكتروني';

  @override
  String get csReferralInfoSection => 'معلومات الإحالة';

  @override
  String get csReferralSource => 'جهة الإحالة';

  @override
  String get csReferralSelf => 'ذاتي';

  @override
  String get csReferralDoctor => 'طبيب';

  @override
  String get csReferralSchool => 'مدرسة';

  @override
  String get csReferralOtherCenter => 'مركز آخر';

  @override
  String get csReferralOther => 'أخرى';

  @override
  String get csReferralOtherNote => '(في حال اختيار أخرى)';

  @override
  String get csReferralOtherHint => 'ادخل جهة الإحالة';

  @override
  String get csMainServiceReason => 'السبب الرئيسي لطلب الخدمة';

  @override
  String get csMainServiceReasonHint => 'ادخل السبب الرئيسي لطلب الخدمة';

  @override
  String get csChangeLanguage => 'تغيير اللغة';

  @override
  String get csSection2Title => 'معلومات الاسرة و الوصاية';

  @override
  String get csFatherName => 'اسم الاب';

  @override
  String get csFatherNameHint => 'ادخل اسم الاب';

  @override
  String get csFatherEducation => 'المستوى التعليمي';

  @override
  String get csFatherEducationHint => 'ادخل المستوى التعليمي للاب';

  @override
  String get csMotherName => 'اسم الام';

  @override
  String get csMotherNameHint => 'ادخل اسم الام';

  @override
  String get csMotherEducation => 'المستوى التعليمي';

  @override
  String get csMotherEducationHint => 'ادخل المستوى التعليمي للام';

  @override
  String get csParentsKinship => 'هل بين الاب والأم صلة قرابة؟';

  @override
  String get csKinshipType => 'ما هي بالتحديد نوع القرابة؟';

  @override
  String get csKinshipTypeHint => 'ادخل نوع القرابة';

  @override
  String get csKinshipNote => '(في حال وجود صلة قرابة بين الأبوين)';

  @override
  String get csChildResidenceTitle => 'مكان إقامة الطفل مع نسبة الوقت';

  @override
  String get csChildResidenceNote => '(في حال الوالدان غير متزوجين)';

  @override
  String get csFirstHome => 'المنزل الأول';

  @override
  String get csFirstHomeHint => 'أضف وصف المنزل ونسبة الوقت';

  @override
  String get csFirstHomeOwner => 'اسم الوالد/الوصي (صاحب المنزل الأول)';

  @override
  String get csFirstHomeOwnerHint => 'ادخل اسم صاحب المنزل الأول';

  @override
  String get csSecondHome => 'المنزل الثاني';

  @override
  String get csSecondHomeHint => 'أضف وصف المنزل ونسبة الوقت';

  @override
  String get csSecondHomeOwner => 'اسم الوالد/الوصي (صاحب المنزل الثاني)';

  @override
  String get csSecondHomeOwnerHint => 'ادخل اسم صاحب المنزل الثاني';

  @override
  String get csMotherOccupation => 'وظيفة الأم';

  @override
  String get csMotherOccupationHint => 'ادخل وظيفة الأم';

  @override
  String get csFatherOccupation => 'وظيفة الأب';

  @override
  String get csFatherOccupationHint => 'ادخل وظيفة الأب';

  @override
  String get csDecisionMaker =>
      'من المسؤول عن القرارات الطبية والتعليمية والخاصة بالطفل';

  @override
  String get csDecisionBoth => 'كلاهما';

  @override
  String get csDecisionLegalGuardian => 'ولي قانوني';

  @override
  String get csSeparationDecision => 'في حال الانفصال';

  @override
  String get csSeparationDecisionHint =>
      'اذكر من المسؤول عن القرارات الخاصة بالطفل';

  @override
  String get csBothParentsAware =>
      'هل كلا الوالدين على علم بالخدمات المطلوبة في المركز';

  @override
  String get csFamilyMembersTitle => 'أفراد الأسرة و الأشخاص المقيمين';

  @override
  String get csAddPerson => 'أضف شخصاً';

  @override
  String get csMemberName => 'الاسم';

  @override
  String get csMemberNameHint => 'ادخل الاسم';

  @override
  String get csMemberAge => 'العمر';

  @override
  String get csMemberAgeHint => 'ادخل العمر';

  @override
  String get csMemberRelationship => 'العلاقة';

  @override
  String get csMemberRelationshipHint => 'ادخل العلاقة';

  @override
  String get csMemberResidence => 'مكان الإقامة';

  @override
  String get csResidenceHome1 => 'المنزل الأول';

  @override
  String get csResidenceHome2 => 'المنزل الثاني';

  @override
  String get csResidenceDoesNotLive => 'لا يقيم';

  @override
  String get csFamilyHealthHistoryTitle => 'التاريخ الأسري الصحي والنفسي';

  @override
  String get csFamilyConditionFather => 'الأب';

  @override
  String get csFamilyConditionMother => 'الأم';

  @override
  String get csFamilyConditionPaternalRel => 'أقارب أبوين';

  @override
  String get csFamilyConditionOtherRel => 'أقارب أخرى';

  @override
  String get csFamilyConditionNone => 'لا يوجد';

  @override
  String get csFamilyConditionRelation => 'صلة القرابة';

  @override
  String get csFamilyConditionRelationHint => 'ادخل صلة القرابة';

  @override
  String get csAutismSpectrum => 'طيف التوحد';

  @override
  String get csLanguageDelay => 'تأخر لغوي';

  @override
  String get csLearningDifficulty => 'صعوبة تعلم';

  @override
  String get csADHD => 'فرط حركة و قلة انتباه (ADHD)';

  @override
  String get csMoodDisorders => 'اضطرابات المزاج (كئتاب، قلق)';

  @override
  String get csSection3Title => 'معلومات الحمل و الولادة';

  @override
  String get csPregnancyBirthSubsection => 'الحمل و الولادة';

  @override
  String get csLiveBirthCount => 'عدد مرات حمل الأم (ولادات حية)';

  @override
  String get csLiveBirthCountHint => 'ادخل مرات الحمل';

  @override
  String get csStillbirthCount => 'عدد مرات حمل الأم (حالات وفاة)';

  @override
  String get csStillbirthCountHint => 'ادخل مرات الحمل';

  @override
  String get csMotherAgeAtBirth => 'عمر الأم عند ولادة الطفل';

  @override
  String get csMotherAgeAtBirthHint => 'ادخل عمر الأم';

  @override
  String get csFatherAgeAtBirth => 'عمر الأب عند ولادة الطفل';

  @override
  String get csFatherAgeAtBirthHint => 'ادخل عمر الأب';

  @override
  String get csParentKinship => 'درجة القرابة بين الوالدين';

  @override
  String get csKinshipFirst => 'درجة أولى';

  @override
  String get csKinshipSecond => 'درجة ثانية';

  @override
  String get csKinshipNone => 'لا توجد';

  @override
  String get csWasPregnancyPlanned => 'هل كان الحمل مخططاً له';

  @override
  String get csUsedFertilityTreatment => 'هل تم استخدام علاجات للخصوبة';

  @override
  String get csMedicationsTitle => 'استخدام أدوية/ مكملات أثناء الحمل';

  @override
  String get csMedVitamins => 'فيتامينات';

  @override
  String get csMedSupplements => 'مكملات';

  @override
  String get csMedAntidepressants => 'مضادات اكتئاب';

  @override
  String get csMedAntiSeizure => 'مضادات صرع';

  @override
  String get csMedOther => 'أخرى';

  @override
  String get csMedUnsure => 'غير متاكد';

  @override
  String get csMedicationsOtherNote => '(في حال اختيار أخرى)';

  @override
  String get csMedicationsOtherHint => 'ادخل أنواع الأدوية';

  @override
  String get csPregnancyDifficultiesSection => 'صعوبات حدثت أثناء الحمل';

  @override
  String get csFeverInfection => 'حمى/ عدوى';

  @override
  String get csBleedingMiscarriage => 'تزيف/ تهديد بالإجهاض';

  @override
  String get csHighBpDiabetes => 'ارتفاع ضغط الدم/ سكري بالحمل';

  @override
  String get csSevereStressAccidents => 'إجهاد شديد/ حوادث';

  @override
  String get csTriUnsure => 'غير متاكد';

  @override
  String get csLaborDeliverySection => 'المخاض و الولادة';

  @override
  String get csUsedPitocin => 'استخدام محفزات (Pitocin)';

  @override
  String get csPrematureBirth => 'ولادة مبكرة';

  @override
  String get csPrematureWeeks => 'عدد الأسابيع';

  @override
  String get csPrematureWeeksHint => 'ادخل الأسابيع';

  @override
  String get csDeliveryComplications => 'مضاعفات (مقعدة، ملفوف، حبل سري)';

  @override
  String get csDeliveryComplicationsType => 'ما هو نوع المضاعفات';

  @override
  String get csDeliveryComplicationsHint => 'ادخل نوع المضاعفات';

  @override
  String get csNICU => 'العناية المركزة (NICU)/ إنعاش';

  @override
  String get csNICUReason => 'ما هو السبب';

  @override
  String get csNICUReasonHint => 'ادخل سبب دخول النيكو';

  @override
  String get csNICUDuration => 'المدة';

  @override
  String get csNICUDurationHint => 'مدة بقاء الطفل بالمستشفى';

  @override
  String get csDeliveryType => 'نوع الولادة';

  @override
  String get csDeliveryNatural => 'طبيعية';

  @override
  String get csDeliveryCesarean => 'قيصرية';

  @override
  String get csCesareanReason => 'ما هو السبب';

  @override
  String get csCesareanReasonHint => 'سبب الولادة القيصرية';

  @override
  String get csFirstMonthProblems => 'المشكلات في الشهر الأول بعد الولادة';

  @override
  String get csFirstMonthBreastfeeding => 'صعوبة الرضاعة';

  @override
  String get csFirstMonthSleep => 'مشاكل النوم';

  @override
  String get csFirstMonthJaundice => 'البرقان';

  @override
  String get csFirstMonthCongenital => 'عيوب خلقية';

  @override
  String get csFirstMonthFainting => 'تهديد/ فقدان الوعي';

  @override
  String get csFirstMonthCrying => 'بكاء مفرط';

  @override
  String get csFirstMonthDigestive => 'أعراض هضمية';

  @override
  String get csFirstMonthReflux => 'ارتجاع/ استفراغ';

  @override
  String get csIfYes => '(في حال اختيار نعم)';

  @override
  String get csHomeLanguage => 'اللغة المستخدمة في المنزل';

  @override
  String get csHomeLanguageHint => 'ادخل اللغة';

  @override
  String get csSchoolLanguage => 'اللغة المستخدمة في المدرسة';

  @override
  String get csSchoolLanguageHint => 'ادخل اللغة';

  @override
  String get csMaritalStatus => 'الحالة المدنية للوالدين';

  @override
  String get csMarried => 'متزوجون';

  @override
  String get csSeparated => 'منفصلان';

  @override
  String get csDivorced => 'مطلقان';

  @override
  String get csOneParentDeceased => 'أحد الوالدين متوفى';

  @override
  String get csChildLivingWith => 'مع من يعيش الطفل';

  @override
  String get csLivesWithBoth => 'مع والديه';

  @override
  String get csLivesWithFather => 'مع والده';

  @override
  String get csLivesWithMother => 'مع والدته';

  @override
  String get csLivesWithOther => 'أخرى';

  @override
  String get csChildLivingOtherHint => 'ادخل مع من يعيش الطفل';

  @override
  String get csChildLivingOtherNote => '( في حال اختيار أخرى)';

  @override
  String get csFamilyRelationship => 'علاقة الطفل بالأسرة';

  @override
  String get csFamilyRelationshipHint => 'ما هي علاقة الطفل بالاسرة';

  @override
  String get csFamilyProvider => 'من يتولى الانفاق على الأسرة';

  @override
  String get csFamilyIncome => 'دخل الأسرة الاقتصادي';

  @override
  String get csIncomeExcellent => 'ممتاز';

  @override
  String get csIncomeAverage => 'متوسط';

  @override
  String get csIncomeWeak => 'ضعيف';

  @override
  String get csFamilyMembersCount => 'عدد أفراد الأسرة';

  @override
  String get csFamilyMembersCountHint => 'ادخل عدد أفراد الأسرة';

  @override
  String get csFamilyHealthConditions =>
      'هل يعاني أحد أفراد الأسرة من أمراض أو مشكلات معينة أو غير وراثية';

  @override
  String get csAffectedPerson => 'من هو الشخص الذي يعاني من المرض';

  @override
  String get csAffectedPersonHint => 'ادخل قرابة الطفل بالشخص';

  @override
  String get csDiseaseName => 'ما هو المرض';

  @override
  String get csDiseaseNameHint => 'ادخل المرض';

  @override
  String get csAddAnotherPerson => 'أضف شخص أخر';

  @override
  String get csOptional => '(اختياري)';

  @override
  String get csYes => 'نعم';

  @override
  String get csNo => 'لا';

  @override
  String get csIfPreviousYes => '(في حال اجابة السؤال السابق نعم)';

  @override
  String get csIfPreviousNo => '(في حال اجابة السؤال السابق لا)';

  @override
  String get csFamilyProviderFather => 'الاب';

  @override
  String get csFamilyProviderMother => 'الأم';

  @override
  String get csFamilyProviderRelative => 'احد الاقارب';

  @override
  String get csSection4Title => 'المعلومات الطبية وتاريخ الولادة';

  @override
  String get csSection4Subtitle => 'فترة الحمل';

  @override
  String get csS4TookMedication => 'هل تناولت الام أدوية أثناء فترة الحمل';

  @override
  String get csS4MedicationType => 'ما هو نوع الادوية';

  @override
  String get csS4MedicationTypeHint => 'ادخل نوع الادوية';

  @override
  String get csS4HadDoctorFollowUp =>
      'هل تابعت و راجعت الام الطبيب أثناء فترة الحمل';

  @override
  String get csS4FollowUpRegular =>
      'هل كانت المتابعة و المراجعة للطبيب بانتظام';

  @override
  String get csS4ExposedToRadiation => 'هل تعرضت الام للاشعة أثناء فترة الحمل';

  @override
  String get csS4HadInjuries => 'هل تعرضت الام لاي اصابات او سقطات او حوادث';

  @override
  String get csS4InjuriesType => 'ما نوع تلك الصابات و السقطات و الحوادث';

  @override
  String get csS4InjuriesTypeHint => 'ادخل نوع الحوادث';

  @override
  String get csS4PsychologicalTrauma =>
      'هل تعرضت الام لصدمات نفسية أثناء الحمل';

  @override
  String get csS4PsychologicalTraumaNote =>
      '(مثل موت احد الاقارب او تعرض احد الاقارب الذي حادث مؤلف)';

  @override
  String get csS4NineMonths => 'هل مدة الحمل تسعة شهور';

  @override
  String get csS4DurationLabel => 'ما هي مدة الحمل';

  @override
  String get csS4DurationHint => 'ادخل عدد شهور الحمل';

  @override
  String get csS4DiseasesDuringPregnancy =>
      'هل اصيب الام بأي من الامراض التالية أثناء فترة الحمل';

  @override
  String get csS4Diabetes => 'السكري';

  @override
  String get csS4BloodPressure => 'الضغط';

  @override
  String get csS4Albuminuria => 'الزلال';

  @override
  String get csS4Preeclampsia => 'تسمم الحمل';

  @override
  String get csS4Rubella => 'الحصبة الالمانية';

  @override
  String get csS4Bleeding => 'نزيف';

  @override
  String get csS4InfectiousDiseases =>
      'هل اصيبت الام بالامراض المعدية أثناء فترة الحمل';

  @override
  String get csS4InfectiousDiseaseType => 'ما نوع المرض الذي اصيبت به الام';

  @override
  String get csS4ChronicDiseases => 'هل الام تعاني من اية امراض مزمنة';

  @override
  String get csS4ChronicDiseaseType => 'ما نوع المرض الذي اصيبت به الام';

  @override
  String get csS4LabTests => 'هل اجرت الام فحوص مخبرية أثناء فترة الحمل';

  @override
  String get csS4LabTestsType => 'ما نوع الفحص المخبري و في اي قترة من الحمل';

  @override
  String get csS4LabTestsHint => 'ادخل نوع الفحص و فترة الحمل';

  @override
  String get csS4StabilizingMedication =>
      'هل تناولت الام الادوية المثبتة للحمل';

  @override
  String get csS4TotalPregnancies => 'ما هي عدد الاحمال الام حتى الان';

  @override
  String get csS4TotalPregnanciesHint => 'ادخل عدد مرات حمل الام';

  @override
  String get csS4HadMiscarriage => 'هل اجهضت قبل ذلك';

  @override
  String get csS4ExposedToSmoking => 'هل تعرضت الام للتدخين أثناء فترة الحمل';

  @override
  String get csS4DiseaseTypeHint => 'ادخل نوع المرض';

  @override
  String get csSection5Title => 'المعلومات الطبية وتاريخ الولادة';

  @override
  String get csSection5Subtitle => 'فترة الولادة';

  @override
  String get csS5BirthType => 'هل كانت الولادة طبيعية ام قيصرية';

  @override
  String get csS5BirthTypeNatural => 'طبيعية';

  @override
  String get csS5BirthTypeCesarean => 'قيصرية';

  @override
  String get csS5BirthPlace => 'هل كانت الولادة في المنزل ام المستشفى';

  @override
  String get csS5BirthPlaceHome => 'المنزل';

  @override
  String get csS5BirthPlaceHospital => 'المستشفى';

  @override
  String get csS5UsedBirthTools =>
      'هل استخدمت ادوات الولادة مثل الملقط او الشفط اثناء الولادة';

  @override
  String get csS5TookDeliveryMedication =>
      'هل تناولت الام ادوية او مساعدة للولادة (الطلق)';

  @override
  String get csS5OxygenDeficiency =>
      'هل تعرضت الام اثناء الولادة لنقص الاوكسجين عن الجنين';

  @override
  String get csS5UmbilicalCordWrapped => 'هل إلتف الحبل السري حول الجنين';

  @override
  String get csS5BreechPosition => 'هل وضع الجنين في الخداج';

  @override
  String get csS5BreechDurationLabel => 'كم استغرق وقت الخداج';

  @override
  String get csS5BreechDurationHint => 'ادخل مدة وضع الطفل في الخداج';

  @override
  String get csS5HadJaundice => 'هل اصيب الطفل بالصفار او اليرقان';

  @override
  String get csS5HadCongenitalDeformities => 'هل كان يعاني من تشوهات خلقية';

  @override
  String get csS5CongenitalDeformitiesType => 'ما هي هذه التشوهات الخلقية';

  @override
  String get csS5CongenitalDeformitiesHint => 'ادخل نوع التشوهات';

  @override
  String get csS5BirthWeight => 'ما وزن الجنين عند الولادة';

  @override
  String get csS5BirthWeightHint => 'ادخل وزن الطفل';

  @override
  String get csS5HadRhTest => 'هل تم اجراء فحص العامل الريزيسي (RH)';

  @override
  String get csSection6Title => 'التواصل و اللغة و التفاعل الاجتماعي';

  @override
  String get csS6CommMethodTitle => 'طريقة التواصل الاساسية لدى الطفل';

  @override
  String get csS6CommMethodSingleWords => 'كلمات مفردة';

  @override
  String get csS6CommMethodShortSentences => 'جمل قصيرة';

  @override
  String get csS6CommMethodFullSentences => 'جمل كاملة';

  @override
  String get csS6CommMethodSigns => 'اشارات';

  @override
  String get csS6CommMethodPecs => 'صور / PECS';

  @override
  String get csS6CommMethodDevice => 'جهاز تواصل';

  @override
  String get csS6CommMethodManualPull => 'سحب يدوي';

  @override
  String get csS6CommMethodCrying => 'بكاء/ سلوكيات';

  @override
  String get csS6CommMethodOther => 'اخرى';

  @override
  String get csS6CommMethodOtherLabel => 'ما هي طريقة تواصل الطفل';

  @override
  String get csS6CommMethodOtherHint => 'ادخل طريقة التواصل';

  @override
  String get csS6CommMethodOtherNote => '(في حال اجابة السؤال السابق اخرى)';

  @override
  String get csS6ExprUnderstandTitle => 'القدرة على التعبير و الفهم';

  @override
  String get csS6ExpressesNeeds => 'التعبير عن الاحتياجات';

  @override
  String get csS6RequestsPreferred => 'طلب الاشياء المفضلة';

  @override
  String get csS6UnderstandsSimple => 'فهم التعليمات البسيطة';

  @override
  String get csS6UnderstandsComplex => 'فهم التعليمات المركبة';

  @override
  String get csS6OptionYes => 'نعم';

  @override
  String get csS6OptionSometimes => 'احيانا';

  @override
  String get csS6OptionNo => 'لا';

  @override
  String get csS6SocialCommTitle => 'التواصل الاجتماعي';

  @override
  String get csS6InitiatesInteraction => 'يبادر بالتفاعل';

  @override
  String get csS6RespondsToOthers => 'يستجيب للاخرين';

  @override
  String get csS6PrefersSoloPlay => 'يفضل اللعب الفردي';

  @override
  String get csS6ImitatesOthers => 'يقلد الاخرين';

  @override
  String get csS6DifficultyPeers => 'صعوبة اللعب مع الاقران';

  @override
  String get csS6DifficultyTurns => 'صعوبة في تبادل الادوار';

  @override
  String get csS6CommNotes => 'ملاحظات اضافية حول التواصل و التفاعل الاجتماعي';

  @override
  String get csS6CommNotesHint => 'ادخل الملاحظات';

  @override
  String get csS6PragmaticTitle => 'تقييم المهارات الاجتماعية و البراغماتية';

  @override
  String get csS6InitiatesConversation => 'بدء محادثة مع الاخرين';

  @override
  String get csS6MaintainsEyeContact => 'المحافظة على التواصل البصري';

  @override
  String get csS6UnderstandsBodyLanguage => 'فهم لغة الجسد و تعبيرات الوجه';

  @override
  String get csS6UnderstandsJokes => 'فهم النكات او الكلام المجازي';

  @override
  String get csS6ConversationTurnTaking => 'تبادل الادوار في الحديث';

  @override
  String get csS6OptionAlways => 'دائما';

  @override
  String get csS6OptionRarely => 'نادرا';

  @override
  String get csS6OptionGood => 'جيد';

  @override
  String get csS6OptionAcceptable => 'مقبول';

  @override
  String get csS6OptionWeak => 'ضعيف';

  @override
  String get csS6OptionPartial => 'جزئياً';

  @override
  String get csS6OptionMastered => 'متقن';

  @override
  String get csS6OptionInTraining => 'تحت التدريب';

  @override
  String get csS6OptionMissing => 'مفقود';

  @override
  String get csSection7Title => 'مهارات الحياة اليومية و الاستقلالية';

  @override
  String get csS7EatingTitle => 'الأكل و الشرب';

  @override
  String get csS7UsesSpoonFork => 'يستخدم الملعقة/ الشوكة';

  @override
  String get csS7SelectiveEater => 'انتقائي في الطعام';

  @override
  String get csS7UsesHandsForEating => 'يستخدم اليدين للأكل';

  @override
  String get csS7RefusesTextures => 'يرفض قواماً معيناً';

  @override
  String get csS7DrinksFromCup => 'يشرب من كوب/ قشة';

  @override
  String get csS7NeedsFullAssistance => 'يحتاج مساعدة كاملة';

  @override
  String get csS7HowRequestsFoodLabel => 'كيف يطلب الطفل الطعام؟';

  @override
  String get csS7HowRequestsFoodHint => 'صف كيف يطلب الطفل الطعام...';

  @override
  String get csS7DressingTitle => 'اللبس';

  @override
  String get csS7RemovesShoesSocks => 'يخلع الحذاء/ الجوارب';

  @override
  String get csS7ClosesZipperButtons => 'يغلق السحاب / الأزرار';

  @override
  String get csS7DressesWithAssistance => 'يلبس الملابس بمساعدة';

  @override
  String get csS7HygieneTitle => 'النظافة الشخصية';

  @override
  String get csS7WashesHandsFace => 'غسل اليدين/ الوجه';

  @override
  String get csS7BathesAlone => 'الاستحمام بمفرده';

  @override
  String get csS7CleansTeetHair => 'تنظيف الاسنان / الشعر';

  @override
  String get csS7NailCuttingDifficulty => 'قص الاظافر (يمثل صعوبة)';

  @override
  String get csS7BathroomSleepTitle => 'استخدام الحمام و النوم';

  @override
  String get csS7BathroomIndependenceLabel => 'الاستقلالية في الحمام';

  @override
  String get csS7OptionFullyIndependent => 'مستقل تماماً';

  @override
  String get csS7OptionCurrentlyTraining => 'يتدرب حالياً';

  @override
  String get csS7OptionUsesDiapers => 'يستخدم حفاض';

  @override
  String get csS7HowRequestsSleepLabel => 'كيف يطلب الطفل النوم؟';

  @override
  String get csS7HowRequestsSleepHint => 'صف كيف يطلب الطفل النوم...';

  @override
  String get csSection8Title => 'الملف الحسي و السلوكي';

  @override
  String get csS8ProblemBehaviorsTitle => 'سلوكيات المشكلة (المثيرة للقلق)';

  @override
  String get csS8BehaviorDescHint => 'وصف السلوكيات و تكراره...';

  @override
  String get csS8Aggression => 'العدوان تجاه الآخرين';

  @override
  String get csS8SelfHarm => 'إيذاء الذات';

  @override
  String get csS8StereotypicalBehaviors => 'سلوكيات نمطية (رفرفة / دوران)';

  @override
  String get csS8ResistanceToChange => 'مقاومة التغيير / الانتقال';

  @override
  String get csS8ExcessiveAttachment => 'التعلق المفرط بأشياء محددة';

  @override
  String get csS8BehavioralPatternsTitle =>
      'الأنماط السلوكية المفيدة و المتكررة';

  @override
  String get csS8PatternLabel => 'النمط';

  @override
  String get csS8PatternHint => 'صف النمط...';

  @override
  String get csS8PracticesLabel => 'الممارسات';

  @override
  String get csS8PracticesHint => 'صف الممارسات...';

  @override
  String get csS8ExpectedFunctionLabel => 'الوظيفة المتوقعة';

  @override
  String get csS8ExpectedFunctionHint => 'صف الوظيفة المتوقعة...';

  @override
  String get csS8AddPattern => 'أضف نمط آخر';

  @override
  String get csS8SensoryTitle => 'التكامل الحسي و التنظيم';

  @override
  String get csS8GeneralStateLabel =>
      'الوصف العام (الحالة العامة للنشاط الانتباهي)';

  @override
  String get csS8StateCalm => 'هادئ';

  @override
  String get csS8StateDistracted => 'شارد';

  @override
  String get csS8StateVeryActive => 'نشيط جداً';

  @override
  String get csS8StateFastTransition => 'اتجاه بسرعة';

  @override
  String get csS8StateAbnormal => 'شاذ';

  @override
  String get csS8GeneralStateNotesHint => 'صف الحالة العامة...';

  @override
  String get csS8SensoryInterestsLabel => 'الاهتمامات الحسية الخاصة';

  @override
  String get csS8HasSensoryIssues => 'هل لدى الطفل مشكلة في الحواس؟';

  @override
  String get csS8SensoryIssuesNotesHint => 'أضف ملاحظات...';

  @override
  String get csS8HearingIssue => 'سمع (مكسبة، فقدان)';

  @override
  String get csS8TouchIssue => 'لمس (حساسية)';

  @override
  String get csS8TasteIssue => 'ذوق (وضع في الفم)';

  @override
  String get csS8VestibularIssue => 'وضع جسدي (أصوات، دوران)';

  @override
  String get csS8VisualSensoryIssue => 'لون (دوران، ضوء)';

  @override
  String get csS8SensoryNotesHint => 'أضف ملاحظات...';

  @override
  String get csS8SensoryReactionLabel => 'رد فعل الطفل على المحاسيس';

  @override
  String get csS8SensoryReactionHint => 'صف رد فعل الطفل...';

  @override
  String get csS8SocialBehaviorsTitle => 'السلوكيات الاجتماعية';

  @override
  String get csS8MakesFriendsEasily => 'هل يكون الطفل صداقات بسهولة؟';

  @override
  String get csS8MakesFriendsNotesHint => 'صف...';

  @override
  String get csS8SharesInterests =>
      'هل يشارك الطفل المهارات الاجتماعية أو الاهتمامات؟';

  @override
  String get csS8SharesInterestsNotesHint => 'صف...';

  @override
  String get csS8AbuseExposure =>
      'هل تعرض الطفل لأي شكل من أشكال الإيذاء أو الإهانة الجسدية أو العنف الأسري؟';

  @override
  String get csS8AbuseWitnessed => 'نعم، شاهد السلوك قبل تجنبه';

  @override
  String get csS8AbuseNotesHint => 'صف...';

  @override
  String get csS8HasSignificantSocialEvent =>
      'هل تعرض الطفل لحدث اجتماعي كبير الأثر (مثل الإيذاء أو فقدان صديق مقرب)؟';

  @override
  String get csS8SignificantSocialEventNotesHint => 'صف...';

  @override
  String get csS8ReactionToNegativeBehavior =>
      'ما هي رد فعل الطفل على السلوك السلبي من الآخرين؟';

  @override
  String get csS8ReactionToNegativeBehaviorHint => 'صف رد الفعل...';

  @override
  String get csSection9Title => 'القدرات و نقاط القوة و الاهتمامات';

  @override
  String get csS9ObservedStrengthsLabel => 'نقاط القوة الملحوظة';

  @override
  String get csS9ObservedStrengthsHint => 'اوصف نقاط القوة الملحوظة...';

  @override
  String get csS9PreferredActivitiesTitle => 'الانشطة المفضلة/ المعززات';

  @override
  String get csS9ActivitySensoryGames => 'العاب حسية';

  @override
  String get csS9ActivityElectronics => 'إلكترونيات';

  @override
  String get csS9ActivityMotor => 'حركية';

  @override
  String get csS9ActivityFoods => 'أطعمة';

  @override
  String get csS9ActivityCharacters => 'شخصيات';

  @override
  String get csS9ActivityMusic => 'موسيقى';

  @override
  String get csS9ActivityOther => 'أخرى';

  @override
  String get csS9OtherActivitiesLabel =>
      'ما هي الانشطة المفضلة للطفل (في حال اختيار اخرى في السؤال السابق)';

  @override
  String get csS9OtherActivitiesHint => 'ادخل الانشطة المفضلة للطفل';

  @override
  String get csS9PreferenceScanTitle => 'مسح التفضيلات و المعززات';

  @override
  String get csS9PrefFoodLabel => 'غذائي';

  @override
  String get csS9PrefSensoryLabel => 'حسي';

  @override
  String get csS9PrefSocialLabel => 'اجتماعي';

  @override
  String get csS9PrefMaterialLabel => 'مادي / نشاط';

  @override
  String get csS9PrefExampleHint => 'مثال';

  @override
  String get csS9PrefHighlyPreferred => 'مفضل جداً';

  @override
  String get csS9PrefAcceptable => 'مقبول';

  @override
  String get csS9PrefNotPreferred => 'لا يفضل';

  @override
  String get csS9PositiveDistinctionLabel => 'ما الذي يميز الطفل بشكل إيجابي';

  @override
  String get csS9PositiveDistinctionHint => 'اوصف ما يميز الطفل بشكل إيجابي...';

  @override
  String get csSection10Title => 'التعليمي و الخدمات';

  @override
  String get csS10EnrolledInSchool => 'الالتحاق التعليمي';

  @override
  String get csS10SchoolNameLabel => 'اسم المدرسة';

  @override
  String get csS10SchoolNameHint => 'ادخل اسم مدرسة الطفل';

  @override
  String get csS10SchoolGradeLabel => 'الصف';

  @override
  String get csS10SchoolGradeHint => 'ادخل صف الطفل';

  @override
  String get csS10CurrentServicesTitle => 'الخدمات الحالية/ السابقة';

  @override
  String get csS10ServiceABA => 'ABA';

  @override
  String get csS10ServiceSpeech => 'تخاطب';

  @override
  String get csS10ServiceOccupational => 'علاج وظيفي';

  @override
  String get csS10ServicePhysical => 'علاج طبيعي';

  @override
  String get csS10ServicePsychological => 'نفسي';

  @override
  String get csS10ServiceSpecialEd => 'تربية خاصة';

  @override
  String get csS10ServiceOther => 'أخرى';

  @override
  String get csS10ServiceNone => 'لا يوجد';

  @override
  String get csS10OtherServiceLabel =>
      'ما هي الخدمات الحالية/ السابقة (في حال اختيار اخرى في السؤال السابق)';

  @override
  String get csS10OtherServiceHint => 'ادخل الخدمات';

  @override
  String get csS10ServiceDurationLabel => 'مدة الخدمات';

  @override
  String get csS10ServiceDurationHint => 'ادخل مدة الخدمة';

  @override
  String get csS10HasIEP => 'هل توجد خطة تربوية فردية';

  @override
  String get csS10PreviousReportsTitle => 'تقارير تقييم سابقة';

  @override
  String get csS10ReportVineland => 'Vineland';

  @override
  String get csS10ReportEFL => 'EFL';

  @override
  String get csS10ReportAFLS => 'AFLS';

  @override
  String get csS10ReportABLLS => 'ABLLS-R';

  @override
  String get csS10ReportVBMAPP => 'VB-MAPP';

  @override
  String get csS10ReportOther => 'أخرى';

  @override
  String get csS10ReportNone => 'لا يوجد';

  @override
  String get csS10SchoolSupportTitle =>
      'تفاصيل البيئة التعليمية و الدعم المدرسي';

  @override
  String get csS10ClassTypeLabel => 'نوع الفصل الدراسي';

  @override
  String get csS10ClassTypeFullInclusion => 'دمج كلي';

  @override
  String get csS10ClassTypePartialInclusion => 'دمج جزئي';

  @override
  String get csS10ClassTypeSpecialClass => 'فصل خاص';

  @override
  String get csS10ClassTypeCareCenter => 'مركز رعاية';

  @override
  String get csS10HasShadowTeacher => 'وجود معلم ظل';

  @override
  String get csS10ShadowTeacherNameLabel => 'اسم المعلم';

  @override
  String get csS10ShadowTeacherNameHint => 'ادخل اسم المعلم';

  @override
  String get csS10EnvironmentalModsTitle => 'التعديلات البيئية';

  @override
  String get csS10ModReduceDistractions => 'تقليل مشتتات';

  @override
  String get csS10ModVisualSchedule => 'جدول بصري';

  @override
  String get csS10ModSpecificSeat => 'مكان جلوس محدد';

  @override
  String get csS10ModOther => 'أخرى';

  @override
  String get csS10SchoolBehaviorLabel => 'السلوك داخل المدرسة';

  @override
  String get csS10SchoolBehaviorHint => 'اوصف سلوك الطفل داخل المدرسة...';

  @override
  String get csSection11Title => 'أولويات الاسرة و الاهداف';

  @override
  String get csS11TopConcernsLabel => 'اهم 3 مخاوف لدى الاسرة';

  @override
  String get csS11TopConcernsHint => 'اوصف اهم 3 مخاوف...';

  @override
  String get csS11TopGoalsLabel => 'اهم 3 اهداف ترغب الاسرة بتحقيقها';

  @override
  String get csS11TopGoalsHint => 'اوصف اهم 3 اهداف...';

  @override
  String get csS11SessionTimePrefsLabel => 'تفضيلات وقت الجلسة';

  @override
  String get csS11SessionTimePrefsHint => 'ادخل تفضيلات وقت الجلسة';

  @override
  String get csS11ParentTrainingReadinessLabel => 'الاستعداد للتدريب الوالدي';

  @override
  String get csS11OptionMaybe => 'ربما';

  @override
  String get csSection12Title => 'التطور النمائي';

  @override
  String get csSection12Subtitle => 'الجوانب التربوية';

  @override
  String get csS12LearningReadiness => 'مستوى إستعداد الطفل للتعلم؟';

  @override
  String get csS12LearningGood => 'جيد';

  @override
  String get csS12LearningAverage => 'متوسط';

  @override
  String get csS12LearningWeak => 'ضعيف';

  @override
  String get csS12AbsentFromCenter => 'هل إنقطع الطفل عن المركز؟';

  @override
  String get csS12AbsenceDuration => 'كم مدة انقطاع الطفل عن المركز؟';

  @override
  String get csS12AbsenceDurationHint => 'ادخل مدة الإنقطاع';

  @override
  String get csS12AbsenceReason => 'ما سبب إنقطاع الطفل عن المركز؟';

  @override
  String get csS12AbsenceReasonHint => 'ادخل سبب الإنقطاع';

  @override
  String get csS12ParticipatesInActivities =>
      'هل شارك الطفل في النشاطات اللاصفية في المركز؟';

  @override
  String get csS12LikesCenter => 'هل يحب الطفل المركز؟';

  @override
  String get csS12TiresFastInClass => 'هل يتعب بسرعة في القسم؟';

  @override
  String get csS12TeacherRelationship => 'العلاقة مع المعلم؟';

  @override
  String get csS12PeersRelationship => 'العلاقة مع الزملاء؟';

  @override
  String get csS12RelationshipGood => 'حسنة';

  @override
  String get csS12RelationshipBad => 'سيئة';

  @override
  String get csS12ComprehensionLevel => 'فحص الفهم: هل فهمه؟';

  @override
  String get csS12ComprehensionGood => 'حسن';

  @override
  String get csS12ComprehensionAverage => 'متوسط';

  @override
  String get csS12ComprehensionWeak => 'ضعيف';

  @override
  String get csS12ComprehensionNone => 'معدم';

  @override
  String get csS12NameRecognition => 'التعرف على الأسماء:';

  @override
  String get csS12KnowsFriendsNames => 'أسماء أصدقائه';

  @override
  String get csS12KnowsTeachersNames => 'أسماء المربين';

  @override
  String get csS12KnowsClassChildren => 'أطفال القسم';

  @override
  String get csS12ExpressionTest => 'فحص التعبير:';

  @override
  String get csS12UsesSentences => 'إستعمال الجمل البسيطة';

  @override
  String get csS12UsesVerbs => 'إستعمال الأفعال';

  @override
  String get csS12UsesConnectors => 'أستعمال أدوات الربط';

  @override
  String get csS12BodyAwareness => 'فحص مكتسبات الجسم:';

  @override
  String get csS12BodyImage => 'صورة الجسم';

  @override
  String get csS12BodyDirection => 'إتجاه الجسم';

  @override
  String get csS12AuditoryPerception => 'الإدراك و الذاكرة السمعية:';

  @override
  String get csS12SoundDirection => 'إتجاه الأصوات';

  @override
  String get csS12AnimalSounds => 'إدراك صوت الحيوانات';

  @override
  String get csS12VisualPerception => 'الإدراك و الذاكرة البصرية:';

  @override
  String get csS12RecognizesDifferences => 'أدراك الإختلاف';

  @override
  String get csS12RecognizesSimilarities => 'إدراك التشابه';

  @override
  String get csS12ColorConcept => 'مفهوم الألوان';

  @override
  String get csS12ShapeConcept => 'مفهوم الأشكال';

  @override
  String get csSection13Title => 'التقييم الأولي و خطة المتابعة';

  @override
  String get csS13PriorityLevel => 'مستوى الأولوية';

  @override
  String get csS13PriorityLow => 'منخفضة';

  @override
  String get csS13PriorityMedium => 'متوسطة';

  @override
  String get csS13PriorityHigh => 'عالية';

  @override
  String get csS13PriorityUrgent => 'عاجلة';

  @override
  String get csS13SpecializationsTitle => 'التخصصات المقترحة';

  @override
  String get csS13SpecABA => 'ABA';

  @override
  String get csS13SpecSpeech => 'تخاطب';

  @override
  String get csS13SpecOccupational => 'وظيفي';

  @override
  String get csS13SpecPhysical => 'طبيعي';

  @override
  String get csS13SpecPsychological => 'نفسي';

  @override
  String get csS13SpecSpecialEd => 'تربية خاصة';

  @override
  String get csS13AdditionalReqsTitle => 'المتطلبات الاضافية';

  @override
  String get csS13ReviewOtherReports => 'مراجعة تقارير اخرى';

  @override
  String get csS13DirectObservation => 'ملاحظة مباشرة';

  @override
  String get csS13FamilyMeeting => 'اجتماع اسري';

  @override
  String get csS13NotesAndNextStepsLabel => 'ملخص الملاحظات و الخطوات التالية';

  @override
  String get csS13NotesAndNextStepsHint => 'ادخل الملاحظات والخطوات التالية...';

  @override
  String get csS13NextAssessmentDateLabel => 'تاريخ التقييم القادم';

  @override
  String get csS13NextAssessmentTimeLabel => 'موعد التقييم القادم';

  @override
  String get csSectionDocsTitle => 'الوثائق و الموافقات';

  @override
  String get csSectionDocsSubmittedTitle => 'الوثائق المقدمة';

  @override
  String get csSectionDocsID => 'هوية';

  @override
  String get csSectionDocsMedicalReports => 'تقارير طبية';

  @override
  String get csSectionDocsDiagnosticReports => 'تقارير تشخيصية';

  @override
  String get csSectionDocsSchoolReports => 'تقارير مدرسية';

  @override
  String get csSectionDocsPrevTreatmentReports => 'تقارير علاجية سابقة';

  @override
  String get csSectionDocsOther => 'اخرى';

  @override
  String get csSectionDocsOtherLabel => 'ما هي الوثائق المقدمة';

  @override
  String get csSectionDocsOtherNote => '(في حال اختيار اخرى في السؤال السابق)';

  @override
  String get csSectionDocsOtherHint => 'ادخل اسم الوثائق';

  @override
  String get csSectionDocsConsentsTitle => 'الموافقات';

  @override
  String get csSectionDocsConsentPrivacy => 'سياسة السرية';

  @override
  String get csSectionDocsConsentInfoSharing => 'مشاركة المعلومات';

  @override
  String get csSectionDocsConsentOtherComms => 'التواصلات مع جهات اخرى';

  @override
  String get csSectionDocsConsentAssessments => 'استكمال التقييمات';

  @override
  String get csSectionDocsConsentFuturePlan => 'خطة الخطوات القادمة';

  @override
  String get csSection14Title => 'الروتين اليومي';

  @override
  String get csS14WeekdayRoutineLabel => 'روتين ايام الاسبوع (العمل/ المدرسة)';

  @override
  String get csS14WeekdayRoutineHint => 'صف روتين أيام الأسبوع...';

  @override
  String get csS14WeekendRoutineLabel => 'روتين عطلة نهاية الاسبوع';

  @override
  String get csS14WeekendRoutineHint => 'صف روتين عطلة نهاية الأسبوع...';

  @override
  String get csSection15Title => 'التوقيعات';

  @override
  String get csS15GuardianNameLabel => 'اسم ولي الامر / مقدم الرعاية';

  @override
  String get csS15GuardianNameHint => 'ادخل اسم ولي الامر';

  @override
  String get csS15SignatureLabel => 'التوقيع';

  @override
  String get csS15ClearSignature => 'مسح';

  @override
  String get csS15DateLabel => 'التاريخ';

  @override
  String get csS15SpecialistNameLabel => 'اسم الاخصائي المستقبل للحالة';

  @override
  String get csS15SpecialistNameHint => 'ادخل اسم الاخصائي';

  @override
  String get csS15JobTitleLabel => 'المسمى الوظيفي';

  @override
  String get csS15JobTitleHint => 'ادخل المسمى الوظيفي';

  @override
  String get csS15AddTeamMember =>
      '+ اضافة اعضاء الفريق المشاركين في المقابلة ان وجد';

  @override
  String get csS15SpecializationLabel => 'التخصص';

  @override
  String get csS15SpecializationHint => 'ادخل التخصص';

  @override
  String get csS15MemberNameLabel => 'الاسم';

  @override
  String get csS15MemberNameHint => 'ادخل العضو المشارك';

  @override
  String get parentRole => 'ولي أمر';

  @override
  String get receptionistRole => 'موظف استقبال';

  @override
  String get searchTherapist => 'البحث عن معالج...';

  @override
  String therapistOf(String name) {
    return 'معالج $name';
  }

  @override
  String get csS4ComprehensiveTitle => 'التاريخ الطبي الشامل';

  @override
  String get csS4MedHistYes => 'نعم';

  @override
  String get csS4MedHistNo => 'لا';

  @override
  String get csS4HearingVision => 'مشاكل سمعية/بصرية';

  @override
  String get csS4SeizuresHeadInjury => 'تشنجات/إصابة في الرأس';

  @override
  String get csS4SleepNutrition => 'مشاكل النوم/التغذية';

  @override
  String get csS4BloodAnemiaResp => 'أمراض الدم/الأنيميا/مشاكل تنفسية';

  @override
  String get csS4DentalPerception => 'الأسنان/الإدراك';

  @override
  String get csS4FattyFailureStunting => 'نقص الوزن/التقزم';

  @override
  String get csS4PrevTreatmentTitle => 'العلاجات السابقة';

  @override
  String get csS4AddTreatment => 'إضافة علاج';

  @override
  String get csS4CurrentMedsTitle => 'الأدوية الحالية';

  @override
  String get csS4AddMedication => 'إضافة دواء';

  @override
  String get csS4DiagnosesTitle => 'التشخيصات';

  @override
  String get csS4DiagnosedOption => 'مشخص';

  @override
  String get csS4SuspectedOption => 'مشتبه به';

  @override
  String get csS4ASD => 'طيف التوحد';

  @override
  String get csS4ADHD => 'فرط الحركة وتشتت الانتباه';

  @override
  String get csS4LearningDelay => 'تأخر تعلم';

  @override
  String get csS4DownSyndrome => 'متلازمة داون';

  @override
  String get csS4OtherDiagnosis => 'تشخيص آخر';

  @override
  String get csS4MedAssessTitle => 'التقييمات الطبية';

  @override
  String get csS4NormalOption => 'طبيعي';

  @override
  String get csS4AbnormalOption => 'غير طبيعي';

  @override
  String get csS4AssessmentNotes => 'ملاحظات التقييم';

  @override
  String get csS4AuditoryVisual => 'سمعي/بصري';

  @override
  String get csS4BrainScanEEG => 'أشعة مقطعية/رسم مخ';

  @override
  String get csS4GeneticTest => 'تحليل جيني';

  @override
  String get csS4PsychoIQ => 'نفسي/اختبار ذكاء';

  @override
  String get csS4DietAllergyTitle => 'النظام الغذائي والحساسية';

  @override
  String get csS4HasAllergiesQuestion => 'هل يعاني الطفل من حساسية؟';

  @override
  String get csS4AllergyTypeLabel => 'نوع الحساسية';

  @override
  String get csS4AllergyTypeHint => 'مثل: حساسية طعام، جلدية';

  @override
  String get csS4SpecialDietQuestion => 'هل يتبع الطفل نظاماً غذائياً خاصاً؟';

  @override
  String get csS4GlutenFree => 'خالٍ من الجلوتين';

  @override
  String get csS4CaseinFree => 'خالٍ من الكازين';

  @override
  String get csS4Biometric => 'حيوي (Biometric)';

  @override
  String get csS4OtherDiet => 'نظام آخر';

  @override
  String get csS4OtherDietHint => 'اذكر النظام الغذائي';

  @override
  String get csS4AltVaccinesQuestion => 'تطعيمات بديلة';

  @override
  String get csS4AltVaccinesDescLabel => 'سبب التطعيمات البديلة';

  @override
  String get csS4AltVaccinesDescHint => 'اذكر سبب التطعيمات البديلة';

  @override
  String get csS4AllVaccinesOnTimeQuestion => 'هل التطعيمات في وقتها؟';

  @override
  String get csS4RemoveTreatment => 'إزالة العلاج';

  @override
  String get csS4TreatmentTypeLabel => 'نوع العلاج';

  @override
  String get csS4TreatmentTypeHint => 'حدد نوع العلاج';

  @override
  String get csS4TreatmentSpeech => 'تخاطب';

  @override
  String get csS4TreatmentOccupational => 'علاج وظيفي';

  @override
  String get csS4TreatmentPhysical => 'علاج طبيعي';

  @override
  String get csS4TreatmentABA => 'تحليل سلوك (ABA)';

  @override
  String get csS4TreatmentPsychological => 'علاج نفسي';

  @override
  String get csS4TreatmentOther => 'علاج آخر';

  @override
  String get csS4OrganizationLabel => 'المركز/العيادة';

  @override
  String get csS4OrganizationHint => 'مثل: مركز التأهيل';

  @override
  String get csS4ImprovementsLabel => 'التحسن';

  @override
  String get csS4NotesHint => 'أضف ملاحظات إضافية';

  @override
  String get csS4MedNameLabel => 'اسم الدواء';

  @override
  String get csS4MedNameHint => 'مثل: ريتالين';

  @override
  String get csS4DosageTimingLabel => 'الجرعة والتوقيت';

  @override
  String get csS4DosageTimingHint => 'مثل: 5مل مرتين';

  @override
  String get csS4UsageDurationLabel => 'مدة الاستخدام';

  @override
  String get csS4UsageDurationHint => 'مثل: 6 أشهر';

  @override
  String get csS5Subtitle => 'معلومات فترة الولادة';

  @override
  String get csS5SocialEmotionalTitle => 'التطور الاجتماعي والعاطفي';

  @override
  String get csS5SocialSmile => 'الابتسامة الاجتماعية';

  @override
  String get csS5KnowsFamilyMembers => 'يعرف أفراد العائلة';

  @override
  String get csS5RespondsToName => 'يستجيب لاسمه';

  @override
  String get csS5ShowsAffection => 'يظهر العاطفة';

  @override
  String get csS5ShyOrFearful => 'خجول أو خائف';

  @override
  String get csS5CognitiveTitle => 'التطور المعرفي';

  @override
  String get csS5ImitatesAdults => 'يقلد البالغين';

  @override
  String get csS5PutsObjectsInMouth => 'يضع الأشياء في فمه';

  @override
  String get csS5RecognizesColors => 'يتعرف على الألوان';

  @override
  String get csS5ImaginativePlay => 'اللعب التخيلي';

  @override
  String get csS5FollowsInstructions => 'يتبع التعليمات';

  @override
  String get csS5LanguageTitle => 'التطور اللغوي';

  @override
  String get csS5Cooing => 'المناغاة';

  @override
  String get csS5TwoWordPhrases => 'جمل من كلمتين';

  @override
  String get csS5UsesGestures => 'يستخدم الإيماءات';

  @override
  String get csS5RequestsByWords => 'يطلب بالكلمات';

  @override
  String get csS5MotorTitle => 'التطور الحركي';

  @override
  String get csS5SittingCrawling => 'الجلوس/الزحف';

  @override
  String get csS5JumpingClimbing => 'القفز/التسلق';

  @override
  String get csS5WalkingWithoutHelp => 'المشي بدون مساعدة';

  @override
  String get csS5HoldingPenDrawing => 'مسك القلم/الرسم';

  @override
  String get csS5KickingThrowing => 'الركل/الرمي';

  @override
  String get csS5MilestoneAgesTitle => 'أعمار التطور';

  @override
  String get csS5SocialSmileMilestone => 'عمر الابتسامة الاجتماعية';

  @override
  String get csS5AgeHint => 'العمر بالشهور';

  @override
  String get csS5IndependentSitting => 'الجلوس المستقل';

  @override
  String get csS5IndependentWalking => 'المشي المستقل';

  @override
  String get csS5FirstFunctionalWord => 'أول كلمة وظيفية';

  @override
  String get csS5RegressionTitle => 'الانتكاسات التطورية';

  @override
  String get csS5RegressionQuestion => 'هل حدث أي انتكاس؟';

  @override
  String get csS5RegressionAgeLabel => 'عمر الانتكاسة';

  @override
  String get csS5RegressionAgeHint => 'بالأشهر عند الانتكاسة';

  @override
  String get csS5RegressionAgeNote => 'بالأشهر تقريباً';

  @override
  String get csS5RegressionDetailsLabel => 'تفاصيل الانتكاسة';

  @override
  String get csS5RegressionDetailsHint => 'صف المهارات التي فقدت';

  @override
  String get csS5NotesHint => 'أضف ملاحظات إضافية';

  @override
  String get downloadCaseStudy => 'تحميل دراسة الحالة';

  @override
  String get fillCaseStudyForm => 'تعبئة نموذج دراسة الحالة';

  @override
  String get totalFamilies => 'إجمالي العائلات';

  @override
  String get activeChildren => 'الأطفال النشطون';

  @override
  String get todayAppointments => 'مواعيد اليوم';

  @override
  String get quickActions => 'إجراءات سريعة';

  @override
  String get addFamily => 'إضافة عائلة';

  @override
  String get addChild => 'إضافة طفل';

  @override
  String get newAppointment => 'موعد جديد';

  @override
  String get changePassword => 'تغيير كلمة المرور';

  @override
  String get manageDailySessions => 'إدارة الجلسات العلاجية اليومية';

  @override
  String get today => 'اليوم';

  @override
  String get statusConfirmed => 'مؤكد';

  @override
  String get statusCancelled => 'ملغي';

  @override
  String get statusWaiting => 'قيد الانتظار';

  @override
  String get report => 'تقرير';

  @override
  String get printReport => 'طباعة التقرير';

  @override
  String get addFamilyTitle => 'إضافة عائلة جديدة';

  @override
  String get addChildTitle => 'إضافة طفل جديد';

  @override
  String get newAppointmentTitle => 'جدولة موعد جديد';

  @override
  String get resetPasswordTitle => 'إعادة تعيين كلمة المرور';

  @override
  String get personalInfo => 'المعلومات الشخصية';

  @override
  String get firstName => 'الاسم الأول';

  @override
  String get lastName => 'الاسم الأخير (العائلة)';

  @override
  String get nameHint => 'ادخل الاسم';

  @override
  String get usernameLabel => 'اسم المستخدم';

  @override
  String get usernameHint => 'رقم هوية الطفل';

  @override
  String get fatherMobile => 'رقم موبايل الأب';

  @override
  String get fatherMobileHint => 'رقم موبايل الأب';

  @override
  String get motherMobile => 'رقم موبايل الأم';

  @override
  String get motherMobileHint => 'رقم موبايل الأم';

  @override
  String get addChildrenSection => 'إضافة الاطفال';

  @override
  String get assignChildrenTitle => 'تعيين الأطفال';

  @override
  String get nationalId => 'رقم الهوية الوطنية';

  @override
  String get nationalIdHint => 'ادخل رقم هوية الطفل';

  @override
  String get diagnosisLabel => 'التشخيص';

  @override
  String get diagnosisHint => 'اختر التشخيص';

  @override
  String get birthDateLabel => 'تاريخ الميلاد الميلادي';

  @override
  String get ageFieldLabel => 'العمر';

  @override
  String get ageFieldHint => 'ادخل عمر الطفل';

  @override
  String get assignChildFamilyTitle => 'تحديد عائلة الطفل';

  @override
  String get nextButton => 'التالي';

  @override
  String get documentsTitle => 'الوثائق';

  @override
  String get addDocumentLabel => '+ أضف وثيقة';

  @override
  String get documentNameLabel => 'اسم الوثيقة';

  @override
  String get documentNameHint => 'ادخل اسم الوثيقة';

  @override
  String get uploadDocumentLabel => 'رفع الوثيقة';

  @override
  String get selectChildLabel => 'اختر الطفل';

  @override
  String get selectTherapistLabel => 'اختر المعالج';

  @override
  String get selectTherapistHint => 'اختر المعالج';

  @override
  String get appointmentTypeLabel => 'نوع الموعد';

  @override
  String get appointmentTypeHint => 'اختر نوع الموعد';

  @override
  String get selectDateLabel => 'تحديد التاريخ';

  @override
  String get selectTimeLabel => 'تحديد الوقت';

  @override
  String get scheduleScreenTitle => 'جدول المواعيد';

  @override
  String get assignFamily => 'تعيين عائلة';

  @override
  String get selectFamilyHint => 'اختر عائلة الطفل';

  @override
  String get newPasswordLabel => 'كلمة المرور الجديدة';

  @override
  String get newPasswordHint => 'ادخل كلمة المرور الجديدة';

  @override
  String get confirmPasswordLabel => 'تأكيد كلمة المرور الجديدة';

  @override
  String get confirmPasswordHint => 'ادخل كلمة المرور الجديدة';

  @override
  String get passwordsMustMatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get genderSelectHint => 'اختر جنس الطفل';

  @override
  String get childNameLabel => 'اسم الطفل';

  @override
  String get childNameHint => 'ادخل اسم الطفل';

  @override
  String get saveSuccess => 'تم الحفظ بنجاح';

  @override
  String get scheduleDateSubtitle => 'إدارة الجلسات العلاجية اليومية';

  @override
  String get fieldRequired => 'هذا الحقل مطلوب';

  @override
  String get male => 'ذكر';

  @override
  String get female => 'أنثى';

  @override
  String get searchHint => 'بحث...';

  @override
  String get selectGenderLabel => 'الجنس';

  @override
  String get appointmentTypeSession => 'جلسة علاجية';

  @override
  String get appointmentTypeAssessment => 'تقييم';

  @override
  String get appointmentTypeFollowUp => 'متابعة';

  @override
  String get selectChildHint => 'اختر الطفل';

  @override
  String get cameraButton => 'كاميرا';

  @override
  String get galleryButton => 'المعرض';

  @override
  String get pickPdfFile => 'ملف PDF';

  @override
  String get statusPostponed => 'مؤجل';

  @override
  String get appointmentDetails => 'تفاصيل الموعد';

  @override
  String get changeStatus => 'تغيير الحالة';

  @override
  String get notesOptionalHint => 'ملاحظات (اختياري)...';

  @override
  String get addAppointment => 'إضافة موعد';
}
