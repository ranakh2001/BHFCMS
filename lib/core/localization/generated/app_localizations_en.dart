// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'BHCFMS';

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get welcomeMessage => 'Welcome back!';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get centerName => 'Bright Horizon Center';

  @override
  String get splashSubtitle => 'Premium care, smart insights';

  @override
  String get loginTitle => 'Login';

  @override
  String get welcomeSubtitle => 'Welcome';

  @override
  String get loginStepByStep =>
      'Together to monitor and develop cases step by step';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'Enter email address';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHint => 'Enter password';

  @override
  String get loginButton => 'Login';

  @override
  String get adminAccountNote =>
      'Accounts are created by center administration only';

  @override
  String get validationRequired => 'This field is required';

  @override
  String get validationEmail => 'Please enter a valid email address';

  @override
  String get validationPasswordLength =>
      'Password must be at least 6 characters';

  @override
  String welcomeBack(String name) {
    return 'Welcome back $name';
  }

  @override
  String get todayTasks =>
      'Here are your most important tasks and recommendations for today...';

  @override
  String get parentsWelocome =>
      'Follow your child\'s sessions, tasks, and latest updates…';

  @override
  String get viewAll => 'View All';

  @override
  String get upcomingSessions => 'Upcoming Sessions';

  @override
  String get todayGoals => 'Today\'s Goals';

  @override
  String get speechSession => 'Speech Session';

  @override
  String room(String number) {
    return 'Room $number';
  }

  @override
  String get statusCompleted => 'Completed';

  @override
  String get statusInProgress => 'In Progress';

  @override
  String get notifications => 'Notifications';

  @override
  String get noNotificationsYet => 'No notifications yet';

  @override
  String get notificationNewSession => 'New session assigned';

  @override
  String get notificationGoalUpdated => 'Goal updated';

  @override
  String get notificationReminder => 'Session reminder';

  @override
  String get childDetails => 'Child Details';

  @override
  String get sessionInfo => 'Session Information';

  @override
  String get goals => 'Goals';

  @override
  String get beneficiaries => 'Beneficiaries';

  @override
  String get searchBeneficiary => 'Search for a beneficiary...';

  @override
  String get filterActive => 'Active';

  @override
  String get filterCompleted => 'Completed';

  @override
  String get progressAchieved => 'Progress Achieved';

  @override
  String get viewDetails => 'View Details';

  @override
  String get speechImprovement => 'Speech Improvement';

  @override
  String get schedule => 'Schedule';

  @override
  String get scheduleTitle => 'Schedule';

  @override
  String get upcomingSessionLegend => 'Upcoming Session';

  @override
  String get completedSessionLegend => 'Completed Session';

  @override
  String get holidayLegend => 'Holiday';

  @override
  String get noSessionsOnDay => 'No sessions on this day';

  @override
  String get sessionTime => 'Session Time';

  @override
  String get child => 'Child';

  @override
  String get therapist => 'Therapist';

  @override
  String get messages => 'Messages';

  @override
  String get searchGuardian => 'Search for a guardian...';

  @override
  String get typeMessage => 'Type a message...';

  @override
  String get noConversations => 'No conversations yet';

  @override
  String get noMessages => 'No messages yet';

  @override
  String guardianOf(String name) {
    return 'Parent of $name';
  }

  @override
  String get messageSent => 'Sent';

  @override
  String get messageDelivered => 'Delivered';

  @override
  String get messageRead => 'Read';

  @override
  String get profileTitle => 'Profile';

  @override
  String get generalSettings => 'General Settings';

  @override
  String get logout => 'Logout';

  @override
  String get arabic => 'Arabic';

  @override
  String get english => 'English';

  @override
  String get notificationsLabel => 'Notifications';

  @override
  String get speechTherapist => 'Speech & Language Therapist';

  @override
  String get logoutConfirmTitle => 'Logout';

  @override
  String get logoutConfirmMessage => 'Are you sure you want to logout?';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get childFile => 'Child File';

  @override
  String get sessionTab => 'Session';

  @override
  String get sessionGoalsTab => 'Session Goals';

  @override
  String get treatmentPlanTab => 'Treatment Plan';

  @override
  String get overviewTab => 'Overview';

  @override
  String get activeStatus => 'Active';

  @override
  String get uploadSessionVideo => 'Upload session video';

  @override
  String get uploadSessionAudio => 'Upload session audio';

  @override
  String get assessmentsSection => 'Assessments';

  @override
  String get visualCommunicationTest => 'Visual Communication Test';

  @override
  String get behavioralSkillsTest => 'Behavioral Skills Test';

  @override
  String get commandResponseTest => 'Command Response Test';

  @override
  String get addParentTask => 'Add task to parent';

  @override
  String get startButton => 'Start';

  @override
  String get assessmentTitle => 'Assessment';

  @override
  String get finishAssessment => 'Finish Assessment';

  @override
  String get doesChildLookQuestion =>
      'Does the child look when called by name?';

  @override
  String get ratingWeak => 'Weak';

  @override
  String get ratingGood => 'Good';

  @override
  String get ratingMedium => 'Average';

  @override
  String get ratingExcellent => 'Excellent';

  @override
  String get chooseMainGoal => 'Choose main session goal';

  @override
  String get sessionNotesTitle => 'Session Notes';

  @override
  String get childSessionRating => 'Child rating during session';

  @override
  String get childInteractionLevel => 'Child interaction level';

  @override
  String get childInteractionHint => 'Child interaction';

  @override
  String get goalAchievementLabel => 'Goal Achievement';

  @override
  String get notAchieved => 'Not Achieved';

  @override
  String get partialAchievement => 'Partial';

  @override
  String get goalAchieved => 'Goal Achieved';

  @override
  String get performanceTypeLabel => 'Performance Type';

  @override
  String get performanceTypeHint => 'Performance type';

  @override
  String get notesLabel => 'Notes';

  @override
  String get saveButton => 'Save';

  @override
  String get smartSuggestions => 'Smart Suggestions';

  @override
  String get getNewGoals => 'Get new goals based on child\'s condition';

  @override
  String get suggestGoals => 'Suggest Goals';

  @override
  String get endSession => 'End Session';

  @override
  String get currentTreatmentPlan => 'Current Treatment Plan';

  @override
  String get planDuration => 'Duration';

  @override
  String get startedIn => 'Started on';

  @override
  String get statusNotStarted => 'Not Started';

  @override
  String get progressTitle => 'Progress';

  @override
  String get notableImprovement => 'Notable improvement in recent sessions';

  @override
  String get remainingGoals => 'Remaining Goals';

  @override
  String get achievedGoals => 'Achieved Goals';

  @override
  String get aiSuggestionsTitle => 'AI Suggestions';

  @override
  String get personalProfile => 'Personal Profile';

  @override
  String get goalsSummary => 'Goals Summary';

  @override
  String get achievedCount => 'Achieved';

  @override
  String get remainingCount => 'Remaining';

  @override
  String get aiSuggestedGoals => 'AI Suggested Goals';

  @override
  String get highPriority => 'High Priority';

  @override
  String get mediumPriority => 'Medium Priority';

  @override
  String get continuousDevelopment => 'Continuous Development';

  @override
  String get addToPlan => 'Add to Plan';

  @override
  String get updateSuggestions => 'Update Suggestions';

  @override
  String get saveToTreatmentPlan => 'Save to Treatment Plan';

  @override
  String get viewPlan => 'View Plan';

  @override
  String get sessionNotesRecord => 'Record Session Notes';

  @override
  String get csFormIntroTitle => 'Before You Start';

  @override
  String get csFormIntroBody =>
      'To document the child\'s case study accurately and comprehensively, please fill out all sections of the form carefully. You can fill out this form more than once.';

  @override
  String csFormIntroNote(int count) {
    return 'The form consists of $count sections. Please fill out all sections carefully.';
  }

  @override
  String get csFormStartButton => 'Start Now';

  @override
  String get csFormContinueButton => 'Continue';

  @override
  String get csFormNext => 'Next';

  @override
  String get csFormFinish => 'Finish';

  @override
  String csFormResumeNote(int section) {
    return 'Progress will resume from section $section';
  }

  @override
  String get csSection1Title => 'Child Personal Information';

  @override
  String get csChildName => 'Child Name';

  @override
  String get csChildNameHint => 'Enter child\'s name';

  @override
  String get csPlaceOfBirth => 'Place of Birth';

  @override
  String get csPlaceOfBirthHint => 'Enter place of birth';

  @override
  String get csDateOfBirth => 'Date of Birth';

  @override
  String get csGrade => 'Grade';

  @override
  String get csGradeHint => 'Enter child\'s grade';

  @override
  String get csChildAge => 'Child\'s Age';

  @override
  String get csChildAgeHint => 'Enter child\'s age';

  @override
  String get csGender => 'Gender';

  @override
  String get csGenderHint => 'Select gender';

  @override
  String get csGenderMale => 'Male';

  @override
  String get csGenderFemale => 'Female';

  @override
  String get csNationality => 'Nationality';

  @override
  String get csNationalityHint => 'Enter nationality';

  @override
  String get csFamilyRank => 'Child\'s Rank in Family';

  @override
  String get csFamilyRankHint => 'Enter child\'s rank in family';

  @override
  String get csCenterJoinDate => 'Date of Joining the Center';

  @override
  String get csChildInfoDisplaySection => 'Child\'s Data';

  @override
  String get csReferenceNumber => 'Reference File Number';

  @override
  String get csPrimaryLanguage => 'Primary Language';

  @override
  String get csFullAddress => 'Full Address';

  @override
  String get csCaregiverName => 'Primary Caregiver Name';

  @override
  String get csCaregiverRelationship => 'Relationship';

  @override
  String get csPhoneNumber => 'Mobile Number';

  @override
  String get csEmailAddress => 'Email';

  @override
  String get csReferralInfoSection => 'Referral Information';

  @override
  String get csReferralSource => 'Referral Source';

  @override
  String get csReferralSelf => 'Self';

  @override
  String get csReferralDoctor => 'Doctor';

  @override
  String get csReferralSchool => 'School';

  @override
  String get csReferralOtherCenter => 'Another Center';

  @override
  String get csReferralOther => 'Other';

  @override
  String get csReferralOtherNote => '(If other is selected)';

  @override
  String get csReferralOtherHint => 'Enter referral source';

  @override
  String get csMainServiceReason => 'Main Reason for Service Request';

  @override
  String get csMainServiceReasonHint => 'Enter main reason for service request';

  @override
  String get csChangeLanguage => 'Change Language';

  @override
  String get csSection2Title => 'Family and Guardianship Information';

  @override
  String get csFatherName => 'Father\'s Name';

  @override
  String get csFatherNameHint => 'Enter father\'s name';

  @override
  String get csFatherEducation => 'Educational Level';

  @override
  String get csFatherEducationHint => 'Enter father\'s educational level';

  @override
  String get csMotherName => 'Mother\'s Name';

  @override
  String get csMotherNameHint => 'Enter mother\'s name';

  @override
  String get csMotherEducation => 'Educational Level';

  @override
  String get csMotherEducationHint => 'Enter mother\'s educational level';

  @override
  String get csParentsKinship =>
      'Is there a kinship between the father and mother?';

  @override
  String get csKinshipType => 'What is the specific type of kinship?';

  @override
  String get csKinshipTypeHint => 'Enter type of kinship';

  @override
  String get csKinshipNote => '(In case of kinship between parents)';

  @override
  String get csChildResidenceTitle => 'Child\'s Residence and Time Percentage';

  @override
  String get csChildResidenceNote => '(If parents are not married)';

  @override
  String get csFirstHome => 'First Home';

  @override
  String get csFirstHomeHint => 'Add home description and time percentage';

  @override
  String get csFirstHomeOwner => 'Parent/Guardian Name (First Home Owner)';

  @override
  String get csFirstHomeOwnerHint => 'Enter first home owner\'s name';

  @override
  String get csSecondHome => 'Second Home';

  @override
  String get csSecondHomeHint => 'Add home description and time percentage';

  @override
  String get csSecondHomeOwner => 'Parent/Guardian Name (Second Home Owner)';

  @override
  String get csSecondHomeOwnerHint => 'Enter second home owner\'s name';

  @override
  String get csMotherOccupation => 'Mother\'s Occupation';

  @override
  String get csMotherOccupationHint => 'Enter mother\'s occupation';

  @override
  String get csFatherOccupation => 'Father\'s Occupation';

  @override
  String get csFatherOccupationHint => 'Enter father\'s occupation';

  @override
  String get csDecisionMaker =>
      'Who is Responsible for Medical, Educational and Personal Decisions for the Child';

  @override
  String get csDecisionBoth => 'Both';

  @override
  String get csDecisionLegalGuardian => 'Legal Guardian';

  @override
  String get csSeparationDecision => 'In Case of Separation';

  @override
  String get csSeparationDecisionHint =>
      'Mention who is responsible for the child\'s decisions';

  @override
  String get csBothParentsAware =>
      'Are Both Parents Aware of the Services Required at the Center';

  @override
  String get csFamilyMembersTitle => 'Family Members and Residents';

  @override
  String get csAddPerson => 'Add Person';

  @override
  String get csMemberName => 'Name';

  @override
  String get csMemberNameHint => 'Enter name';

  @override
  String get csMemberAge => 'Age';

  @override
  String get csMemberAgeHint => 'Enter age';

  @override
  String get csMemberRelationship => 'Relationship';

  @override
  String get csMemberRelationshipHint => 'Enter relationship';

  @override
  String get csMemberResidence => 'Place of Residence';

  @override
  String get csResidenceHome1 => 'First Home';

  @override
  String get csResidenceHome2 => 'Second Home';

  @override
  String get csResidenceDoesNotLive => 'Does Not Reside';

  @override
  String get csFamilyHealthHistoryTitle =>
      'Family Health and Psychological History';

  @override
  String get csFamilyConditionFather => 'Father';

  @override
  String get csFamilyConditionMother => 'Mother';

  @override
  String get csFamilyConditionPaternalRel => 'Paternal Relatives';

  @override
  String get csFamilyConditionOtherRel => 'Other Relatives';

  @override
  String get csFamilyConditionNone => 'None';

  @override
  String get csFamilyConditionRelation => 'Relationship';

  @override
  String get csFamilyConditionRelationHint => 'Enter relationship';

  @override
  String get csAutismSpectrum => 'Autism Spectrum';

  @override
  String get csLanguageDelay => 'Language Delay';

  @override
  String get csLearningDifficulty => 'Learning Difficulty';

  @override
  String get csADHD => 'Hyperactivity and Attention Deficit (ADHD)';

  @override
  String get csMoodDisorders => 'Mood Disorders (Depression, Anxiety)';

  @override
  String get csSection3Title => 'Pregnancy and Birth Information';

  @override
  String get csPregnancyBirthSubsection => 'Pregnancy and Birth';

  @override
  String get csLiveBirthCount => 'Number of Pregnancies (Live Births)';

  @override
  String get csLiveBirthCountHint => 'Enter number of pregnancies';

  @override
  String get csStillbirthCount => 'Number of Pregnancies (Deaths)';

  @override
  String get csStillbirthCountHint => 'Enter number of pregnancies';

  @override
  String get csMotherAgeAtBirth => 'Mother\'s Age at Child\'s Birth';

  @override
  String get csMotherAgeAtBirthHint => 'Enter mother\'s age';

  @override
  String get csFatherAgeAtBirth => 'Father\'s Age at Child\'s Birth';

  @override
  String get csFatherAgeAtBirthHint => 'Enter father\'s age';

  @override
  String get csParentKinship => 'Degree of Kinship Between Parents';

  @override
  String get csKinshipFirst => 'First Degree';

  @override
  String get csKinshipSecond => 'Second Degree';

  @override
  String get csKinshipNone => 'None';

  @override
  String get csWasPregnancyPlanned => 'Was the Pregnancy Planned';

  @override
  String get csUsedFertilityTreatment => 'Were Fertility Treatments Used';

  @override
  String get csMedicationsTitle =>
      'Use of Medications/Supplements During Pregnancy';

  @override
  String get csMedVitamins => 'Vitamins';

  @override
  String get csMedSupplements => 'Supplements';

  @override
  String get csMedAntidepressants => 'Antidepressants';

  @override
  String get csMedAntiSeizure => 'Anti-Seizure';

  @override
  String get csMedOther => 'Other';

  @override
  String get csMedUnsure => 'Unsure';

  @override
  String get csMedicationsOtherNote => '(If other is selected)';

  @override
  String get csMedicationsOtherHint => 'Enter medication types';

  @override
  String get csPregnancyDifficultiesSection => 'Difficulties During Pregnancy';

  @override
  String get csFeverInfection => 'Fever/Infection';

  @override
  String get csBleedingMiscarriage => 'Bleeding/Threatened Miscarriage';

  @override
  String get csHighBpDiabetes => 'High Blood Pressure/Gestational Diabetes';

  @override
  String get csSevereStressAccidents => 'Severe Stress/Accidents';

  @override
  String get csTriUnsure => 'Unsure';

  @override
  String get csLaborDeliverySection => 'Labor and Delivery';

  @override
  String get csUsedPitocin => 'Use of Stimulants (Pitocin)';

  @override
  String get csPrematureBirth => 'Premature Birth';

  @override
  String get csPrematureWeeks => 'Number of Weeks';

  @override
  String get csPrematureWeeksHint => 'Enter weeks';

  @override
  String get csDeliveryComplications =>
      'Complications (Breech, Cord Wrapped, Umbilical)';

  @override
  String get csDeliveryComplicationsType => 'Type of Complications';

  @override
  String get csDeliveryComplicationsHint => 'Enter complications type';

  @override
  String get csNICU => 'NICU/Resuscitation';

  @override
  String get csNICUReason => 'What is the Reason';

  @override
  String get csNICUReasonHint => 'Enter NICU admission reason';

  @override
  String get csNICUDuration => 'Duration';

  @override
  String get csNICUDurationHint => 'Duration of child\'s hospital stay';

  @override
  String get csDeliveryType => 'Type of Delivery';

  @override
  String get csDeliveryNatural => 'Natural';

  @override
  String get csDeliveryCesarean => 'Cesarean';

  @override
  String get csCesareanReason => 'What is the Reason';

  @override
  String get csCesareanReasonHint => 'Reason for cesarean delivery';

  @override
  String get csFirstMonthProblems => 'Problems in the First Month After Birth';

  @override
  String get csFirstMonthBreastfeeding => 'Breastfeeding Difficulty';

  @override
  String get csFirstMonthSleep => 'Sleep Problems';

  @override
  String get csFirstMonthJaundice => 'Jaundice';

  @override
  String get csFirstMonthCongenital => 'Congenital Defects';

  @override
  String get csFirstMonthFainting => 'Fainting/Loss of Consciousness';

  @override
  String get csFirstMonthCrying => 'Excessive Crying';

  @override
  String get csFirstMonthDigestive => 'Digestive Symptoms';

  @override
  String get csFirstMonthReflux => 'Reflux/Vomiting';

  @override
  String get csIfYes => '(If yes is selected)';

  @override
  String get csHomeLanguage => 'Language Used at Home';

  @override
  String get csHomeLanguageHint => 'Enter language';

  @override
  String get csSchoolLanguage => 'Language Used at School';

  @override
  String get csSchoolLanguageHint => 'Enter language';

  @override
  String get csMaritalStatus => 'Parents\' Marital Status';

  @override
  String get csMarried => 'Married';

  @override
  String get csSeparated => 'Separated';

  @override
  String get csDivorced => 'Divorced';

  @override
  String get csOneParentDeceased => 'One Parent Deceased';

  @override
  String get csChildLivingWith => 'Who Does the Child Live With';

  @override
  String get csLivesWithBoth => 'Both Parents';

  @override
  String get csLivesWithFather => 'Father';

  @override
  String get csLivesWithMother => 'Mother';

  @override
  String get csLivesWithOther => 'Other';

  @override
  String get csChildLivingOtherHint => 'Enter who the child lives with';

  @override
  String get csChildLivingOtherNote => '(In case of other selection)';

  @override
  String get csFamilyRelationship => 'Child\'s Relationship with Family';

  @override
  String get csFamilyRelationshipHint =>
      'What is the child\'s relationship with family';

  @override
  String get csFamilyProvider => 'Who Provides for the Family';

  @override
  String get csFamilyIncome => 'Family Economic Income';

  @override
  String get csIncomeExcellent => 'Excellent';

  @override
  String get csIncomeAverage => 'Average';

  @override
  String get csIncomeWeak => 'Weak';

  @override
  String get csFamilyMembersCount => 'Number of Family Members';

  @override
  String get csFamilyMembersCountHint => 'Enter number of family members';

  @override
  String get csFamilyHealthConditions =>
      'Does any family member suffer from diseases or specific problems (hereditary or non-hereditary)?';

  @override
  String get csAffectedPerson => 'Who is the Person Suffering from the Illness';

  @override
  String get csAffectedPersonHint =>
      'Enter the person\'s relation to the child';

  @override
  String get csDiseaseName => 'What is the Disease';

  @override
  String get csDiseaseNameHint => 'Enter the disease';

  @override
  String get csAddAnotherPerson => 'Add Another Person';

  @override
  String get csOptional => '(optional)';

  @override
  String get csYes => 'Yes';

  @override
  String get csNo => 'No';

  @override
  String get csIfPreviousYes => '(If the previous answer was yes)';

  @override
  String get csIfPreviousNo => '(If the previous answer was no)';

  @override
  String get csFamilyProviderFather => 'Father';

  @override
  String get csFamilyProviderMother => 'Mother';

  @override
  String get csFamilyProviderRelative => 'Relative';

  @override
  String get csSection4Title => 'Medical Information and Birth History';

  @override
  String get csSection4Subtitle => 'Pregnancy Period';

  @override
  String get csS4TookMedication =>
      'Did the mother take medication during pregnancy?';

  @override
  String get csS4MedicationType => 'What type of medication?';

  @override
  String get csS4MedicationTypeHint => 'Enter medication type';

  @override
  String get csS4HadDoctorFollowUp =>
      'Did the mother follow up with a doctor during pregnancy?';

  @override
  String get csS4FollowUpRegular =>
      'Was the follow-up with the doctor regular?';

  @override
  String get csS4ExposedToRadiation =>
      'Was the mother exposed to radiation during pregnancy?';

  @override
  String get csS4HadInjuries =>
      'Was the mother exposed to any injuries, falls, or accidents?';

  @override
  String get csS4InjuriesType => 'Type of injuries, falls, and accidents';

  @override
  String get csS4InjuriesTypeHint => 'Enter type of accidents';

  @override
  String get csS4PsychologicalTrauma =>
      'Was the mother exposed to psychological trauma during pregnancy?';

  @override
  String get csS4PsychologicalTraumaNote =>
      '(e.g. death of a relative or a traumatic accident)';

  @override
  String get csS4NineMonths => 'Was the pregnancy duration nine months?';

  @override
  String get csS4DurationLabel => 'What was the duration of pregnancy?';

  @override
  String get csS4DurationHint => 'Enter number of months';

  @override
  String get csS4DiseasesDuringPregnancy =>
      'Did the mother get any of the following diseases during pregnancy?';

  @override
  String get csS4Diabetes => 'Diabetes';

  @override
  String get csS4BloodPressure => 'Blood Pressure';

  @override
  String get csS4Albuminuria => 'Albuminuria';

  @override
  String get csS4Preeclampsia => 'Preeclampsia';

  @override
  String get csS4Rubella => 'Rubella';

  @override
  String get csS4Bleeding => 'Bleeding';

  @override
  String get csS4InfectiousDiseases =>
      'Did the mother get infectious diseases during pregnancy?';

  @override
  String get csS4InfectiousDiseaseType =>
      'What type of disease did the mother get?';

  @override
  String get csS4ChronicDiseases =>
      'Does the mother suffer from any chronic diseases?';

  @override
  String get csS4ChronicDiseaseType => 'What type of chronic disease?';

  @override
  String get csS4LabTests =>
      'Did the mother undergo laboratory tests during pregnancy?';

  @override
  String get csS4LabTestsType =>
      'What type of lab test and during which pregnancy period?';

  @override
  String get csS4LabTestsHint => 'Enter type of test and pregnancy period';

  @override
  String get csS4StabilizingMedication =>
      'Did the mother take pregnancy-stabilizing medications?';

  @override
  String get csS4TotalPregnancies => 'How many pregnancies has the mother had?';

  @override
  String get csS4TotalPregnanciesHint => 'Enter number of pregnancies';

  @override
  String get csS4HadMiscarriage => 'Has she had a miscarriage before?';

  @override
  String get csS4ExposedToSmoking =>
      'Was the mother exposed to smoking during pregnancy?';

  @override
  String get csS4DiseaseTypeHint => 'Enter type of disease';

  @override
  String get csSection5Title => 'Medical Information and Birth History';

  @override
  String get csSection5Subtitle => 'Birth Period';

  @override
  String get csS5BirthType => 'Was the birth natural or caesarean?';

  @override
  String get csS5BirthTypeNatural => 'Natural';

  @override
  String get csS5BirthTypeCesarean => 'Caesarean';

  @override
  String get csS5BirthPlace => 'Was the birth at home or hospital?';

  @override
  String get csS5BirthPlaceHome => 'Home';

  @override
  String get csS5BirthPlaceHospital => 'Hospital';

  @override
  String get csS5UsedBirthTools =>
      'Were birth tools used (forceps/suction) during delivery?';

  @override
  String get csS5TookDeliveryMedication =>
      'Did the mother take medication or aid for delivery?';

  @override
  String get csS5OxygenDeficiency =>
      'Was the mother exposed to oxygen deficiency for the fetus during delivery?';

  @override
  String get csS5UmbilicalCordWrapped =>
      'Did the umbilical cord wrap around the fetus?';

  @override
  String get csS5BreechPosition => 'Was the fetus in breech position?';

  @override
  String get csS5BreechDurationLabel =>
      'How long did the breech position last?';

  @override
  String get csS5BreechDurationHint => 'Enter duration of breech position';

  @override
  String get csS5HadJaundice =>
      'Was the child infected with jaundice/yellowing?';

  @override
  String get csS5HadCongenitalDeformities =>
      'Did the child suffer from congenital deformities?';

  @override
  String get csS5CongenitalDeformitiesType =>
      'What are these congenital deformities?';

  @override
  String get csS5CongenitalDeformitiesHint => 'Enter type of deformities';

  @override
  String get csS5BirthWeight => 'What was the fetus weight at birth?';

  @override
  String get csS5BirthWeightHint => 'Enter child\'s birth weight';

  @override
  String get csS5HadRhTest => 'Was the RH factor test performed?';

  @override
  String get csSection6Title => 'Communication, Language & Social Interaction';

  @override
  String get csS6CommMethodTitle => 'Child\'s Basic Communication Method';

  @override
  String get csS6CommMethodSingleWords => 'Single words';

  @override
  String get csS6CommMethodShortSentences => 'Short sentences';

  @override
  String get csS6CommMethodFullSentences => 'Complete sentences';

  @override
  String get csS6CommMethodSigns => 'Signs';

  @override
  String get csS6CommMethodPecs => 'Pictures / PECS';

  @override
  String get csS6CommMethodDevice => 'Communication device';

  @override
  String get csS6CommMethodManualPull => 'Manual pulling';

  @override
  String get csS6CommMethodCrying => 'Crying / behaviors';

  @override
  String get csS6CommMethodOther => 'Other';

  @override
  String get csS6CommMethodOtherLabel =>
      'What is the child\'s communication method?';

  @override
  String get csS6CommMethodOtherHint => 'Enter communication method';

  @override
  String get csS6CommMethodOtherNote =>
      '(If the previous question answer is \"Other\")';

  @override
  String get csS6ExprUnderstandTitle => 'Ability to Express and Understand';

  @override
  String get csS6ExpressesNeeds => 'Expressing needs';

  @override
  String get csS6RequestsPreferred => 'Requesting preferred items';

  @override
  String get csS6UnderstandsSimple => 'Understanding simple instructions';

  @override
  String get csS6UnderstandsComplex => 'Understanding complex instructions';

  @override
  String get csS6OptionYes => 'Yes';

  @override
  String get csS6OptionSometimes => 'Sometimes';

  @override
  String get csS6OptionNo => 'No';

  @override
  String get csS6SocialCommTitle => 'Social Communication';

  @override
  String get csS6InitiatesInteraction => 'Initiates interaction';

  @override
  String get csS6RespondsToOthers => 'Responds to others';

  @override
  String get csS6PrefersSoloPlay => 'Prefers solo play';

  @override
  String get csS6ImitatesOthers => 'Imitates others';

  @override
  String get csS6DifficultyPeers => 'Difficulty playing with peers';

  @override
  String get csS6DifficultyTurns => 'Difficulty with turn-taking';

  @override
  String get csS6CommNotes =>
      'Additional notes about communication and social interaction';

  @override
  String get csS6CommNotesHint => 'Enter notes';

  @override
  String get csS6PragmaticTitle => 'Evaluation of Social and Pragmatic Skills';

  @override
  String get csS6InitiatesConversation => 'Starting conversation with others';

  @override
  String get csS6MaintainsEyeContact => 'Maintaining eye contact';

  @override
  String get csS6UnderstandsBodyLanguage =>
      'Understanding body language and facial expressions';

  @override
  String get csS6UnderstandsJokes => 'Understanding jokes or figurative speech';

  @override
  String get csS6ConversationTurnTaking => 'Turn-taking in conversation';

  @override
  String get csS6OptionAlways => 'Always';

  @override
  String get csS6OptionRarely => 'Rarely';

  @override
  String get csS6OptionGood => 'Good';

  @override
  String get csS6OptionAcceptable => 'Acceptable';

  @override
  String get csS6OptionWeak => 'Weak';

  @override
  String get csS6OptionPartial => 'Partially';

  @override
  String get csS6OptionMastered => 'Mastered';

  @override
  String get csS6OptionInTraining => 'In training';

  @override
  String get csS6OptionMissing => 'Missing';

  @override
  String get csSection7Title => 'Daily Life Skills and Independence';

  @override
  String get csS7EatingTitle => 'Eating and Drinking';

  @override
  String get csS7UsesSpoonFork => 'Uses spoon/fork';

  @override
  String get csS7SelectiveEater => 'Selective in food';

  @override
  String get csS7UsesHandsForEating => 'Uses hands for eating';

  @override
  String get csS7RefusesTextures => 'Refuses certain textures';

  @override
  String get csS7DrinksFromCup => 'Drinks from cup/straw';

  @override
  String get csS7NeedsFullAssistance => 'Needs full assistance';

  @override
  String get csS7HowRequestsFoodLabel => 'How does the child request food?';

  @override
  String get csS7HowRequestsFoodHint =>
      'Describe how the child requests food...';

  @override
  String get csS7DressingTitle => 'Dressing';

  @override
  String get csS7RemovesShoesSocks => 'Removes shoes/socks';

  @override
  String get csS7ClosesZipperButtons => 'Closes zippers/buttons';

  @override
  String get csS7DressesWithAssistance => 'Dresses with assistance';

  @override
  String get csS7HygieneTitle => 'Personal Hygiene';

  @override
  String get csS7WashesHandsFace => 'Washes hands/face';

  @override
  String get csS7BathesAlone => 'Bathes alone';

  @override
  String get csS7CleansTeetHair => 'Cleans teeth/hair';

  @override
  String get csS7NailCuttingDifficulty => 'Nail cutting (difficult)';

  @override
  String get csS7BathroomSleepTitle => 'Bathroom and Sleep';

  @override
  String get csS7BathroomIndependenceLabel => 'Bathroom independence';

  @override
  String get csS7OptionFullyIndependent => 'Fully independent';

  @override
  String get csS7OptionCurrentlyTraining => 'Currently training';

  @override
  String get csS7OptionUsesDiapers => 'Uses diapers';

  @override
  String get csS7HowRequestsSleepLabel => 'How does the child request sleep?';

  @override
  String get csS7HowRequestsSleepHint =>
      'Describe how the child requests sleep...';

  @override
  String get csSection8Title => 'Sensory and Behavioral Profile';

  @override
  String get csS8ProblemBehaviorsTitle => 'Problem Behaviors (Concerning)';

  @override
  String get csS8BehaviorDescHint => 'Describe behaviors and frequency...';

  @override
  String get csS8Aggression => 'Aggression toward others';

  @override
  String get csS8SelfHarm => 'Self-harm';

  @override
  String get csS8StereotypicalBehaviors =>
      'Stereotypical behaviors (flapping / spinning)';

  @override
  String get csS8ResistanceToChange => 'Resistance to change / transition';

  @override
  String get csS8ExcessiveAttachment =>
      'Excessive attachment to specific objects';

  @override
  String get csS8BehavioralPatternsTitle =>
      'Useful and Repetitive Behavioral Patterns';

  @override
  String get csS8PatternLabel => 'Pattern';

  @override
  String get csS8PatternHint => 'Describe the pattern...';

  @override
  String get csS8PracticesLabel => 'Practices';

  @override
  String get csS8PracticesHint => 'Describe the practices...';

  @override
  String get csS8ExpectedFunctionLabel => 'Expected function';

  @override
  String get csS8ExpectedFunctionHint => 'Describe the expected function...';

  @override
  String get csS8AddPattern => 'Add another pattern';

  @override
  String get csS8SensoryTitle => 'Sensory Integration and Organization';

  @override
  String get csS8GeneralStateLabel =>
      'General description (general state of attention activity)';

  @override
  String get csS8StateCalm => 'Calm';

  @override
  String get csS8StateDistracted => 'Distracted';

  @override
  String get csS8StateVeryActive => 'Very active';

  @override
  String get csS8StateFastTransition => 'Fast transition';

  @override
  String get csS8StateAbnormal => 'Abnormal';

  @override
  String get csS8GeneralStateNotesHint => 'Describe the general state...';

  @override
  String get csS8SensoryInterestsLabel => 'Special sensory interests';

  @override
  String get csS8HasSensoryIssues =>
      'Does the child have problems with the senses?';

  @override
  String get csS8SensoryIssuesNotesHint => 'Add notes...';

  @override
  String get csS8HearingIssue => 'Hearing (gain, loss)';

  @override
  String get csS8TouchIssue => 'Touch (sensitivity)';

  @override
  String get csS8TasteIssue => 'Taste (putting in mouth)';

  @override
  String get csS8VestibularIssue => 'Body position (sounds, spinning)';

  @override
  String get csS8VisualSensoryIssue => 'Visual (colors, light)';

  @override
  String get csS8SensoryNotesHint => 'Add notes...';

  @override
  String get csS8SensoryReactionLabel => 'Child\'s reaction to sensory stimuli';

  @override
  String get csS8SensoryReactionHint => 'Describe the child\'s reaction...';

  @override
  String get csS8SocialBehaviorsTitle => 'Social Behaviors';

  @override
  String get csS8MakesFriendsEasily => 'Does the child make friends easily?';

  @override
  String get csS8MakesFriendsNotesHint => 'Describe...';

  @override
  String get csS8SharesInterests =>
      'Does the child share social skills or interests?';

  @override
  String get csS8SharesInterestsNotesHint => 'Describe...';

  @override
  String get csS8AbuseExposure =>
      'Has the child been exposed to any form of abuse, physical insult, or domestic violence?';

  @override
  String get csS8AbuseWitnessed => 'Yes, witnessed behavior before avoiding';

  @override
  String get csS8AbuseNotesHint => 'Describe...';

  @override
  String get csS8HasSignificantSocialEvent =>
      'Has the child been exposed to a major life event (such as abuse or personal friendship loss)?';

  @override
  String get csS8SignificantSocialEventNotesHint => 'Describe...';

  @override
  String get csS8ReactionToNegativeBehavior =>
      'What is the child\'s reaction to others\' negative behavior?';

  @override
  String get csS8ReactionToNegativeBehaviorHint => 'Describe the reaction...';

  @override
  String get csSection9Title => 'Capabilities, Strengths, and Interests';

  @override
  String get csS9ObservedStrengthsLabel => 'Observed Strengths';

  @override
  String get csS9ObservedStrengthsHint => 'Describe observed strengths...';

  @override
  String get csS9PreferredActivitiesTitle =>
      'Preferred Activities / Reinforcers';

  @override
  String get csS9ActivitySensoryGames => 'Sensory games';

  @override
  String get csS9ActivityElectronics => 'Electronics';

  @override
  String get csS9ActivityMotor => 'Motor';

  @override
  String get csS9ActivityFoods => 'Foods';

  @override
  String get csS9ActivityCharacters => 'Characters';

  @override
  String get csS9ActivityMusic => 'Music';

  @override
  String get csS9ActivityOther => 'Other';

  @override
  String get csS9OtherActivitiesLabel =>
      'What are the child\'s preferred activities (if other was selected in the previous question)';

  @override
  String get csS9OtherActivitiesHint => 'Enter child\'s preferred activities';

  @override
  String get csS9PreferenceScanTitle => 'Preference and Reinforcer Survey';

  @override
  String get csS9PrefFoodLabel => 'Food';

  @override
  String get csS9PrefSensoryLabel => 'Sensory';

  @override
  String get csS9PrefSocialLabel => 'Social';

  @override
  String get csS9PrefMaterialLabel => 'Material / Activity';

  @override
  String get csS9PrefExampleHint => 'Example';

  @override
  String get csS9PrefHighlyPreferred => 'Highly preferred';

  @override
  String get csS9PrefAcceptable => 'Acceptable';

  @override
  String get csS9PrefNotPreferred => 'Not preferred';

  @override
  String get csS9PositiveDistinctionLabel =>
      'What positively distinguishes the child?';

  @override
  String get csS9PositiveDistinctionHint =>
      'Describe what positively distinguishes the child...';

  @override
  String get csSection10Title => 'Educational and Services';

  @override
  String get csS10EnrolledInSchool => 'Educational enrollment';

  @override
  String get csS10SchoolNameLabel => 'School name';

  @override
  String get csS10SchoolNameHint => 'Enter child\'s school name';

  @override
  String get csS10SchoolGradeLabel => 'Grade';

  @override
  String get csS10SchoolGradeHint => 'Enter child\'s grade';

  @override
  String get csS10CurrentServicesTitle => 'Current / Previous Services';

  @override
  String get csS10ServiceABA => 'ABA';

  @override
  String get csS10ServiceSpeech => 'Speech therapy';

  @override
  String get csS10ServiceOccupational => 'Occupational therapy';

  @override
  String get csS10ServicePhysical => 'Physical therapy';

  @override
  String get csS10ServicePsychological => 'Psychological';

  @override
  String get csS10ServiceSpecialEd => 'Special education';

  @override
  String get csS10ServiceOther => 'Other';

  @override
  String get csS10ServiceNone => 'None';

  @override
  String get csS10OtherServiceLabel =>
      'What are the current/previous services (if other was selected in the previous question)';

  @override
  String get csS10OtherServiceHint => 'Enter services';

  @override
  String get csS10ServiceDurationLabel => 'Service duration';

  @override
  String get csS10ServiceDurationHint => 'Enter service duration';

  @override
  String get csS10HasIEP => 'Is there an individualized educational plan?';

  @override
  String get csS10PreviousReportsTitle => 'Previous Assessment Reports';

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
  String get csS10ReportOther => 'Other';

  @override
  String get csS10ReportNone => 'None';

  @override
  String get csS10SchoolSupportTitle =>
      'School Environment and Support Details';

  @override
  String get csS10ClassTypeLabel => 'Class type';

  @override
  String get csS10ClassTypeFullInclusion => 'Full inclusion';

  @override
  String get csS10ClassTypePartialInclusion => 'Partial inclusion';

  @override
  String get csS10ClassTypeSpecialClass => 'Special class';

  @override
  String get csS10ClassTypeCareCenter => 'Care center';

  @override
  String get csS10HasShadowTeacher => 'Is there a shadow teacher?';

  @override
  String get csS10ShadowTeacherNameLabel => 'Teacher name';

  @override
  String get csS10ShadowTeacherNameHint => 'Enter teacher name';

  @override
  String get csS10EnvironmentalModsTitle => 'Environmental modifications';

  @override
  String get csS10ModReduceDistractions => 'Reduce distractions';

  @override
  String get csS10ModVisualSchedule => 'Visual schedule';

  @override
  String get csS10ModSpecificSeat => 'Specific seating';

  @override
  String get csS10ModOther => 'Other';

  @override
  String get csS10SchoolBehaviorLabel => 'Behavior at school';

  @override
  String get csS10SchoolBehaviorHint =>
      'Describe the child\'s behavior at school...';

  @override
  String get csSection11Title => 'Family Priorities and Goals';

  @override
  String get csS11TopConcernsLabel => 'Top 3 family concerns';

  @override
  String get csS11TopConcernsHint => 'Describe the top 3 concerns...';

  @override
  String get csS11TopGoalsLabel => 'Top 3 goals the family wants to achieve';

  @override
  String get csS11TopGoalsHint => 'Describe the top 3 goals...';

  @override
  String get csS11SessionTimePrefsLabel => 'Session time preferences';

  @override
  String get csS11SessionTimePrefsHint => 'Enter session time preferences';

  @override
  String get csS11ParentTrainingReadinessLabel =>
      'Readiness for parent training';

  @override
  String get csS11OptionMaybe => 'Maybe';

  @override
  String get csSection12Title => 'Developmental Growth';

  @override
  String get csSection12Subtitle => 'Educational Aspects';

  @override
  String get csS12LearningReadiness =>
      'What is the child\'s learning readiness level?';

  @override
  String get csS12LearningGood => 'Good';

  @override
  String get csS12LearningAverage => 'Average';

  @override
  String get csS12LearningWeak => 'Weak';

  @override
  String get csS12AbsentFromCenter => 'Was the child absent from the center?';

  @override
  String get csS12AbsenceDuration =>
      'How long was the child absent from the center?';

  @override
  String get csS12AbsenceDurationHint => 'Enter duration of absence';

  @override
  String get csS12AbsenceReason =>
      'What was the reason for the child\'s absence?';

  @override
  String get csS12AbsenceReasonHint => 'Enter reason for absence';

  @override
  String get csS12ParticipatesInActivities =>
      'Did the child participate in extracurricular activities at the center?';

  @override
  String get csS12LikesCenter => 'Does the child like the center?';

  @override
  String get csS12TiresFastInClass => 'Does the child tire quickly in class?';

  @override
  String get csS12TeacherRelationship => 'Relationship with the teacher?';

  @override
  String get csS12PeersRelationship => 'Relationship with classmates?';

  @override
  String get csS12RelationshipGood => 'Good';

  @override
  String get csS12RelationshipBad => 'Bad';

  @override
  String get csS12ComprehensionLevel =>
      'Comprehension test: Level of understanding?';

  @override
  String get csS12ComprehensionGood => 'Good';

  @override
  String get csS12ComprehensionAverage => 'Average';

  @override
  String get csS12ComprehensionWeak => 'Weak';

  @override
  String get csS12ComprehensionNone => 'None';

  @override
  String get csS12NameRecognition => 'Name Recognition:';

  @override
  String get csS12KnowsFriendsNames => 'Friends\' names';

  @override
  String get csS12KnowsTeachersNames => 'Teachers\' names';

  @override
  String get csS12KnowsClassChildren => 'Class children';

  @override
  String get csS12ExpressionTest => 'Expression Test:';

  @override
  String get csS12UsesSentences => 'Using simple sentences';

  @override
  String get csS12UsesVerbs => 'Using verbs';

  @override
  String get csS12UsesConnectors => 'Using connectors';

  @override
  String get csS12BodyAwareness => 'Body Awareness Test:';

  @override
  String get csS12BodyImage => 'Body image';

  @override
  String get csS12BodyDirection => 'Body direction';

  @override
  String get csS12AuditoryPerception => 'Auditory Perception & Memory:';

  @override
  String get csS12SoundDirection => 'Sound direction';

  @override
  String get csS12AnimalSounds => 'Animal sound recognition';

  @override
  String get csS12VisualPerception => 'Visual Perception & Memory:';

  @override
  String get csS12RecognizesDifferences => 'Recognizing differences';

  @override
  String get csS12RecognizesSimilarities => 'Recognizing similarities';

  @override
  String get csS12ColorConcept => 'Color concept';

  @override
  String get csS12ShapeConcept => 'Shape concept';

  @override
  String get csSection13Title => 'Initial Assessment and Follow-up Plan';

  @override
  String get csS13PriorityLevel => 'Priority level';

  @override
  String get csS13PriorityLow => 'Low';

  @override
  String get csS13PriorityMedium => 'Medium';

  @override
  String get csS13PriorityHigh => 'High';

  @override
  String get csS13PriorityUrgent => 'Urgent';

  @override
  String get csS13SpecializationsTitle => 'Suggested specializations';

  @override
  String get csS13SpecABA => 'ABA';

  @override
  String get csS13SpecSpeech => 'Speech therapy';

  @override
  String get csS13SpecOccupational => 'Occupational therapy';

  @override
  String get csS13SpecPhysical => 'Physical therapy';

  @override
  String get csS13SpecPsychological => 'Psychological';

  @override
  String get csS13SpecSpecialEd => 'Special education';

  @override
  String get csS13AdditionalReqsTitle => 'Additional requirements';

  @override
  String get csS13ReviewOtherReports => 'Review other reports';

  @override
  String get csS13DirectObservation => 'Direct observation';

  @override
  String get csS13FamilyMeeting => 'Family meeting';

  @override
  String get csS13NotesAndNextStepsLabel => 'Summary of notes and next steps';

  @override
  String get csS13NotesAndNextStepsHint => 'Enter notes and next steps...';

  @override
  String get csS13NextAssessmentDateLabel => 'Next assessment date';

  @override
  String get csS13NextAssessmentTimeLabel => 'Next assessment time';

  @override
  String get csSectionDocsTitle => 'Documents and Consents';

  @override
  String get csSectionDocsSubmittedTitle => 'Documents Submitted';

  @override
  String get csSectionDocsID => 'ID';

  @override
  String get csSectionDocsMedicalReports => 'Medical reports';

  @override
  String get csSectionDocsDiagnosticReports => 'Diagnostic reports';

  @override
  String get csSectionDocsSchoolReports => 'School reports';

  @override
  String get csSectionDocsPrevTreatmentReports => 'Previous treatment reports';

  @override
  String get csSectionDocsOther => 'Other';

  @override
  String get csSectionDocsOtherLabel => 'What are the documents submitted';

  @override
  String get csSectionDocsOtherNote =>
      '(In case other was selected in the previous question)';

  @override
  String get csSectionDocsOtherHint => 'Enter document name';

  @override
  String get csSectionDocsConsentsTitle => 'Consents';

  @override
  String get csSectionDocsConsentPrivacy => 'Privacy policy';

  @override
  String get csSectionDocsConsentInfoSharing => 'Information sharing';

  @override
  String get csSectionDocsConsentOtherComms =>
      'Communications with other parties';

  @override
  String get csSectionDocsConsentAssessments => 'Complete assessments';

  @override
  String get csSectionDocsConsentFuturePlan => 'Future steps plan';

  @override
  String get csSection14Title => 'Daily Routine';

  @override
  String get csS14WeekdayRoutineLabel => 'Weekday routine (Work / School)';

  @override
  String get csS14WeekdayRoutineHint => 'Describe the weekday routine...';

  @override
  String get csS14WeekendRoutineLabel => 'Weekend routine';

  @override
  String get csS14WeekendRoutineHint => 'Describe the weekend routine...';

  @override
  String get csSection15Title => 'Signatures';

  @override
  String get csS15GuardianNameLabel => 'Guardian / Caregiver Name';

  @override
  String get csS15GuardianNameHint => 'Enter guardian name';

  @override
  String get csS15SignatureLabel => 'Signature';

  @override
  String get csS15ClearSignature => 'Clear';

  @override
  String get csS15DateLabel => 'Date';

  @override
  String get csS15SpecialistNameLabel => 'Name of Receiving Specialist';

  @override
  String get csS15SpecialistNameHint => 'Enter specialist name';

  @override
  String get csS15JobTitleLabel => 'Job Title';

  @override
  String get csS15JobTitleHint => 'Enter job title';

  @override
  String get csS15AddTeamMember =>
      '+ Add team members who participated in the interview if any';

  @override
  String get csS15SpecializationLabel => 'Specialization';

  @override
  String get csS15SpecializationHint => 'Enter specialization';

  @override
  String get csS15MemberNameLabel => 'Name';

  @override
  String get csS15MemberNameHint => 'Enter member name';

  @override
  String get parentRole => 'Parent / Guardian';

  @override
  String get receptionistRole => 'Receptionist';

  @override
  String get searchTherapist => 'Search for a therapist...';

  @override
  String therapistOf(String name) {
    return 'Therapist of $name';
  }

  @override
  String get csS4ComprehensiveTitle => 'Comprehensive Medical History';

  @override
  String get csS4MedHistYes => 'Yes';

  @override
  String get csS4MedHistNo => 'No';

  @override
  String get csS4HearingVision => 'Hearing/Vision Issues';

  @override
  String get csS4SeizuresHeadInjury => 'Seizures/Head Injury';

  @override
  String get csS4SleepNutrition => 'Sleep/Nutrition Issues';

  @override
  String get csS4BloodAnemiaResp => 'Blood/Anemia/Respiratory Issues';

  @override
  String get csS4DentalPerception => 'Dental/Perception Issues';

  @override
  String get csS4FattyFailureStunting => 'Fatty Failure/Stunting';

  @override
  String get csS4PrevTreatmentTitle => 'Previous Treatments';

  @override
  String get csS4AddTreatment => 'Add Treatment';

  @override
  String get csS4CurrentMedsTitle => 'Current Medications';

  @override
  String get csS4AddMedication => 'Add Medication';

  @override
  String get csS4DiagnosesTitle => 'Diagnoses';

  @override
  String get csS4DiagnosedOption => 'Diagnosed';

  @override
  String get csS4SuspectedOption => 'Suspected';

  @override
  String get csS4ASD => 'Autism Spectrum Disorder';

  @override
  String get csS4ADHD => 'ADHD';

  @override
  String get csS4LearningDelay => 'Learning Delay';

  @override
  String get csS4DownSyndrome => 'Down Syndrome';

  @override
  String get csS4OtherDiagnosis => 'Other Diagnosis';

  @override
  String get csS4MedAssessTitle => 'Medical Assessments';

  @override
  String get csS4NormalOption => 'Normal';

  @override
  String get csS4AbnormalOption => 'Abnormal';

  @override
  String get csS4AssessmentNotes => 'Assessment Notes';

  @override
  String get csS4AuditoryVisual => 'Auditory/Visual';

  @override
  String get csS4BrainScanEEG => 'Brain Scan/EEG';

  @override
  String get csS4GeneticTest => 'Genetic Test';

  @override
  String get csS4PsychoIQ => 'Psychological/IQ';

  @override
  String get csS4DietAllergyTitle => 'Diet and Allergies';

  @override
  String get csS4HasAllergiesQuestion => 'Does the child have allergies?';

  @override
  String get csS4AllergyTypeLabel => 'Allergy Type';

  @override
  String get csS4AllergyTypeHint => 'E.g., Peanuts, Dairy';

  @override
  String get csS4SpecialDietQuestion => 'Is the child on a special diet?';

  @override
  String get csS4GlutenFree => 'Gluten Free';

  @override
  String get csS4CaseinFree => 'Casein Free';

  @override
  String get csS4Biometric => 'Biometric';

  @override
  String get csS4OtherDiet => 'Other Diet';

  @override
  String get csS4OtherDietHint => 'Specify other diet';

  @override
  String get csS4AltVaccinesQuestion => 'Any alternative vaccines?';

  @override
  String get csS4AltVaccinesDescLabel => 'Alternative Vaccines Description';

  @override
  String get csS4AltVaccinesDescHint => 'Describe alternative vaccines';

  @override
  String get csS4AllVaccinesOnTimeQuestion => 'All vaccines on time?';

  @override
  String get csS4RemoveTreatment => 'Remove Treatment';

  @override
  String get csS4TreatmentTypeLabel => 'Treatment Type';

  @override
  String get csS4TreatmentTypeHint => 'Select treatment type';

  @override
  String get csS4TreatmentSpeech => 'Speech Therapy';

  @override
  String get csS4TreatmentOccupational => 'Occupational Therapy';

  @override
  String get csS4TreatmentPhysical => 'Physical Therapy';

  @override
  String get csS4TreatmentABA => 'ABA Therapy';

  @override
  String get csS4TreatmentPsychological => 'Psychological Therapy';

  @override
  String get csS4TreatmentOther => 'Other Therapy';

  @override
  String get csS4OrganizationLabel => 'Organization';

  @override
  String get csS4OrganizationHint => 'E.g., ABC Center';

  @override
  String get csS4ImprovementsLabel => 'Improvements';

  @override
  String get csS4NotesHint => 'Any additional notes';

  @override
  String get csS4MedNameLabel => 'Medication Name';

  @override
  String get csS4MedNameHint => 'E.g., Ritalin';

  @override
  String get csS4DosageTimingLabel => 'Dosage & Timing';

  @override
  String get csS4DosageTimingHint => 'E.g., 10mg morning';

  @override
  String get csS4UsageDurationLabel => 'Usage Duration';

  @override
  String get csS4UsageDurationHint => 'E.g., 6 months';

  @override
  String get csS5Subtitle => 'Birth Period Information';

  @override
  String get csS5SocialEmotionalTitle => 'Social & Emotional Development';

  @override
  String get csS5SocialSmile => 'Social Smile';

  @override
  String get csS5KnowsFamilyMembers => 'Knows Family Members';

  @override
  String get csS5RespondsToName => 'Responds to Name';

  @override
  String get csS5ShowsAffection => 'Shows Affection';

  @override
  String get csS5ShyOrFearful => 'Shy or Fearful';

  @override
  String get csS5CognitiveTitle => 'Cognitive Development';

  @override
  String get csS5ImitatesAdults => 'Imitates Adults';

  @override
  String get csS5PutsObjectsInMouth => 'Puts Objects in Mouth';

  @override
  String get csS5RecognizesColors => 'Recognizes Colors';

  @override
  String get csS5ImaginativePlay => 'Imaginative Play';

  @override
  String get csS5FollowsInstructions => 'Follows Instructions';

  @override
  String get csS5LanguageTitle => 'Language Development';

  @override
  String get csS5Cooing => 'Cooing';

  @override
  String get csS5TwoWordPhrases => 'Two-Word Phrases';

  @override
  String get csS5UsesGestures => 'Uses Gestures';

  @override
  String get csS5RequestsByWords => 'Requests by Words';

  @override
  String get csS5MotorTitle => 'Motor Development';

  @override
  String get csS5SittingCrawling => 'Sitting/Crawling';

  @override
  String get csS5JumpingClimbing => 'Jumping/Climbing';

  @override
  String get csS5WalkingWithoutHelp => 'Walking Without Help';

  @override
  String get csS5HoldingPenDrawing => 'Holding Pen/Drawing';

  @override
  String get csS5KickingThrowing => 'Kicking/Throwing';

  @override
  String get csS5MilestoneAgesTitle => 'Milestone Ages';

  @override
  String get csS5SocialSmileMilestone => 'Social Smile Age';

  @override
  String get csS5AgeHint => 'Age in months';

  @override
  String get csS5IndependentSitting => 'Independent Sitting';

  @override
  String get csS5IndependentWalking => 'Independent Walking';

  @override
  String get csS5FirstFunctionalWord => 'First Functional Word';

  @override
  String get csS5RegressionTitle => 'Developmental Regression';

  @override
  String get csS5RegressionQuestion => 'Any regression?';

  @override
  String get csS5RegressionAgeLabel => 'Regression Age';

  @override
  String get csS5RegressionAgeHint => 'Age when regression occurred';

  @override
  String get csS5RegressionAgeNote => 'Age in months';

  @override
  String get csS5RegressionDetailsLabel => 'Regression Details';

  @override
  String get csS5RegressionDetailsHint => 'Provide details of regression';

  @override
  String get csS5NotesHint => 'Any additional notes';

  @override
  String get downloadCaseStudy => 'Download Case Study';

  @override
  String get fillCaseStudyForm => 'Fill Case Study Form';

  @override
  String get totalFamilies => 'Total Families';

  @override
  String get activeChildren => 'Active Children';

  @override
  String get todayAppointments => 'Today\'s Appointments';

  @override
  String get quickActions => 'Quick Actions';

  @override
  String get addFamily => 'Add Family';

  @override
  String get addChild => 'Add Child';

  @override
  String get newAppointment => 'New Appointment';

  @override
  String get changePassword => 'Change Password';

  @override
  String get manageDailySessions => 'Manage daily therapy sessions';

  @override
  String get today => 'Today';

  @override
  String get statusConfirmed => 'Confirmed';

  @override
  String get statusCancelled => 'Cancelled';

  @override
  String get statusWaiting => 'Waiting';

  @override
  String get report => 'Report';

  @override
  String get printReport => 'Print Report';

  @override
  String get addFamilyTitle => 'Add New Family';

  @override
  String get addChildTitle => 'Add New Child';

  @override
  String get newAppointmentTitle => 'Schedule New Appointment';

  @override
  String get resetPasswordTitle => 'Reset Password';

  @override
  String get personalInfo => 'Personal Information';

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name (Family)';

  @override
  String get nameHint => 'Enter name';

  @override
  String get usernameLabel => 'Username';

  @override
  String get usernameHint => 'Child ID number';

  @override
  String get fatherMobile => 'Father\'s Mobile';

  @override
  String get fatherMobileHint => 'Father\'s mobile number';

  @override
  String get motherMobile => 'Mother\'s Mobile';

  @override
  String get motherMobileHint => 'Mother\'s mobile number';

  @override
  String get addChildrenSection => 'Add Children';

  @override
  String get assignChildrenTitle => 'Assign Children';

  @override
  String get nationalId => 'National ID Number';

  @override
  String get nationalIdHint => 'Enter child\'s national ID';

  @override
  String get diagnosisLabel => 'Diagnosis';

  @override
  String get diagnosisHint => 'Select diagnosis';

  @override
  String get birthDateLabel => 'Birth Date (Gregorian)';

  @override
  String get ageFieldLabel => 'Age';

  @override
  String get ageFieldHint => 'Enter child\'s age';

  @override
  String get assignChildFamilyTitle => 'Assign Child Family';

  @override
  String get nextButton => 'Next';

  @override
  String get documentsTitle => 'Documents';

  @override
  String get addDocumentLabel => '+ Add Document';

  @override
  String get documentNameLabel => 'Document Name';

  @override
  String get documentNameHint => 'Enter document name';

  @override
  String get uploadDocumentLabel => 'Upload Document';

  @override
  String get selectChildLabel => 'Select Child';

  @override
  String get selectTherapistLabel => 'Select Therapist';

  @override
  String get selectTherapistHint => 'Select therapist';

  @override
  String get appointmentTypeLabel => 'Appointment Type';

  @override
  String get appointmentTypeHint => 'Select appointment type';

  @override
  String get selectDateLabel => 'Select Date';

  @override
  String get selectTimeLabel => 'Select Time';

  @override
  String get scheduleScreenTitle => 'Appointment Schedule';

  @override
  String get assignFamily => 'Assign Family';

  @override
  String get selectFamilyHint => 'Select child\'s family';

  @override
  String get newPasswordLabel => 'New Password';

  @override
  String get newPasswordHint => 'Enter new password';

  @override
  String get confirmPasswordLabel => 'Confirm New Password';

  @override
  String get confirmPasswordHint => 'Enter new password';

  @override
  String get passwordsMustMatch => 'Passwords do not match';

  @override
  String get genderSelectHint => 'Select child\'s gender';

  @override
  String get childNameLabel => 'Child Name';

  @override
  String get childNameHint => 'Enter child\'s name';

  @override
  String get saveSuccess => 'Saved successfully';

  @override
  String get scheduleDateSubtitle => 'Manage daily therapy sessions';

  @override
  String get fieldRequired => 'This field is required';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get searchHint => 'Search...';

  @override
  String get selectGenderLabel => 'Gender';

  @override
  String get appointmentTypeSession => 'Therapy Session';

  @override
  String get appointmentTypeAssessment => 'Assessment';

  @override
  String get appointmentTypeFollowUp => 'Follow-up';

  @override
  String get selectChildHint => 'Select child';
}
