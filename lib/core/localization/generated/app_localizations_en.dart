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
  String get emailHint => 'name@example.com';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHint => '**********';

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
      'To accurately assess your child and provide the best possible service, you are required to fill out the case study form.';

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
  String get csSection2Title => 'Family Information';

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
  String get csSection3Title => 'Family Social and Economic Data';

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
  String get csDivorced => 'Divorced';

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
  String get csSection6Title => 'Medical Information and Birth History';

  @override
  String get csSection6Subtitle => 'Post-Birth Period';

  @override
  String get csS6BreastfeedingType =>
      'Was breastfeeding natural, artificial, or both?';

  @override
  String get csS6BreastfeedingNatural => 'Natural';

  @override
  String get csS6BreastfeedingArtificial => 'Artificial';

  @override
  String get csS6BreastfeedingBoth => 'Both';

  @override
  String get csS6Diseases =>
      'Was the child infected with any of the following diseases?';

  @override
  String get csS6Meningitis => 'Meningitis';

  @override
  String get csS6Measles => 'Measles';

  @override
  String get csS6Chickenpox => 'Chickenpox';

  @override
  String get csS6Mumps => 'Mumps';

  @override
  String get csS6TookLongTermMedication =>
      'Did the child take any medications or treatments for a long time?';

  @override
  String get csS6MedicationType => 'What type of medications?';

  @override
  String get csS6MedicationTypeHint => 'Enter type of medications';

  @override
  String get csS6HadFallsOrAccidents =>
      'Was the child hit with falls or accidents?';

  @override
  String get csS6HadHipDislocationExam => 'Was a hip dislocation exam done?';

  @override
  String get csS6HasChronicDiseases =>
      'Does the child suffer from chronic diseases?';

  @override
  String get csS6ChronicDiseaseType =>
      'What type of chronic disease does the child suffer from?';

  @override
  String get csS6ChronicDiseaseHint => 'Enter type of disease';

  @override
  String get csS6AteWell => 'Was the child eating well?';

  @override
  String get csS6HospitalizedBefore => 'Did the child ever go to hospital?';

  @override
  String get csS6SurgicalOperations => 'What surgical operations were done?';

  @override
  String get csS6SurgicalOperationsHint => 'Enter type of operation';

  @override
  String get csSection7Title => 'Behavioral Issues';

  @override
  String get csS7BehaviorsQuestion =>
      'Did you notice any of the following behaviors during the child\'s early childhood?';

  @override
  String get csS7ThumbSucking => 'Thumb Sucking';

  @override
  String get csS7NailBiting => 'Nail Biting';

  @override
  String get csS7Bedwetting => 'Bedwetting';

  @override
  String get csS7FoodAversion => 'Food Aversion';

  @override
  String get csS7SleepDisorder => 'Sleep Disorder';

  @override
  String get csS7ContinuousCrying => 'Continuous Crying';

  @override
  String get csS7Daydreaming => 'Daydreaming';

  @override
  String get csS7AngerAttacks => 'Anger Attacks';

  @override
  String get csS7Aggression => 'Aggression: Hitting/Biting/Cursing';

  @override
  String get csS7DestroyingObjects => 'Destroying Objects';

  @override
  String get csS7EpilepticSeizures => 'Epileptic Seizures';

  @override
  String get csS7SpeechDifficulties => 'Speech & Language Difficulties';

  @override
  String get csS7VaccinesQuestion =>
      'Did the child receive the following vaccines?';

  @override
  String get csS7VaccineTriple => 'Triple + Quadruple + Quintuple';

  @override
  String get csS7VaccinePolio => 'Polio';

  @override
  String get csS7VaccineTuberculosis => 'Tuberculosis';

  @override
  String get csS7VaccineMeasles => 'Measles';

  @override
  String get csS7VaccineGermanMeaslesMumps => 'German Measles + Mumps';

  @override
  String get csS7VaccineHepatitisB => 'Hepatitis B';

  @override
  String get csSection8Title => 'Developmental Growth';

  @override
  String get csSection8Subtitle => 'Motor & Physical Aspects';

  @override
  String get csS8SatAtRightTime => 'Did the child sit at the right time?';

  @override
  String get csS8CrawledAtRightTime => 'Did the child crawl at the right time?';

  @override
  String get csS8WalkedAtRightTime => 'Did the child walk at the right time?';

  @override
  String get csS8TeethingAge => 'At what age did the child start teething?';

  @override
  String get csS8TeethingAgeHint => 'Enter child\'s age';

  @override
  String get csS8DropsThings => 'Does the child drop or knock over objects?';

  @override
  String get csS8HasMovementDifficulties =>
      'Does the child have difficulty running, jumping, hopping, or climbing stairs alone?';

  @override
  String get csS8IsConstantlyMoving =>
      'Is the child constantly moving, with continuous movement?';

  @override
  String get csS8HasVisualImpairment =>
      'Does the child suffer from visual impairment?';

  @override
  String get csS8VisualImpairmentDegree =>
      'What is the degree of visual impairment?';

  @override
  String get csS8VisualImpairmentHint => 'Enter degree of impairment';

  @override
  String get csS8HasEyeDiseases => 'Does the child suffer from eye diseases?';

  @override
  String get csS8EyeDiseasesType => 'What are the eye diseases?';

  @override
  String get csS8EyeDiseasesHint => 'Enter the diseases';

  @override
  String get csS8HasHearingImpairment =>
      'Does the child have hearing impairment?';

  @override
  String get csS8HearingImpairmentDegree =>
      'What is the degree of hearing impairment?';

  @override
  String get csS8HearingImpairmentHint => 'Enter degree of impairment';

  @override
  String get csS8HasEarDiseases => 'Does the child have ear diseases?';

  @override
  String get csS8EarDiseasesType => 'What are the ear diseases?';

  @override
  String get csS8EarDiseasesHint => 'Enter the diseases';

  @override
  String get csS8HasAllergies => 'Does the child suffer from allergies?';

  @override
  String get csS8AllergyType => 'What type of allergy?';

  @override
  String get csS8AllergyFood => 'Food Allergy';

  @override
  String get csS8AllergyEnvironmental => 'Environmental Allergy';

  @override
  String get csS8AllergyTriggers => 'What triggers the child\'s allergies?';

  @override
  String get csS8AllergyTriggersHint => 'Enter the triggers';

  @override
  String get csSection9Title => 'Developmental Growth';

  @override
  String get csSection9Subtitle => 'Language Aspects';

  @override
  String get csS9SpeechUnderstoodByMother =>
      'Was the child\'s speech understood when speaking with the mother?';

  @override
  String get csS9HasStuttering => 'Does the child have stuttering in speech?';

  @override
  String get csS9HasLetterSubstitution =>
      'Does the child substitute some letters?';

  @override
  String get csS9SubstitutedLetters =>
      'What are the letters the child substitutes?';

  @override
  String get csS9SubstitutedLettersHint => 'Enter the substituted letters';

  @override
  String get csS9SpeaksUnintelligibly =>
      'Does the child sometimes speak unintelligibly?';

  @override
  String get csS9HasPronunciationDifficulty =>
      'Does the child have difficulty pronouncing some letters and words?';

  @override
  String get csS9DifficultLettersAndWords =>
      'What letters and words does the child have difficulty pronouncing?';

  @override
  String get csS9DifficultLettersHint => 'Enter the letters and words';

  @override
  String get csS9LanguageLikeAgePeers =>
      'Is the child\'s language like that of peers their age?';

  @override
  String get csSection10Title => 'Developmental Growth';

  @override
  String get csSection10Subtitle => 'Cognitive Aspects';

  @override
  String get csS10FollowsInstructions =>
      'Does the child follow instructions when assigned a task?';

  @override
  String get csS10CompletesAssignedTasks =>
      'Does the child complete the task requested of them?';

  @override
  String get csS10UnderstandsInstructions =>
      'Does the child understand what is said or requested of them?';

  @override
  String get csS10UnderstandsAlways => 'Always';

  @override
  String get csS10UnderstandsSometimes => 'Sometimes';

  @override
  String get csS10UnderstandsRarely => 'Rarely';

  @override
  String get csS10HasMemoryDifficulty =>
      'Does the child have difficulty remembering things and information?';

  @override
  String get csS10HasNamingDifficulty =>
      'Does the child have difficulty naming familiar objects?';

  @override
  String get csS10IsImpulsive =>
      'Is the child impulsive (acts without thinking about consequences)?';

  @override
  String get csS10ConcentrationLevel =>
      'What is the child\'s ability to concentrate and pay attention?';

  @override
  String get csS10ConcentrationGood => 'Good';

  @override
  String get csS10ConcentrationAverage => 'Average';

  @override
  String get csS10ConcentrationWeak => 'Weak';

  @override
  String get csSection11Title => 'Developmental Growth';

  @override
  String get csSection11Subtitle => 'Social Aspects';

  @override
  String get csS11IsQuickToAnger =>
      'Is the child quick to anger and irritability?';

  @override
  String get csS11DestroysPlaythings =>
      'Does the child destroy toys, tools, and objects?';

  @override
  String get csS11IsStubborn => 'Is the child stubborn and uncooperative?';

  @override
  String get csS11IsAggressive =>
      'Is the child aggressive by nature with others?';

  @override
  String get csS11CanPlayCalmly => 'Is the child able to play calmly?';

  @override
  String get csS11AttacksSiblings => 'Does the child attack their siblings?';

  @override
  String get csS11IsPopularWithPeers =>
      'Is the child popular with classmates and neighbors?';

  @override
  String get csS11BehaviorDuringVisits =>
      'How is the child\'s behavior and conduct when visiting others?';

  @override
  String get csS11BehaviorDuringVisitsHint => 'Describe the child\'s behavior';

  @override
  String get csS11SocialMaturityLikeAgePeers =>
      'Is the child\'s social maturity at the level of their age peers?';

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
  String get csSection13Title => 'Developmental Growth';

  @override
  String get csSection13Subtitle => 'Self-Care Aspects';

  @override
  String get csS13UsesToiletProperly =>
      'Does the child use the toilet properly?';

  @override
  String get csS13BathesAlone => 'Does the child bathe alone?';

  @override
  String get csS13DressesAlone => 'Does the child dress themselves alone?';

  @override
  String get csS13UsesToothbrush =>
      'Does the child use a toothbrush to clean their teeth?';

  @override
  String get csS13WearsShoesAlone =>
      'Does the child put on and tie their shoes alone?';

  @override
  String get csS13WashesFaceOnWaking =>
      'Does the child wash their face upon waking?';

  @override
  String get csS13WashesHandsBeforeAfterEating =>
      'Does the child wash their hands before and after eating?';

  @override
  String get csS13WashesFeetAfterPlay =>
      'Does the child wash their feet after returning from the center or playing?';

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
}
