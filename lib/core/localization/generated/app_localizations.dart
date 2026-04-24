import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'BHCFMS'**
  String get appTitle;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get welcomeMessage;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @centerName.
  ///
  /// In en, this message translates to:
  /// **'Bright Horizon Center'**
  String get centerName;

  /// No description provided for @splashSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Premium care, smart insights'**
  String get splashSubtitle;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcomeSubtitle;

  /// No description provided for @loginStepByStep.
  ///
  /// In en, this message translates to:
  /// **'Together to monitor and develop cases step by step'**
  String get loginStepByStep;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'name@example.com'**
  String get emailHint;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'**********'**
  String get passwordHint;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButton;

  /// No description provided for @adminAccountNote.
  ///
  /// In en, this message translates to:
  /// **'Accounts are created by center administration only'**
  String get adminAccountNote;

  /// No description provided for @validationRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get validationRequired;

  /// No description provided for @validationEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get validationEmail;

  /// No description provided for @validationPasswordLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get validationPasswordLength;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back {name}'**
  String welcomeBack(String name);

  /// No description provided for @todayTasks.
  ///
  /// In en, this message translates to:
  /// **'Here are your most important tasks and recommendations for today...'**
  String get todayTasks;

  /// No description provided for @parentsWelocome.
  ///
  /// In en, this message translates to:
  /// **'Follow your child\'s sessions, tasks, and latest updates…'**
  String get parentsWelocome;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @upcomingSessions.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Sessions'**
  String get upcomingSessions;

  /// No description provided for @todayGoals.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Goals'**
  String get todayGoals;

  /// No description provided for @speechSession.
  ///
  /// In en, this message translates to:
  /// **'Speech Session'**
  String get speechSession;

  /// No description provided for @room.
  ///
  /// In en, this message translates to:
  /// **'Room {number}'**
  String room(String number);

  /// No description provided for @statusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get statusCompleted;

  /// No description provided for @statusInProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get statusInProgress;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @noNotificationsYet.
  ///
  /// In en, this message translates to:
  /// **'No notifications yet'**
  String get noNotificationsYet;

  /// No description provided for @notificationNewSession.
  ///
  /// In en, this message translates to:
  /// **'New session assigned'**
  String get notificationNewSession;

  /// No description provided for @notificationGoalUpdated.
  ///
  /// In en, this message translates to:
  /// **'Goal updated'**
  String get notificationGoalUpdated;

  /// No description provided for @notificationReminder.
  ///
  /// In en, this message translates to:
  /// **'Session reminder'**
  String get notificationReminder;

  /// No description provided for @childDetails.
  ///
  /// In en, this message translates to:
  /// **'Child Details'**
  String get childDetails;

  /// No description provided for @sessionInfo.
  ///
  /// In en, this message translates to:
  /// **'Session Information'**
  String get sessionInfo;

  /// No description provided for @goals.
  ///
  /// In en, this message translates to:
  /// **'Goals'**
  String get goals;

  /// No description provided for @beneficiaries.
  ///
  /// In en, this message translates to:
  /// **'Beneficiaries'**
  String get beneficiaries;

  /// No description provided for @searchBeneficiary.
  ///
  /// In en, this message translates to:
  /// **'Search for a beneficiary...'**
  String get searchBeneficiary;

  /// No description provided for @filterActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get filterActive;

  /// No description provided for @filterCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get filterCompleted;

  /// No description provided for @progressAchieved.
  ///
  /// In en, this message translates to:
  /// **'Progress Achieved'**
  String get progressAchieved;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// No description provided for @speechImprovement.
  ///
  /// In en, this message translates to:
  /// **'Speech Improvement'**
  String get speechImprovement;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedule;

  /// No description provided for @scheduleTitle.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get scheduleTitle;

  /// No description provided for @upcomingSessionLegend.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Session'**
  String get upcomingSessionLegend;

  /// No description provided for @completedSessionLegend.
  ///
  /// In en, this message translates to:
  /// **'Completed Session'**
  String get completedSessionLegend;

  /// No description provided for @holidayLegend.
  ///
  /// In en, this message translates to:
  /// **'Holiday'**
  String get holidayLegend;

  /// No description provided for @noSessionsOnDay.
  ///
  /// In en, this message translates to:
  /// **'No sessions on this day'**
  String get noSessionsOnDay;

  /// No description provided for @sessionTime.
  ///
  /// In en, this message translates to:
  /// **'Session Time'**
  String get sessionTime;

  /// No description provided for @child.
  ///
  /// In en, this message translates to:
  /// **'Child'**
  String get child;

  /// No description provided for @therapist.
  ///
  /// In en, this message translates to:
  /// **'Therapist'**
  String get therapist;

  /// No description provided for @messages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// No description provided for @searchGuardian.
  ///
  /// In en, this message translates to:
  /// **'Search for a guardian...'**
  String get searchGuardian;

  /// No description provided for @typeMessage.
  ///
  /// In en, this message translates to:
  /// **'Type a message...'**
  String get typeMessage;

  /// No description provided for @noConversations.
  ///
  /// In en, this message translates to:
  /// **'No conversations yet'**
  String get noConversations;

  /// No description provided for @noMessages.
  ///
  /// In en, this message translates to:
  /// **'No messages yet'**
  String get noMessages;

  /// No description provided for @guardianOf.
  ///
  /// In en, this message translates to:
  /// **'Parent of {name}'**
  String guardianOf(String name);

  /// No description provided for @messageSent.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get messageSent;

  /// No description provided for @messageDelivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get messageDelivered;

  /// No description provided for @messageRead.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get messageRead;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @generalSettings.
  ///
  /// In en, this message translates to:
  /// **'General Settings'**
  String get generalSettings;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @notificationsLabel.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsLabel;

  /// No description provided for @speechTherapist.
  ///
  /// In en, this message translates to:
  /// **'Speech & Language Therapist'**
  String get speechTherapist;

  /// No description provided for @logoutConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutConfirmTitle;

  /// No description provided for @logoutConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutConfirmMessage;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @childFile.
  ///
  /// In en, this message translates to:
  /// **'Child File'**
  String get childFile;

  /// No description provided for @sessionTab.
  ///
  /// In en, this message translates to:
  /// **'Session'**
  String get sessionTab;

  /// No description provided for @sessionGoalsTab.
  ///
  /// In en, this message translates to:
  /// **'Session Goals'**
  String get sessionGoalsTab;

  /// No description provided for @treatmentPlanTab.
  ///
  /// In en, this message translates to:
  /// **'Treatment Plan'**
  String get treatmentPlanTab;

  /// No description provided for @overviewTab.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overviewTab;

  /// No description provided for @activeStatus.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get activeStatus;

  /// No description provided for @uploadSessionVideo.
  ///
  /// In en, this message translates to:
  /// **'Upload session video'**
  String get uploadSessionVideo;

  /// No description provided for @uploadSessionAudio.
  ///
  /// In en, this message translates to:
  /// **'Upload session audio'**
  String get uploadSessionAudio;

  /// No description provided for @assessmentsSection.
  ///
  /// In en, this message translates to:
  /// **'Assessments'**
  String get assessmentsSection;

  /// No description provided for @visualCommunicationTest.
  ///
  /// In en, this message translates to:
  /// **'Visual Communication Test'**
  String get visualCommunicationTest;

  /// No description provided for @behavioralSkillsTest.
  ///
  /// In en, this message translates to:
  /// **'Behavioral Skills Test'**
  String get behavioralSkillsTest;

  /// No description provided for @commandResponseTest.
  ///
  /// In en, this message translates to:
  /// **'Command Response Test'**
  String get commandResponseTest;

  /// No description provided for @addParentTask.
  ///
  /// In en, this message translates to:
  /// **'Add task to parent'**
  String get addParentTask;

  /// No description provided for @startButton.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get startButton;

  /// No description provided for @assessmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Assessment'**
  String get assessmentTitle;

  /// No description provided for @finishAssessment.
  ///
  /// In en, this message translates to:
  /// **'Finish Assessment'**
  String get finishAssessment;

  /// No description provided for @doesChildLookQuestion.
  ///
  /// In en, this message translates to:
  /// **'Does the child look when called by name?'**
  String get doesChildLookQuestion;

  /// No description provided for @ratingWeak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get ratingWeak;

  /// No description provided for @ratingGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get ratingGood;

  /// No description provided for @ratingMedium.
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get ratingMedium;

  /// No description provided for @ratingExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent'**
  String get ratingExcellent;

  /// No description provided for @chooseMainGoal.
  ///
  /// In en, this message translates to:
  /// **'Choose main session goal'**
  String get chooseMainGoal;

  /// No description provided for @sessionNotesTitle.
  ///
  /// In en, this message translates to:
  /// **'Session Notes'**
  String get sessionNotesTitle;

  /// No description provided for @childSessionRating.
  ///
  /// In en, this message translates to:
  /// **'Child rating during session'**
  String get childSessionRating;

  /// No description provided for @childInteractionLevel.
  ///
  /// In en, this message translates to:
  /// **'Child interaction level'**
  String get childInteractionLevel;

  /// No description provided for @childInteractionHint.
  ///
  /// In en, this message translates to:
  /// **'Child interaction'**
  String get childInteractionHint;

  /// No description provided for @goalAchievementLabel.
  ///
  /// In en, this message translates to:
  /// **'Goal Achievement'**
  String get goalAchievementLabel;

  /// No description provided for @notAchieved.
  ///
  /// In en, this message translates to:
  /// **'Not Achieved'**
  String get notAchieved;

  /// No description provided for @partialAchievement.
  ///
  /// In en, this message translates to:
  /// **'Partial'**
  String get partialAchievement;

  /// No description provided for @goalAchieved.
  ///
  /// In en, this message translates to:
  /// **'Goal Achieved'**
  String get goalAchieved;

  /// No description provided for @performanceTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Performance Type'**
  String get performanceTypeLabel;

  /// No description provided for @performanceTypeHint.
  ///
  /// In en, this message translates to:
  /// **'Performance type'**
  String get performanceTypeHint;

  /// No description provided for @notesLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notesLabel;

  /// No description provided for @saveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButton;

  /// No description provided for @smartSuggestions.
  ///
  /// In en, this message translates to:
  /// **'Smart Suggestions'**
  String get smartSuggestions;

  /// No description provided for @getNewGoals.
  ///
  /// In en, this message translates to:
  /// **'Get new goals based on child\'s condition'**
  String get getNewGoals;

  /// No description provided for @suggestGoals.
  ///
  /// In en, this message translates to:
  /// **'Suggest Goals'**
  String get suggestGoals;

  /// No description provided for @endSession.
  ///
  /// In en, this message translates to:
  /// **'End Session'**
  String get endSession;

  /// No description provided for @currentTreatmentPlan.
  ///
  /// In en, this message translates to:
  /// **'Current Treatment Plan'**
  String get currentTreatmentPlan;

  /// No description provided for @planDuration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get planDuration;

  /// No description provided for @startedIn.
  ///
  /// In en, this message translates to:
  /// **'Started on'**
  String get startedIn;

  /// No description provided for @statusNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Not Started'**
  String get statusNotStarted;

  /// No description provided for @progressTitle.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progressTitle;

  /// No description provided for @notableImprovement.
  ///
  /// In en, this message translates to:
  /// **'Notable improvement in recent sessions'**
  String get notableImprovement;

  /// No description provided for @remainingGoals.
  ///
  /// In en, this message translates to:
  /// **'Remaining Goals'**
  String get remainingGoals;

  /// No description provided for @achievedGoals.
  ///
  /// In en, this message translates to:
  /// **'Achieved Goals'**
  String get achievedGoals;

  /// No description provided for @aiSuggestionsTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Suggestions'**
  String get aiSuggestionsTitle;

  /// No description provided for @personalProfile.
  ///
  /// In en, this message translates to:
  /// **'Personal Profile'**
  String get personalProfile;

  /// No description provided for @goalsSummary.
  ///
  /// In en, this message translates to:
  /// **'Goals Summary'**
  String get goalsSummary;

  /// No description provided for @achievedCount.
  ///
  /// In en, this message translates to:
  /// **'Achieved'**
  String get achievedCount;

  /// No description provided for @remainingCount.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get remainingCount;

  /// No description provided for @aiSuggestedGoals.
  ///
  /// In en, this message translates to:
  /// **'AI Suggested Goals'**
  String get aiSuggestedGoals;

  /// No description provided for @highPriority.
  ///
  /// In en, this message translates to:
  /// **'High Priority'**
  String get highPriority;

  /// No description provided for @mediumPriority.
  ///
  /// In en, this message translates to:
  /// **'Medium Priority'**
  String get mediumPriority;

  /// No description provided for @continuousDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Continuous Development'**
  String get continuousDevelopment;

  /// No description provided for @addToPlan.
  ///
  /// In en, this message translates to:
  /// **'Add to Plan'**
  String get addToPlan;

  /// No description provided for @updateSuggestions.
  ///
  /// In en, this message translates to:
  /// **'Update Suggestions'**
  String get updateSuggestions;

  /// No description provided for @saveToTreatmentPlan.
  ///
  /// In en, this message translates to:
  /// **'Save to Treatment Plan'**
  String get saveToTreatmentPlan;

  /// No description provided for @viewPlan.
  ///
  /// In en, this message translates to:
  /// **'View Plan'**
  String get viewPlan;

  /// No description provided for @sessionNotesRecord.
  ///
  /// In en, this message translates to:
  /// **'Record Session Notes'**
  String get sessionNotesRecord;

  /// No description provided for @csFormIntroTitle.
  ///
  /// In en, this message translates to:
  /// **'Before You Start'**
  String get csFormIntroTitle;

  /// No description provided for @csFormIntroBody.
  ///
  /// In en, this message translates to:
  /// **'To accurately assess your child and provide the best possible service, you are required to fill out the case study form.'**
  String get csFormIntroBody;

  /// No description provided for @csFormIntroNote.
  ///
  /// In en, this message translates to:
  /// **'The form consists of {count} sections. Please fill out all sections carefully.'**
  String csFormIntroNote(int count);

  /// No description provided for @csFormStartButton.
  ///
  /// In en, this message translates to:
  /// **'Start Now'**
  String get csFormStartButton;

  /// No description provided for @csFormContinueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get csFormContinueButton;

  /// No description provided for @csFormNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get csFormNext;

  /// No description provided for @csFormFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get csFormFinish;

  /// No description provided for @csFormResumeNote.
  ///
  /// In en, this message translates to:
  /// **'Progress will resume from section {section}'**
  String csFormResumeNote(int section);

  /// No description provided for @csSection1Title.
  ///
  /// In en, this message translates to:
  /// **'Child Personal Information'**
  String get csSection1Title;

  /// No description provided for @csChildName.
  ///
  /// In en, this message translates to:
  /// **'Child Name'**
  String get csChildName;

  /// No description provided for @csChildNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter child\'s name'**
  String get csChildNameHint;

  /// No description provided for @csPlaceOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Place of Birth'**
  String get csPlaceOfBirth;

  /// No description provided for @csPlaceOfBirthHint.
  ///
  /// In en, this message translates to:
  /// **'Enter place of birth'**
  String get csPlaceOfBirthHint;

  /// No description provided for @csDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get csDateOfBirth;

  /// No description provided for @csGrade.
  ///
  /// In en, this message translates to:
  /// **'Grade'**
  String get csGrade;

  /// No description provided for @csGradeHint.
  ///
  /// In en, this message translates to:
  /// **'Enter child\'s grade'**
  String get csGradeHint;

  /// No description provided for @csChildAge.
  ///
  /// In en, this message translates to:
  /// **'Child\'s Age'**
  String get csChildAge;

  /// No description provided for @csChildAgeHint.
  ///
  /// In en, this message translates to:
  /// **'Enter child\'s age'**
  String get csChildAgeHint;

  /// No description provided for @csGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get csGender;

  /// No description provided for @csGenderHint.
  ///
  /// In en, this message translates to:
  /// **'Select gender'**
  String get csGenderHint;

  /// No description provided for @csGenderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get csGenderMale;

  /// No description provided for @csGenderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get csGenderFemale;

  /// No description provided for @csNationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get csNationality;

  /// No description provided for @csNationalityHint.
  ///
  /// In en, this message translates to:
  /// **'Enter nationality'**
  String get csNationalityHint;

  /// No description provided for @csFamilyRank.
  ///
  /// In en, this message translates to:
  /// **'Child\'s Rank in Family'**
  String get csFamilyRank;

  /// No description provided for @csFamilyRankHint.
  ///
  /// In en, this message translates to:
  /// **'Enter child\'s rank in family'**
  String get csFamilyRankHint;

  /// No description provided for @csCenterJoinDate.
  ///
  /// In en, this message translates to:
  /// **'Date of Joining the Center'**
  String get csCenterJoinDate;

  /// No description provided for @csSection2Title.
  ///
  /// In en, this message translates to:
  /// **'Family Information'**
  String get csSection2Title;

  /// No description provided for @csFatherName.
  ///
  /// In en, this message translates to:
  /// **'Father\'s Name'**
  String get csFatherName;

  /// No description provided for @csFatherNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter father\'s name'**
  String get csFatherNameHint;

  /// No description provided for @csFatherEducation.
  ///
  /// In en, this message translates to:
  /// **'Educational Level'**
  String get csFatherEducation;

  /// No description provided for @csFatherEducationHint.
  ///
  /// In en, this message translates to:
  /// **'Enter father\'s educational level'**
  String get csFatherEducationHint;

  /// No description provided for @csMotherName.
  ///
  /// In en, this message translates to:
  /// **'Mother\'s Name'**
  String get csMotherName;

  /// No description provided for @csMotherNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter mother\'s name'**
  String get csMotherNameHint;

  /// No description provided for @csMotherEducation.
  ///
  /// In en, this message translates to:
  /// **'Educational Level'**
  String get csMotherEducation;

  /// No description provided for @csMotherEducationHint.
  ///
  /// In en, this message translates to:
  /// **'Enter mother\'s educational level'**
  String get csMotherEducationHint;

  /// No description provided for @csParentsKinship.
  ///
  /// In en, this message translates to:
  /// **'Is there a kinship between the father and mother?'**
  String get csParentsKinship;

  /// No description provided for @csKinshipType.
  ///
  /// In en, this message translates to:
  /// **'What is the specific type of kinship?'**
  String get csKinshipType;

  /// No description provided for @csKinshipTypeHint.
  ///
  /// In en, this message translates to:
  /// **'Enter type of kinship'**
  String get csKinshipTypeHint;

  /// No description provided for @csKinshipNote.
  ///
  /// In en, this message translates to:
  /// **'(In case of kinship between parents)'**
  String get csKinshipNote;

  /// No description provided for @csSection3Title.
  ///
  /// In en, this message translates to:
  /// **'Family Social and Economic Data'**
  String get csSection3Title;

  /// No description provided for @csHomeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language Used at Home'**
  String get csHomeLanguage;

  /// No description provided for @csHomeLanguageHint.
  ///
  /// In en, this message translates to:
  /// **'Enter language'**
  String get csHomeLanguageHint;

  /// No description provided for @csSchoolLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language Used at School'**
  String get csSchoolLanguage;

  /// No description provided for @csSchoolLanguageHint.
  ///
  /// In en, this message translates to:
  /// **'Enter language'**
  String get csSchoolLanguageHint;

  /// No description provided for @csMaritalStatus.
  ///
  /// In en, this message translates to:
  /// **'Parents\' Marital Status'**
  String get csMaritalStatus;

  /// No description provided for @csMarried.
  ///
  /// In en, this message translates to:
  /// **'Married'**
  String get csMarried;

  /// No description provided for @csDivorced.
  ///
  /// In en, this message translates to:
  /// **'Divorced'**
  String get csDivorced;

  /// No description provided for @csChildLivingWith.
  ///
  /// In en, this message translates to:
  /// **'Who Does the Child Live With'**
  String get csChildLivingWith;

  /// No description provided for @csLivesWithBoth.
  ///
  /// In en, this message translates to:
  /// **'Both Parents'**
  String get csLivesWithBoth;

  /// No description provided for @csLivesWithFather.
  ///
  /// In en, this message translates to:
  /// **'Father'**
  String get csLivesWithFather;

  /// No description provided for @csLivesWithMother.
  ///
  /// In en, this message translates to:
  /// **'Mother'**
  String get csLivesWithMother;

  /// No description provided for @csLivesWithOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get csLivesWithOther;

  /// No description provided for @csChildLivingOtherHint.
  ///
  /// In en, this message translates to:
  /// **'Enter who the child lives with'**
  String get csChildLivingOtherHint;

  /// No description provided for @csChildLivingOtherNote.
  ///
  /// In en, this message translates to:
  /// **'(In case of other selection)'**
  String get csChildLivingOtherNote;

  /// No description provided for @csFamilyRelationship.
  ///
  /// In en, this message translates to:
  /// **'Child\'s Relationship with Family'**
  String get csFamilyRelationship;

  /// No description provided for @csFamilyRelationshipHint.
  ///
  /// In en, this message translates to:
  /// **'What is the child\'s relationship with family'**
  String get csFamilyRelationshipHint;

  /// No description provided for @csFamilyProvider.
  ///
  /// In en, this message translates to:
  /// **'Who Provides for the Family'**
  String get csFamilyProvider;

  /// No description provided for @csFamilyIncome.
  ///
  /// In en, this message translates to:
  /// **'Family Economic Income'**
  String get csFamilyIncome;

  /// No description provided for @csIncomeExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent'**
  String get csIncomeExcellent;

  /// No description provided for @csIncomeAverage.
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get csIncomeAverage;

  /// No description provided for @csIncomeWeak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get csIncomeWeak;

  /// No description provided for @csFamilyMembersCount.
  ///
  /// In en, this message translates to:
  /// **'Number of Family Members'**
  String get csFamilyMembersCount;

  /// No description provided for @csFamilyMembersCountHint.
  ///
  /// In en, this message translates to:
  /// **'Enter number of family members'**
  String get csFamilyMembersCountHint;

  /// No description provided for @csFamilyHealthConditions.
  ///
  /// In en, this message translates to:
  /// **'Does any family member suffer from diseases or specific problems (hereditary or non-hereditary)?'**
  String get csFamilyHealthConditions;

  /// No description provided for @csAffectedPerson.
  ///
  /// In en, this message translates to:
  /// **'Who is the Person Suffering from the Illness'**
  String get csAffectedPerson;

  /// No description provided for @csAffectedPersonHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the person\'s relation to the child'**
  String get csAffectedPersonHint;

  /// No description provided for @csDiseaseName.
  ///
  /// In en, this message translates to:
  /// **'What is the Disease'**
  String get csDiseaseName;

  /// No description provided for @csDiseaseNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the disease'**
  String get csDiseaseNameHint;

  /// No description provided for @csAddAnotherPerson.
  ///
  /// In en, this message translates to:
  /// **'Add Another Person'**
  String get csAddAnotherPerson;

  /// No description provided for @csOptional.
  ///
  /// In en, this message translates to:
  /// **'(optional)'**
  String get csOptional;

  /// No description provided for @csYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get csYes;

  /// No description provided for @csNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get csNo;

  /// No description provided for @csIfPreviousYes.
  ///
  /// In en, this message translates to:
  /// **'(If the previous answer was yes)'**
  String get csIfPreviousYes;

  /// No description provided for @csIfPreviousNo.
  ///
  /// In en, this message translates to:
  /// **'(If the previous answer was no)'**
  String get csIfPreviousNo;

  /// No description provided for @csFamilyProviderFather.
  ///
  /// In en, this message translates to:
  /// **'Father'**
  String get csFamilyProviderFather;

  /// No description provided for @csFamilyProviderMother.
  ///
  /// In en, this message translates to:
  /// **'Mother'**
  String get csFamilyProviderMother;

  /// No description provided for @csFamilyProviderRelative.
  ///
  /// In en, this message translates to:
  /// **'Relative'**
  String get csFamilyProviderRelative;

  /// No description provided for @csSection4Title.
  ///
  /// In en, this message translates to:
  /// **'Medical Information and Birth History'**
  String get csSection4Title;

  /// No description provided for @csSection4Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Pregnancy Period'**
  String get csSection4Subtitle;

  /// No description provided for @csS4TookMedication.
  ///
  /// In en, this message translates to:
  /// **'Did the mother take medication during pregnancy?'**
  String get csS4TookMedication;

  /// No description provided for @csS4MedicationType.
  ///
  /// In en, this message translates to:
  /// **'What type of medication?'**
  String get csS4MedicationType;

  /// No description provided for @csS4MedicationTypeHint.
  ///
  /// In en, this message translates to:
  /// **'Enter medication type'**
  String get csS4MedicationTypeHint;

  /// No description provided for @csS4HadDoctorFollowUp.
  ///
  /// In en, this message translates to:
  /// **'Did the mother follow up with a doctor during pregnancy?'**
  String get csS4HadDoctorFollowUp;

  /// No description provided for @csS4FollowUpRegular.
  ///
  /// In en, this message translates to:
  /// **'Was the follow-up with the doctor regular?'**
  String get csS4FollowUpRegular;

  /// No description provided for @csS4ExposedToRadiation.
  ///
  /// In en, this message translates to:
  /// **'Was the mother exposed to radiation during pregnancy?'**
  String get csS4ExposedToRadiation;

  /// No description provided for @csS4HadInjuries.
  ///
  /// In en, this message translates to:
  /// **'Was the mother exposed to any injuries, falls, or accidents?'**
  String get csS4HadInjuries;

  /// No description provided for @csS4InjuriesType.
  ///
  /// In en, this message translates to:
  /// **'Type of injuries, falls, and accidents'**
  String get csS4InjuriesType;

  /// No description provided for @csS4InjuriesTypeHint.
  ///
  /// In en, this message translates to:
  /// **'Enter type of accidents'**
  String get csS4InjuriesTypeHint;

  /// No description provided for @csS4PsychologicalTrauma.
  ///
  /// In en, this message translates to:
  /// **'Was the mother exposed to psychological trauma during pregnancy?'**
  String get csS4PsychologicalTrauma;

  /// No description provided for @csS4PsychologicalTraumaNote.
  ///
  /// In en, this message translates to:
  /// **'(e.g. death of a relative or a traumatic accident)'**
  String get csS4PsychologicalTraumaNote;

  /// No description provided for @csS4NineMonths.
  ///
  /// In en, this message translates to:
  /// **'Was the pregnancy duration nine months?'**
  String get csS4NineMonths;

  /// No description provided for @csS4DurationLabel.
  ///
  /// In en, this message translates to:
  /// **'What was the duration of pregnancy?'**
  String get csS4DurationLabel;

  /// No description provided for @csS4DurationHint.
  ///
  /// In en, this message translates to:
  /// **'Enter number of months'**
  String get csS4DurationHint;

  /// No description provided for @csS4DiseasesDuringPregnancy.
  ///
  /// In en, this message translates to:
  /// **'Did the mother get any of the following diseases during pregnancy?'**
  String get csS4DiseasesDuringPregnancy;

  /// No description provided for @csS4Diabetes.
  ///
  /// In en, this message translates to:
  /// **'Diabetes'**
  String get csS4Diabetes;

  /// No description provided for @csS4BloodPressure.
  ///
  /// In en, this message translates to:
  /// **'Blood Pressure'**
  String get csS4BloodPressure;

  /// No description provided for @csS4Albuminuria.
  ///
  /// In en, this message translates to:
  /// **'Albuminuria'**
  String get csS4Albuminuria;

  /// No description provided for @csS4Preeclampsia.
  ///
  /// In en, this message translates to:
  /// **'Preeclampsia'**
  String get csS4Preeclampsia;

  /// No description provided for @csS4Rubella.
  ///
  /// In en, this message translates to:
  /// **'Rubella'**
  String get csS4Rubella;

  /// No description provided for @csS4Bleeding.
  ///
  /// In en, this message translates to:
  /// **'Bleeding'**
  String get csS4Bleeding;

  /// No description provided for @csS4InfectiousDiseases.
  ///
  /// In en, this message translates to:
  /// **'Did the mother get infectious diseases during pregnancy?'**
  String get csS4InfectiousDiseases;

  /// No description provided for @csS4InfectiousDiseaseType.
  ///
  /// In en, this message translates to:
  /// **'What type of disease did the mother get?'**
  String get csS4InfectiousDiseaseType;

  /// No description provided for @csS4ChronicDiseases.
  ///
  /// In en, this message translates to:
  /// **'Does the mother suffer from any chronic diseases?'**
  String get csS4ChronicDiseases;

  /// No description provided for @csS4ChronicDiseaseType.
  ///
  /// In en, this message translates to:
  /// **'What type of chronic disease?'**
  String get csS4ChronicDiseaseType;

  /// No description provided for @csS4LabTests.
  ///
  /// In en, this message translates to:
  /// **'Did the mother undergo laboratory tests during pregnancy?'**
  String get csS4LabTests;

  /// No description provided for @csS4LabTestsType.
  ///
  /// In en, this message translates to:
  /// **'What type of lab test and during which pregnancy period?'**
  String get csS4LabTestsType;

  /// No description provided for @csS4LabTestsHint.
  ///
  /// In en, this message translates to:
  /// **'Enter type of test and pregnancy period'**
  String get csS4LabTestsHint;

  /// No description provided for @csS4StabilizingMedication.
  ///
  /// In en, this message translates to:
  /// **'Did the mother take pregnancy-stabilizing medications?'**
  String get csS4StabilizingMedication;

  /// No description provided for @csS4TotalPregnancies.
  ///
  /// In en, this message translates to:
  /// **'How many pregnancies has the mother had?'**
  String get csS4TotalPregnancies;

  /// No description provided for @csS4TotalPregnanciesHint.
  ///
  /// In en, this message translates to:
  /// **'Enter number of pregnancies'**
  String get csS4TotalPregnanciesHint;

  /// No description provided for @csS4HadMiscarriage.
  ///
  /// In en, this message translates to:
  /// **'Has she had a miscarriage before?'**
  String get csS4HadMiscarriage;

  /// No description provided for @csS4ExposedToSmoking.
  ///
  /// In en, this message translates to:
  /// **'Was the mother exposed to smoking during pregnancy?'**
  String get csS4ExposedToSmoking;

  /// No description provided for @csS4DiseaseTypeHint.
  ///
  /// In en, this message translates to:
  /// **'Enter type of disease'**
  String get csS4DiseaseTypeHint;

  /// No description provided for @csSection5Title.
  ///
  /// In en, this message translates to:
  /// **'Medical Information and Birth History'**
  String get csSection5Title;

  /// No description provided for @csSection5Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Birth Period'**
  String get csSection5Subtitle;

  /// No description provided for @csS5BirthType.
  ///
  /// In en, this message translates to:
  /// **'Was the birth natural or caesarean?'**
  String get csS5BirthType;

  /// No description provided for @csS5BirthTypeNatural.
  ///
  /// In en, this message translates to:
  /// **'Natural'**
  String get csS5BirthTypeNatural;

  /// No description provided for @csS5BirthTypeCesarean.
  ///
  /// In en, this message translates to:
  /// **'Caesarean'**
  String get csS5BirthTypeCesarean;

  /// No description provided for @csS5BirthPlace.
  ///
  /// In en, this message translates to:
  /// **'Was the birth at home or hospital?'**
  String get csS5BirthPlace;

  /// No description provided for @csS5BirthPlaceHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get csS5BirthPlaceHome;

  /// No description provided for @csS5BirthPlaceHospital.
  ///
  /// In en, this message translates to:
  /// **'Hospital'**
  String get csS5BirthPlaceHospital;

  /// No description provided for @csS5UsedBirthTools.
  ///
  /// In en, this message translates to:
  /// **'Were birth tools used (forceps/suction) during delivery?'**
  String get csS5UsedBirthTools;

  /// No description provided for @csS5TookDeliveryMedication.
  ///
  /// In en, this message translates to:
  /// **'Did the mother take medication or aid for delivery?'**
  String get csS5TookDeliveryMedication;

  /// No description provided for @csS5OxygenDeficiency.
  ///
  /// In en, this message translates to:
  /// **'Was the mother exposed to oxygen deficiency for the fetus during delivery?'**
  String get csS5OxygenDeficiency;

  /// No description provided for @csS5UmbilicalCordWrapped.
  ///
  /// In en, this message translates to:
  /// **'Did the umbilical cord wrap around the fetus?'**
  String get csS5UmbilicalCordWrapped;

  /// No description provided for @csS5BreechPosition.
  ///
  /// In en, this message translates to:
  /// **'Was the fetus in breech position?'**
  String get csS5BreechPosition;

  /// No description provided for @csS5BreechDurationLabel.
  ///
  /// In en, this message translates to:
  /// **'How long did the breech position last?'**
  String get csS5BreechDurationLabel;

  /// No description provided for @csS5BreechDurationHint.
  ///
  /// In en, this message translates to:
  /// **'Enter duration of breech position'**
  String get csS5BreechDurationHint;

  /// No description provided for @csS5HadJaundice.
  ///
  /// In en, this message translates to:
  /// **'Was the child infected with jaundice/yellowing?'**
  String get csS5HadJaundice;

  /// No description provided for @csS5HadCongenitalDeformities.
  ///
  /// In en, this message translates to:
  /// **'Did the child suffer from congenital deformities?'**
  String get csS5HadCongenitalDeformities;

  /// No description provided for @csS5CongenitalDeformitiesType.
  ///
  /// In en, this message translates to:
  /// **'What are these congenital deformities?'**
  String get csS5CongenitalDeformitiesType;

  /// No description provided for @csS5CongenitalDeformitiesHint.
  ///
  /// In en, this message translates to:
  /// **'Enter type of deformities'**
  String get csS5CongenitalDeformitiesHint;

  /// No description provided for @csS5BirthWeight.
  ///
  /// In en, this message translates to:
  /// **'What was the fetus weight at birth?'**
  String get csS5BirthWeight;

  /// No description provided for @csS5BirthWeightHint.
  ///
  /// In en, this message translates to:
  /// **'Enter child\'s birth weight'**
  String get csS5BirthWeightHint;

  /// No description provided for @csS5HadRhTest.
  ///
  /// In en, this message translates to:
  /// **'Was the RH factor test performed?'**
  String get csS5HadRhTest;

  /// No description provided for @csSection6Title.
  ///
  /// In en, this message translates to:
  /// **'Medical Information and Birth History'**
  String get csSection6Title;

  /// No description provided for @csSection6Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Post-Birth Period'**
  String get csSection6Subtitle;

  /// No description provided for @csS6BreastfeedingType.
  ///
  /// In en, this message translates to:
  /// **'Was breastfeeding natural, artificial, or both?'**
  String get csS6BreastfeedingType;

  /// No description provided for @csS6BreastfeedingNatural.
  ///
  /// In en, this message translates to:
  /// **'Natural'**
  String get csS6BreastfeedingNatural;

  /// No description provided for @csS6BreastfeedingArtificial.
  ///
  /// In en, this message translates to:
  /// **'Artificial'**
  String get csS6BreastfeedingArtificial;

  /// No description provided for @csS6BreastfeedingBoth.
  ///
  /// In en, this message translates to:
  /// **'Both'**
  String get csS6BreastfeedingBoth;

  /// No description provided for @csS6Diseases.
  ///
  /// In en, this message translates to:
  /// **'Was the child infected with any of the following diseases?'**
  String get csS6Diseases;

  /// No description provided for @csS6Meningitis.
  ///
  /// In en, this message translates to:
  /// **'Meningitis'**
  String get csS6Meningitis;

  /// No description provided for @csS6Measles.
  ///
  /// In en, this message translates to:
  /// **'Measles'**
  String get csS6Measles;

  /// No description provided for @csS6Chickenpox.
  ///
  /// In en, this message translates to:
  /// **'Chickenpox'**
  String get csS6Chickenpox;

  /// No description provided for @csS6Mumps.
  ///
  /// In en, this message translates to:
  /// **'Mumps'**
  String get csS6Mumps;

  /// No description provided for @csS6TookLongTermMedication.
  ///
  /// In en, this message translates to:
  /// **'Did the child take any medications or treatments for a long time?'**
  String get csS6TookLongTermMedication;

  /// No description provided for @csS6MedicationType.
  ///
  /// In en, this message translates to:
  /// **'What type of medications?'**
  String get csS6MedicationType;

  /// No description provided for @csS6MedicationTypeHint.
  ///
  /// In en, this message translates to:
  /// **'Enter type of medications'**
  String get csS6MedicationTypeHint;

  /// No description provided for @csS6HadFallsOrAccidents.
  ///
  /// In en, this message translates to:
  /// **'Was the child hit with falls or accidents?'**
  String get csS6HadFallsOrAccidents;

  /// No description provided for @csS6HadHipDislocationExam.
  ///
  /// In en, this message translates to:
  /// **'Was a hip dislocation exam done?'**
  String get csS6HadHipDislocationExam;

  /// No description provided for @csS6HasChronicDiseases.
  ///
  /// In en, this message translates to:
  /// **'Does the child suffer from chronic diseases?'**
  String get csS6HasChronicDiseases;

  /// No description provided for @csS6ChronicDiseaseType.
  ///
  /// In en, this message translates to:
  /// **'What type of chronic disease does the child suffer from?'**
  String get csS6ChronicDiseaseType;

  /// No description provided for @csS6ChronicDiseaseHint.
  ///
  /// In en, this message translates to:
  /// **'Enter type of disease'**
  String get csS6ChronicDiseaseHint;

  /// No description provided for @csS6AteWell.
  ///
  /// In en, this message translates to:
  /// **'Was the child eating well?'**
  String get csS6AteWell;

  /// No description provided for @csS6HospitalizedBefore.
  ///
  /// In en, this message translates to:
  /// **'Did the child ever go to hospital?'**
  String get csS6HospitalizedBefore;

  /// No description provided for @csS6SurgicalOperations.
  ///
  /// In en, this message translates to:
  /// **'What surgical operations were done?'**
  String get csS6SurgicalOperations;

  /// No description provided for @csS6SurgicalOperationsHint.
  ///
  /// In en, this message translates to:
  /// **'Enter type of operation'**
  String get csS6SurgicalOperationsHint;

  /// No description provided for @csSection7Title.
  ///
  /// In en, this message translates to:
  /// **'Behavioral Issues'**
  String get csSection7Title;

  /// No description provided for @csS7BehaviorsQuestion.
  ///
  /// In en, this message translates to:
  /// **'Did you notice any of the following behaviors during the child\'s early childhood?'**
  String get csS7BehaviorsQuestion;

  /// No description provided for @csS7ThumbSucking.
  ///
  /// In en, this message translates to:
  /// **'Thumb Sucking'**
  String get csS7ThumbSucking;

  /// No description provided for @csS7NailBiting.
  ///
  /// In en, this message translates to:
  /// **'Nail Biting'**
  String get csS7NailBiting;

  /// No description provided for @csS7Bedwetting.
  ///
  /// In en, this message translates to:
  /// **'Bedwetting'**
  String get csS7Bedwetting;

  /// No description provided for @csS7FoodAversion.
  ///
  /// In en, this message translates to:
  /// **'Food Aversion'**
  String get csS7FoodAversion;

  /// No description provided for @csS7SleepDisorder.
  ///
  /// In en, this message translates to:
  /// **'Sleep Disorder'**
  String get csS7SleepDisorder;

  /// No description provided for @csS7ContinuousCrying.
  ///
  /// In en, this message translates to:
  /// **'Continuous Crying'**
  String get csS7ContinuousCrying;

  /// No description provided for @csS7Daydreaming.
  ///
  /// In en, this message translates to:
  /// **'Daydreaming'**
  String get csS7Daydreaming;

  /// No description provided for @csS7AngerAttacks.
  ///
  /// In en, this message translates to:
  /// **'Anger Attacks'**
  String get csS7AngerAttacks;

  /// No description provided for @csS7Aggression.
  ///
  /// In en, this message translates to:
  /// **'Aggression: Hitting/Biting/Cursing'**
  String get csS7Aggression;

  /// No description provided for @csS7DestroyingObjects.
  ///
  /// In en, this message translates to:
  /// **'Destroying Objects'**
  String get csS7DestroyingObjects;

  /// No description provided for @csS7EpilepticSeizures.
  ///
  /// In en, this message translates to:
  /// **'Epileptic Seizures'**
  String get csS7EpilepticSeizures;

  /// No description provided for @csS7SpeechDifficulties.
  ///
  /// In en, this message translates to:
  /// **'Speech & Language Difficulties'**
  String get csS7SpeechDifficulties;

  /// No description provided for @csS7VaccinesQuestion.
  ///
  /// In en, this message translates to:
  /// **'Did the child receive the following vaccines?'**
  String get csS7VaccinesQuestion;

  /// No description provided for @csS7VaccineTriple.
  ///
  /// In en, this message translates to:
  /// **'Triple + Quadruple + Quintuple'**
  String get csS7VaccineTriple;

  /// No description provided for @csS7VaccinePolio.
  ///
  /// In en, this message translates to:
  /// **'Polio'**
  String get csS7VaccinePolio;

  /// No description provided for @csS7VaccineTuberculosis.
  ///
  /// In en, this message translates to:
  /// **'Tuberculosis'**
  String get csS7VaccineTuberculosis;

  /// No description provided for @csS7VaccineMeasles.
  ///
  /// In en, this message translates to:
  /// **'Measles'**
  String get csS7VaccineMeasles;

  /// No description provided for @csS7VaccineGermanMeaslesMumps.
  ///
  /// In en, this message translates to:
  /// **'German Measles + Mumps'**
  String get csS7VaccineGermanMeaslesMumps;

  /// No description provided for @csS7VaccineHepatitisB.
  ///
  /// In en, this message translates to:
  /// **'Hepatitis B'**
  String get csS7VaccineHepatitisB;

  /// No description provided for @csSection8Title.
  ///
  /// In en, this message translates to:
  /// **'Developmental Growth'**
  String get csSection8Title;

  /// No description provided for @csSection8Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Motor & Physical Aspects'**
  String get csSection8Subtitle;

  /// No description provided for @csS8SatAtRightTime.
  ///
  /// In en, this message translates to:
  /// **'Did the child sit at the right time?'**
  String get csS8SatAtRightTime;

  /// No description provided for @csS8CrawledAtRightTime.
  ///
  /// In en, this message translates to:
  /// **'Did the child crawl at the right time?'**
  String get csS8CrawledAtRightTime;

  /// No description provided for @csS8WalkedAtRightTime.
  ///
  /// In en, this message translates to:
  /// **'Did the child walk at the right time?'**
  String get csS8WalkedAtRightTime;

  /// No description provided for @csS8TeethingAge.
  ///
  /// In en, this message translates to:
  /// **'At what age did the child start teething?'**
  String get csS8TeethingAge;

  /// No description provided for @csS8TeethingAgeHint.
  ///
  /// In en, this message translates to:
  /// **'Enter child\'s age'**
  String get csS8TeethingAgeHint;

  /// No description provided for @csS8DropsThings.
  ///
  /// In en, this message translates to:
  /// **'Does the child drop or knock over objects?'**
  String get csS8DropsThings;

  /// No description provided for @csS8HasMovementDifficulties.
  ///
  /// In en, this message translates to:
  /// **'Does the child have difficulty running, jumping, hopping, or climbing stairs alone?'**
  String get csS8HasMovementDifficulties;

  /// No description provided for @csS8IsConstantlyMoving.
  ///
  /// In en, this message translates to:
  /// **'Is the child constantly moving, with continuous movement?'**
  String get csS8IsConstantlyMoving;

  /// No description provided for @csS8HasVisualImpairment.
  ///
  /// In en, this message translates to:
  /// **'Does the child suffer from visual impairment?'**
  String get csS8HasVisualImpairment;

  /// No description provided for @csS8VisualImpairmentDegree.
  ///
  /// In en, this message translates to:
  /// **'What is the degree of visual impairment?'**
  String get csS8VisualImpairmentDegree;

  /// No description provided for @csS8VisualImpairmentHint.
  ///
  /// In en, this message translates to:
  /// **'Enter degree of impairment'**
  String get csS8VisualImpairmentHint;

  /// No description provided for @csS8HasEyeDiseases.
  ///
  /// In en, this message translates to:
  /// **'Does the child suffer from eye diseases?'**
  String get csS8HasEyeDiseases;

  /// No description provided for @csS8EyeDiseasesType.
  ///
  /// In en, this message translates to:
  /// **'What are the eye diseases?'**
  String get csS8EyeDiseasesType;

  /// No description provided for @csS8EyeDiseasesHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the diseases'**
  String get csS8EyeDiseasesHint;

  /// No description provided for @csS8HasHearingImpairment.
  ///
  /// In en, this message translates to:
  /// **'Does the child have hearing impairment?'**
  String get csS8HasHearingImpairment;

  /// No description provided for @csS8HearingImpairmentDegree.
  ///
  /// In en, this message translates to:
  /// **'What is the degree of hearing impairment?'**
  String get csS8HearingImpairmentDegree;

  /// No description provided for @csS8HearingImpairmentHint.
  ///
  /// In en, this message translates to:
  /// **'Enter degree of impairment'**
  String get csS8HearingImpairmentHint;

  /// No description provided for @csS8HasEarDiseases.
  ///
  /// In en, this message translates to:
  /// **'Does the child have ear diseases?'**
  String get csS8HasEarDiseases;

  /// No description provided for @csS8EarDiseasesType.
  ///
  /// In en, this message translates to:
  /// **'What are the ear diseases?'**
  String get csS8EarDiseasesType;

  /// No description provided for @csS8EarDiseasesHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the diseases'**
  String get csS8EarDiseasesHint;

  /// No description provided for @csS8HasAllergies.
  ///
  /// In en, this message translates to:
  /// **'Does the child suffer from allergies?'**
  String get csS8HasAllergies;

  /// No description provided for @csS8AllergyType.
  ///
  /// In en, this message translates to:
  /// **'What type of allergy?'**
  String get csS8AllergyType;

  /// No description provided for @csS8AllergyFood.
  ///
  /// In en, this message translates to:
  /// **'Food Allergy'**
  String get csS8AllergyFood;

  /// No description provided for @csS8AllergyEnvironmental.
  ///
  /// In en, this message translates to:
  /// **'Environmental Allergy'**
  String get csS8AllergyEnvironmental;

  /// No description provided for @csS8AllergyTriggers.
  ///
  /// In en, this message translates to:
  /// **'What triggers the child\'s allergies?'**
  String get csS8AllergyTriggers;

  /// No description provided for @csS8AllergyTriggersHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the triggers'**
  String get csS8AllergyTriggersHint;

  /// No description provided for @csSection9Title.
  ///
  /// In en, this message translates to:
  /// **'Developmental Growth'**
  String get csSection9Title;

  /// No description provided for @csSection9Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Language Aspects'**
  String get csSection9Subtitle;

  /// No description provided for @csS9SpeechUnderstoodByMother.
  ///
  /// In en, this message translates to:
  /// **'Was the child\'s speech understood when speaking with the mother?'**
  String get csS9SpeechUnderstoodByMother;

  /// No description provided for @csS9HasStuttering.
  ///
  /// In en, this message translates to:
  /// **'Does the child have stuttering in speech?'**
  String get csS9HasStuttering;

  /// No description provided for @csS9HasLetterSubstitution.
  ///
  /// In en, this message translates to:
  /// **'Does the child substitute some letters?'**
  String get csS9HasLetterSubstitution;

  /// No description provided for @csS9SubstitutedLetters.
  ///
  /// In en, this message translates to:
  /// **'What are the letters the child substitutes?'**
  String get csS9SubstitutedLetters;

  /// No description provided for @csS9SubstitutedLettersHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the substituted letters'**
  String get csS9SubstitutedLettersHint;

  /// No description provided for @csS9SpeaksUnintelligibly.
  ///
  /// In en, this message translates to:
  /// **'Does the child sometimes speak unintelligibly?'**
  String get csS9SpeaksUnintelligibly;

  /// No description provided for @csS9HasPronunciationDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Does the child have difficulty pronouncing some letters and words?'**
  String get csS9HasPronunciationDifficulty;

  /// No description provided for @csS9DifficultLettersAndWords.
  ///
  /// In en, this message translates to:
  /// **'What letters and words does the child have difficulty pronouncing?'**
  String get csS9DifficultLettersAndWords;

  /// No description provided for @csS9DifficultLettersHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the letters and words'**
  String get csS9DifficultLettersHint;

  /// No description provided for @csS9LanguageLikeAgePeers.
  ///
  /// In en, this message translates to:
  /// **'Is the child\'s language like that of peers their age?'**
  String get csS9LanguageLikeAgePeers;

  /// No description provided for @csSection10Title.
  ///
  /// In en, this message translates to:
  /// **'Developmental Growth'**
  String get csSection10Title;

  /// No description provided for @csSection10Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Cognitive Aspects'**
  String get csSection10Subtitle;

  /// No description provided for @csS10FollowsInstructions.
  ///
  /// In en, this message translates to:
  /// **'Does the child follow instructions when assigned a task?'**
  String get csS10FollowsInstructions;

  /// No description provided for @csS10CompletesAssignedTasks.
  ///
  /// In en, this message translates to:
  /// **'Does the child complete the task requested of them?'**
  String get csS10CompletesAssignedTasks;

  /// No description provided for @csS10UnderstandsInstructions.
  ///
  /// In en, this message translates to:
  /// **'Does the child understand what is said or requested of them?'**
  String get csS10UnderstandsInstructions;

  /// No description provided for @csS10UnderstandsAlways.
  ///
  /// In en, this message translates to:
  /// **'Always'**
  String get csS10UnderstandsAlways;

  /// No description provided for @csS10UnderstandsSometimes.
  ///
  /// In en, this message translates to:
  /// **'Sometimes'**
  String get csS10UnderstandsSometimes;

  /// No description provided for @csS10UnderstandsRarely.
  ///
  /// In en, this message translates to:
  /// **'Rarely'**
  String get csS10UnderstandsRarely;

  /// No description provided for @csS10HasMemoryDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Does the child have difficulty remembering things and information?'**
  String get csS10HasMemoryDifficulty;

  /// No description provided for @csS10HasNamingDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Does the child have difficulty naming familiar objects?'**
  String get csS10HasNamingDifficulty;

  /// No description provided for @csS10IsImpulsive.
  ///
  /// In en, this message translates to:
  /// **'Is the child impulsive (acts without thinking about consequences)?'**
  String get csS10IsImpulsive;

  /// No description provided for @csS10ConcentrationLevel.
  ///
  /// In en, this message translates to:
  /// **'What is the child\'s ability to concentrate and pay attention?'**
  String get csS10ConcentrationLevel;

  /// No description provided for @csS10ConcentrationGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get csS10ConcentrationGood;

  /// No description provided for @csS10ConcentrationAverage.
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get csS10ConcentrationAverage;

  /// No description provided for @csS10ConcentrationWeak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get csS10ConcentrationWeak;

  /// No description provided for @csSection11Title.
  ///
  /// In en, this message translates to:
  /// **'Developmental Growth'**
  String get csSection11Title;

  /// No description provided for @csSection11Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Social Aspects'**
  String get csSection11Subtitle;

  /// No description provided for @csS11IsQuickToAnger.
  ///
  /// In en, this message translates to:
  /// **'Is the child quick to anger and irritability?'**
  String get csS11IsQuickToAnger;

  /// No description provided for @csS11DestroysPlaythings.
  ///
  /// In en, this message translates to:
  /// **'Does the child destroy toys, tools, and objects?'**
  String get csS11DestroysPlaythings;

  /// No description provided for @csS11IsStubborn.
  ///
  /// In en, this message translates to:
  /// **'Is the child stubborn and uncooperative?'**
  String get csS11IsStubborn;

  /// No description provided for @csS11IsAggressive.
  ///
  /// In en, this message translates to:
  /// **'Is the child aggressive by nature with others?'**
  String get csS11IsAggressive;

  /// No description provided for @csS11CanPlayCalmly.
  ///
  /// In en, this message translates to:
  /// **'Is the child able to play calmly?'**
  String get csS11CanPlayCalmly;

  /// No description provided for @csS11AttacksSiblings.
  ///
  /// In en, this message translates to:
  /// **'Does the child attack their siblings?'**
  String get csS11AttacksSiblings;

  /// No description provided for @csS11IsPopularWithPeers.
  ///
  /// In en, this message translates to:
  /// **'Is the child popular with classmates and neighbors?'**
  String get csS11IsPopularWithPeers;

  /// No description provided for @csS11BehaviorDuringVisits.
  ///
  /// In en, this message translates to:
  /// **'How is the child\'s behavior and conduct when visiting others?'**
  String get csS11BehaviorDuringVisits;

  /// No description provided for @csS11BehaviorDuringVisitsHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the child\'s behavior'**
  String get csS11BehaviorDuringVisitsHint;

  /// No description provided for @csS11SocialMaturityLikeAgePeers.
  ///
  /// In en, this message translates to:
  /// **'Is the child\'s social maturity at the level of their age peers?'**
  String get csS11SocialMaturityLikeAgePeers;

  /// No description provided for @csSection12Title.
  ///
  /// In en, this message translates to:
  /// **'Developmental Growth'**
  String get csSection12Title;

  /// No description provided for @csSection12Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Educational Aspects'**
  String get csSection12Subtitle;

  /// No description provided for @csS12LearningReadiness.
  ///
  /// In en, this message translates to:
  /// **'What is the child\'s learning readiness level?'**
  String get csS12LearningReadiness;

  /// No description provided for @csS12LearningGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get csS12LearningGood;

  /// No description provided for @csS12LearningAverage.
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get csS12LearningAverage;

  /// No description provided for @csS12LearningWeak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get csS12LearningWeak;

  /// No description provided for @csS12AbsentFromCenter.
  ///
  /// In en, this message translates to:
  /// **'Was the child absent from the center?'**
  String get csS12AbsentFromCenter;

  /// No description provided for @csS12AbsenceDuration.
  ///
  /// In en, this message translates to:
  /// **'How long was the child absent from the center?'**
  String get csS12AbsenceDuration;

  /// No description provided for @csS12AbsenceDurationHint.
  ///
  /// In en, this message translates to:
  /// **'Enter duration of absence'**
  String get csS12AbsenceDurationHint;

  /// No description provided for @csS12AbsenceReason.
  ///
  /// In en, this message translates to:
  /// **'What was the reason for the child\'s absence?'**
  String get csS12AbsenceReason;

  /// No description provided for @csS12AbsenceReasonHint.
  ///
  /// In en, this message translates to:
  /// **'Enter reason for absence'**
  String get csS12AbsenceReasonHint;

  /// No description provided for @csS12ParticipatesInActivities.
  ///
  /// In en, this message translates to:
  /// **'Did the child participate in extracurricular activities at the center?'**
  String get csS12ParticipatesInActivities;

  /// No description provided for @csS12LikesCenter.
  ///
  /// In en, this message translates to:
  /// **'Does the child like the center?'**
  String get csS12LikesCenter;

  /// No description provided for @csS12TiresFastInClass.
  ///
  /// In en, this message translates to:
  /// **'Does the child tire quickly in class?'**
  String get csS12TiresFastInClass;

  /// No description provided for @csS12TeacherRelationship.
  ///
  /// In en, this message translates to:
  /// **'Relationship with the teacher?'**
  String get csS12TeacherRelationship;

  /// No description provided for @csS12PeersRelationship.
  ///
  /// In en, this message translates to:
  /// **'Relationship with classmates?'**
  String get csS12PeersRelationship;

  /// No description provided for @csS12RelationshipGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get csS12RelationshipGood;

  /// No description provided for @csS12RelationshipBad.
  ///
  /// In en, this message translates to:
  /// **'Bad'**
  String get csS12RelationshipBad;

  /// No description provided for @csS12ComprehensionLevel.
  ///
  /// In en, this message translates to:
  /// **'Comprehension test: Level of understanding?'**
  String get csS12ComprehensionLevel;

  /// No description provided for @csS12ComprehensionGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get csS12ComprehensionGood;

  /// No description provided for @csS12ComprehensionAverage.
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get csS12ComprehensionAverage;

  /// No description provided for @csS12ComprehensionWeak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get csS12ComprehensionWeak;

  /// No description provided for @csS12ComprehensionNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get csS12ComprehensionNone;

  /// No description provided for @csS12NameRecognition.
  ///
  /// In en, this message translates to:
  /// **'Name Recognition:'**
  String get csS12NameRecognition;

  /// No description provided for @csS12KnowsFriendsNames.
  ///
  /// In en, this message translates to:
  /// **'Friends\' names'**
  String get csS12KnowsFriendsNames;

  /// No description provided for @csS12KnowsTeachersNames.
  ///
  /// In en, this message translates to:
  /// **'Teachers\' names'**
  String get csS12KnowsTeachersNames;

  /// No description provided for @csS12KnowsClassChildren.
  ///
  /// In en, this message translates to:
  /// **'Class children'**
  String get csS12KnowsClassChildren;

  /// No description provided for @csS12ExpressionTest.
  ///
  /// In en, this message translates to:
  /// **'Expression Test:'**
  String get csS12ExpressionTest;

  /// No description provided for @csS12UsesSentences.
  ///
  /// In en, this message translates to:
  /// **'Using simple sentences'**
  String get csS12UsesSentences;

  /// No description provided for @csS12UsesVerbs.
  ///
  /// In en, this message translates to:
  /// **'Using verbs'**
  String get csS12UsesVerbs;

  /// No description provided for @csS12UsesConnectors.
  ///
  /// In en, this message translates to:
  /// **'Using connectors'**
  String get csS12UsesConnectors;

  /// No description provided for @csS12BodyAwareness.
  ///
  /// In en, this message translates to:
  /// **'Body Awareness Test:'**
  String get csS12BodyAwareness;

  /// No description provided for @csS12BodyImage.
  ///
  /// In en, this message translates to:
  /// **'Body image'**
  String get csS12BodyImage;

  /// No description provided for @csS12BodyDirection.
  ///
  /// In en, this message translates to:
  /// **'Body direction'**
  String get csS12BodyDirection;

  /// No description provided for @csS12AuditoryPerception.
  ///
  /// In en, this message translates to:
  /// **'Auditory Perception & Memory:'**
  String get csS12AuditoryPerception;

  /// No description provided for @csS12SoundDirection.
  ///
  /// In en, this message translates to:
  /// **'Sound direction'**
  String get csS12SoundDirection;

  /// No description provided for @csS12AnimalSounds.
  ///
  /// In en, this message translates to:
  /// **'Animal sound recognition'**
  String get csS12AnimalSounds;

  /// No description provided for @csS12VisualPerception.
  ///
  /// In en, this message translates to:
  /// **'Visual Perception & Memory:'**
  String get csS12VisualPerception;

  /// No description provided for @csS12RecognizesDifferences.
  ///
  /// In en, this message translates to:
  /// **'Recognizing differences'**
  String get csS12RecognizesDifferences;

  /// No description provided for @csS12RecognizesSimilarities.
  ///
  /// In en, this message translates to:
  /// **'Recognizing similarities'**
  String get csS12RecognizesSimilarities;

  /// No description provided for @csS12ColorConcept.
  ///
  /// In en, this message translates to:
  /// **'Color concept'**
  String get csS12ColorConcept;

  /// No description provided for @csS12ShapeConcept.
  ///
  /// In en, this message translates to:
  /// **'Shape concept'**
  String get csS12ShapeConcept;

  /// No description provided for @csSection13Title.
  ///
  /// In en, this message translates to:
  /// **'Developmental Growth'**
  String get csSection13Title;

  /// No description provided for @csSection13Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Self-Care Aspects'**
  String get csSection13Subtitle;

  /// No description provided for @csS13UsesToiletProperly.
  ///
  /// In en, this message translates to:
  /// **'Does the child use the toilet properly?'**
  String get csS13UsesToiletProperly;

  /// No description provided for @csS13BathesAlone.
  ///
  /// In en, this message translates to:
  /// **'Does the child bathe alone?'**
  String get csS13BathesAlone;

  /// No description provided for @csS13DressesAlone.
  ///
  /// In en, this message translates to:
  /// **'Does the child dress themselves alone?'**
  String get csS13DressesAlone;

  /// No description provided for @csS13UsesToothbrush.
  ///
  /// In en, this message translates to:
  /// **'Does the child use a toothbrush to clean their teeth?'**
  String get csS13UsesToothbrush;

  /// No description provided for @csS13WearsShoesAlone.
  ///
  /// In en, this message translates to:
  /// **'Does the child put on and tie their shoes alone?'**
  String get csS13WearsShoesAlone;

  /// No description provided for @csS13WashesFaceOnWaking.
  ///
  /// In en, this message translates to:
  /// **'Does the child wash their face upon waking?'**
  String get csS13WashesFaceOnWaking;

  /// No description provided for @csS13WashesHandsBeforeAfterEating.
  ///
  /// In en, this message translates to:
  /// **'Does the child wash their hands before and after eating?'**
  String get csS13WashesHandsBeforeAfterEating;

  /// No description provided for @csS13WashesFeetAfterPlay.
  ///
  /// In en, this message translates to:
  /// **'Does the child wash their feet after returning from the center or playing?'**
  String get csS13WashesFeetAfterPlay;

  /// No description provided for @parentRole.
  ///
  /// In en, this message translates to:
  /// **'Parent / Guardian'**
  String get parentRole;

  /// No description provided for @receptionistRole.
  ///
  /// In en, this message translates to:
  /// **'Receptionist'**
  String get receptionistRole;

  /// No description provided for @searchTherapist.
  ///
  /// In en, this message translates to:
  /// **'Search for a therapist...'**
  String get searchTherapist;

  /// No description provided for @therapistOf.
  ///
  /// In en, this message translates to:
  /// **'Therapist of {name}'**
  String therapistOf(String name);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
