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

  @override
  String get csFormIntroTitle => 'قبل البدء';

  @override
  String get csFormIntroBody =>
      'حتى نقيم طفلك بشكل دقيق. و نقدم ما يمكن أفضل ما يمكن، نحتاج منك تعبئة نموذج دراسة الحالة بشكل الزامي.';

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
  String get csSection2Title => 'معلومات الأسرة';

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
  String get csSection3Title => 'بيانات الأسرة الاجتماعية والاقتصادية';

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
  String get csMarried => 'متزوجين';

  @override
  String get csDivorced => 'مطلقين';

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
  String get csSection6Title => 'المعلومات الطبية وتاريخ الولادة';

  @override
  String get csSection6Subtitle => 'فترة بعد الولادة';

  @override
  String get csS6BreastfeedingType =>
      'هل الرضاعة كانت طبيعية ام صناعية ام الاثنين معا';

  @override
  String get csS6BreastfeedingNatural => 'طبيعية';

  @override
  String get csS6BreastfeedingArtificial => 'صناعية';

  @override
  String get csS6BreastfeedingBoth => 'الاثنين معا';

  @override
  String get csS6Diseases => 'هل اصيب الطفل بأحد الامراض التالية';

  @override
  String get csS6Meningitis => 'التهاب السحايا';

  @override
  String get csS6Measles => 'الحصبة';

  @override
  String get csS6Chickenpox => 'الجدري';

  @override
  String get csS6Mumps => 'النكاف';

  @override
  String get csS6TookLongTermMedication =>
      'هل تعاطى الطفل اية ادوية او علاجات لفترة زمنية طويلة';

  @override
  String get csS6MedicationType => 'ما هو نوع الادوية';

  @override
  String get csS6MedicationTypeHint => 'ادخل نوع الادوية';

  @override
  String get csS6HadFallsOrAccidents => 'هل اصيب الطفل بحالات سقوط او حوادث';

  @override
  String get csS6HadHipDislocationExam => 'هل اجري له فحص خلع الولادة';

  @override
  String get csS6HasChronicDiseases => 'هل يعاني الطفل من امراض مزمنة';

  @override
  String get csS6ChronicDiseaseType =>
      'ما نوع المرض المزمن الذي يعاني منه الطفل';

  @override
  String get csS6ChronicDiseaseHint => 'ادخل نوع الفرض';

  @override
  String get csS6AteWell => 'هل كان ياكل جيدا';

  @override
  String get csS6HospitalizedBefore => 'هل دخل المستشفى في حياته';

  @override
  String get csS6SurgicalOperations => 'ما هي العمليات الجراحية التي اجريت له';

  @override
  String get csS6SurgicalOperationsHint => 'ادخل نوع العملية';

  @override
  String get csSection7Title => 'المشاكل السلوكية';

  @override
  String get csS7BehaviorsQuestion =>
      'هل لوحظ على الطفل في أثناء طفولته الاولى أي من التصرفات التالية؟';

  @override
  String get csS7ThumbSucking => 'مص الاصبع';

  @override
  String get csS7NailBiting => 'قضم الاظافر';

  @override
  String get csS7Bedwetting => 'تبليل الفراش';

  @override
  String get csS7FoodAversion => 'العزوف عن الطعام';

  @override
  String get csS7SleepDisorder => 'إضطراب النوم';

  @override
  String get csS7ContinuousCrying => 'بكاء متواصل';

  @override
  String get csS7Daydreaming => 'شرود الذهن و أحلام اليقظة';

  @override
  String get csS7AngerAttacks => 'نوبات الغضب';

  @override
  String get csS7Aggression => 'العدوانية: الضرب/العضب/السب';

  @override
  String get csS7DestroyingObjects => 'تخريب الأشياء';

  @override
  String get csS7EpilepticSeizures => 'نوبات الصرع';

  @override
  String get csS7SpeechDifficulties => 'صعوبات في النطق و الكلام';

  @override
  String get csS7VaccinesQuestion => 'هل أخذ الطفل اللقاحات التالية؟';

  @override
  String get csS7VaccineTriple => 'الثلاثي + الرباعي + الخماسي';

  @override
  String get csS7VaccinePolio => 'شلل الأطفال';

  @override
  String get csS7VaccineTuberculosis => 'السل';

  @override
  String get csS7VaccineMeasles => 'الحصبة';

  @override
  String get csS7VaccineGermanMeaslesMumps => 'الحصبة الالمانية + النكاف';

  @override
  String get csS7VaccineHepatitisB => 'إلتهاب الكبد (ب)';

  @override
  String get csSection8Title => 'التطور النمائي';

  @override
  String get csSection8Subtitle => 'الجوانب الحركية و الجسمية';

  @override
  String get csS8SatAtRightTime => 'هل جلس الطفل في الوقت المناسب';

  @override
  String get csS8CrawledAtRightTime => 'هل حبى في الوقت المناسب';

  @override
  String get csS8WalkedAtRightTime => 'هل مشى في الوقت المناسب';

  @override
  String get csS8TeethingAge => 'كم كان عمر الطفل عندما بدأت أسنانه بالظهور';

  @override
  String get csS8TeethingAgeHint => 'ادخل عمر الطفل';

  @override
  String get csS8DropsThings => 'هل يتعثر الطفل بالأشياء او يسقط الأشياء';

  @override
  String get csS8HasMovementDifficulties =>
      'هل لدى الطفل صعوبة في الجري أو القفز او الحجل أو الوثب أو صعوبة في صعود الدرج لوحده';

  @override
  String get csS8IsConstantlyMoving => 'هل الطفل دائم الحركة، و حركته متواصلة';

  @override
  String get csS8HasVisualImpairment => 'هل يعاني الطفل من ضعف بصري';

  @override
  String get csS8VisualImpairmentDegree => 'كم درجة ضعف البصر عنده';

  @override
  String get csS8VisualImpairmentHint => 'ادخل درجة الضعف';

  @override
  String get csS8HasEyeDiseases => 'هل الطفل يعاني من امراض العين';

  @override
  String get csS8EyeDiseasesType => 'ما هي الأمراض العين التي يعاني منها';

  @override
  String get csS8EyeDiseasesHint => 'ادخل الأمراض';

  @override
  String get csS8HasHearingImpairment => 'هل يعاني الطفل من ضعف السمع لديه';

  @override
  String get csS8HearingImpairmentDegree => 'كم درجة ضعف السمع لديه';

  @override
  String get csS8HearingImpairmentHint => 'ادخل درجة الضعف';

  @override
  String get csS8HasEarDiseases => 'هل الطفل يعاني من امراض في الأذن';

  @override
  String get csS8EarDiseasesType => 'ما هي الأمراض الأذن التي يعاني منها';

  @override
  String get csS8EarDiseasesHint => 'ادخل الأمراض';

  @override
  String get csS8HasAllergies => 'هل يعاني الطفل من الحساسية';

  @override
  String get csS8AllergyType => 'ما نوع الحساسية';

  @override
  String get csS8AllergyFood => 'حساسية غذائية';

  @override
  String get csS8AllergyEnvironmental => 'حساسية بيئية';

  @override
  String get csS8AllergyTriggers => 'ما هي الأشياء التي تحسسن الطفل منها';

  @override
  String get csS8AllergyTriggersHint => 'ادخل الأشياء';

  @override
  String get csSection9Title => 'التطور النمائي';

  @override
  String get csSection9Subtitle => 'الجوانب اللغوية';

  @override
  String get csS9SpeechUnderstoodByMother =>
      'هل كانت لغته مفهومة عندما يتكلم مع الأم؟';

  @override
  String get csS9HasStuttering => 'هل لدى الطفل تأتأة في الكلام؟';

  @override
  String get csS9HasLetterSubstitution => 'هل الطفل يلدغ في بعض الحروف؟';

  @override
  String get csS9SubstitutedLetters => 'ما هي تلك الحروف التي يلدغ بها؟';

  @override
  String get csS9SubstitutedLettersHint => 'ادخل الحروف التي يلدغ بها الطفل';

  @override
  String get csS9SpeaksUnintelligibly =>
      'هل يتحدث الطفل أحياناً بكلام غير مفهوم؟';

  @override
  String get csS9HasPronunciationDifficulty =>
      'هل لدى الطفل صعوبة في النطق بعض الحروف و الكلمات؟';

  @override
  String get csS9DifficultLettersAndWords =>
      'ما هي الحروف و الكلمات التي يواجه فيها الطفل صعوبة في نطقها؟';

  @override
  String get csS9DifficultLettersHint => 'ادخل الحروف و الكلمات';

  @override
  String get csS9LanguageLikeAgePeers => 'هل لغة الطفل مثل لغة من هم في عمره؟';

  @override
  String get csSection10Title => 'التطور النمائي';

  @override
  String get csSection10Subtitle => 'الجوانب المعرفية';

  @override
  String get csS10FollowsInstructions =>
      'هل الطفل يتبع التعليمات عند تكليفه بمهمة ما؟';

  @override
  String get csS10CompletesAssignedTasks =>
      'هل ينجز الطفل المهمة التي تطلب منه؟';

  @override
  String get csS10UnderstandsInstructions =>
      'هل يفهم الطفل ما يقال له أو يطلب منه؟';

  @override
  String get csS10UnderstandsAlways => 'دائماً';

  @override
  String get csS10UnderstandsSometimes => 'أحياناً';

  @override
  String get csS10UnderstandsRarely => 'نادراً';

  @override
  String get csS10HasMemoryDifficulty =>
      'هل لدى الطفل صعوبة في تذكر الأشياء والمعلومات و ما يقال له؟';

  @override
  String get csS10HasNamingDifficulty =>
      'هل لدى الطفل صعوبة في تسمية الأشياء المألوفة؟';

  @override
  String get csS10IsImpulsive => 'هل الطفل مندفع (يتصرف دون تفكير بالنتيجة)؟';

  @override
  String get csS10ConcentrationLevel => 'ما هي قدرته على التركيز و الانتباه؟';

  @override
  String get csS10ConcentrationGood => 'جيدة';

  @override
  String get csS10ConcentrationAverage => 'عادية';

  @override
  String get csS10ConcentrationWeak => 'ضعيفة';

  @override
  String get csSection11Title => 'التطور النمائي';

  @override
  String get csSection11Subtitle => 'الجوانب الإجتماعية';

  @override
  String get csS11IsQuickToAnger => 'هل الطفل سريع الغضب و الانفعال؟';

  @override
  String get csS11DestroysPlaythings => 'هل يخرب الألعاب و الأدوات و الأشياء؟';

  @override
  String get csS11IsStubborn => 'هل هو عنيد و غير متعاون؟';

  @override
  String get csS11IsAggressive => 'هل الطفل عدواني الطباع مع الآخرين؟';

  @override
  String get csS11CanPlayCalmly => 'هل الطفل قادر على اللعب بهدوء؟';

  @override
  String get csS11AttacksSiblings => 'هل الطفل يعتدي على أخوانه و إخوانه؟';

  @override
  String get csS11IsPopularWithPeers =>
      'هل الطفل محبوب من زملائه و أبناء جيرانه؟';

  @override
  String get csS11BehaviorDuringVisits =>
      'كيف تصرفاته و سلوكه عند زيارته للآخرين؟';

  @override
  String get csS11BehaviorDuringVisitsHint => 'ادخل تصرفات الطفل';

  @override
  String get csS11SocialMaturityLikeAgePeers =>
      'هل مستوى نضجه الإجتماعي في مستوى أقرانه في العمر؟';

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
  String get csSection13Title => 'التطور النمائي';

  @override
  String get csSection13Subtitle => 'الجوانب العناية بالذات';

  @override
  String get csS13UsesToiletProperly => 'هل يستخدم التواليت بشكل مناسب؟';

  @override
  String get csS13BathesAlone => 'هل يستحم لوحده؟';

  @override
  String get csS13DressesAlone => 'هل يلبس ملابسه لوحده؟';

  @override
  String get csS13UsesToothbrush => 'هل يستخدم فرشاة الأسنان في تنظيف أسنانه؟';

  @override
  String get csS13WearsShoesAlone => 'هل يلبس حذائه و يربطه وحده؟';

  @override
  String get csS13WashesFaceOnWaking => 'هل يغسل وجهه عند الاستيقاظ من نومه؟';

  @override
  String get csS13WashesHandsBeforeAfterEating =>
      'هل يغسل يديه قبل الأكل و بعده؟';

  @override
  String get csS13WashesFeetAfterPlay =>
      'هل يغسل قدميه بعد العودة من المركز او اللعب؟';
}
