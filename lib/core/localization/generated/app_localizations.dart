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
  /// **'Enter email address'**
  String get emailHint;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
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
  /// **'To document the child\'s case study accurately and comprehensively, please fill out all sections of the form carefully. You can fill out this form more than once.'**
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

  /// No description provided for @csChildInfoDisplaySection.
  ///
  /// In en, this message translates to:
  /// **'Child\'s Data'**
  String get csChildInfoDisplaySection;

  /// No description provided for @csReferenceNumber.
  ///
  /// In en, this message translates to:
  /// **'Reference File Number'**
  String get csReferenceNumber;

  /// No description provided for @csPrimaryLanguage.
  ///
  /// In en, this message translates to:
  /// **'Primary Language'**
  String get csPrimaryLanguage;

  /// No description provided for @csFullAddress.
  ///
  /// In en, this message translates to:
  /// **'Full Address'**
  String get csFullAddress;

  /// No description provided for @csCaregiverName.
  ///
  /// In en, this message translates to:
  /// **'Primary Caregiver Name'**
  String get csCaregiverName;

  /// No description provided for @csCaregiverRelationship.
  ///
  /// In en, this message translates to:
  /// **'Relationship'**
  String get csCaregiverRelationship;

  /// No description provided for @csPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get csPhoneNumber;

  /// No description provided for @csEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get csEmailAddress;

  /// No description provided for @csReferralInfoSection.
  ///
  /// In en, this message translates to:
  /// **'Referral Information'**
  String get csReferralInfoSection;

  /// No description provided for @csReferralSource.
  ///
  /// In en, this message translates to:
  /// **'Referral Source'**
  String get csReferralSource;

  /// No description provided for @csReferralSelf.
  ///
  /// In en, this message translates to:
  /// **'Self'**
  String get csReferralSelf;

  /// No description provided for @csReferralDoctor.
  ///
  /// In en, this message translates to:
  /// **'Doctor'**
  String get csReferralDoctor;

  /// No description provided for @csReferralSchool.
  ///
  /// In en, this message translates to:
  /// **'School'**
  String get csReferralSchool;

  /// No description provided for @csReferralOtherCenter.
  ///
  /// In en, this message translates to:
  /// **'Another Center'**
  String get csReferralOtherCenter;

  /// No description provided for @csReferralOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get csReferralOther;

  /// No description provided for @csReferralOtherNote.
  ///
  /// In en, this message translates to:
  /// **'(If other is selected)'**
  String get csReferralOtherNote;

  /// No description provided for @csReferralOtherHint.
  ///
  /// In en, this message translates to:
  /// **'Enter referral source'**
  String get csReferralOtherHint;

  /// No description provided for @csMainServiceReason.
  ///
  /// In en, this message translates to:
  /// **'Main Reason for Service Request'**
  String get csMainServiceReason;

  /// No description provided for @csMainServiceReasonHint.
  ///
  /// In en, this message translates to:
  /// **'Enter main reason for service request'**
  String get csMainServiceReasonHint;

  /// No description provided for @csChangeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get csChangeLanguage;

  /// No description provided for @csSection2Title.
  ///
  /// In en, this message translates to:
  /// **'Family and Guardianship Information'**
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

  /// No description provided for @csChildResidenceTitle.
  ///
  /// In en, this message translates to:
  /// **'Child\'s Residence and Time Percentage'**
  String get csChildResidenceTitle;

  /// No description provided for @csChildResidenceNote.
  ///
  /// In en, this message translates to:
  /// **'(If parents are not married)'**
  String get csChildResidenceNote;

  /// No description provided for @csFirstHome.
  ///
  /// In en, this message translates to:
  /// **'First Home'**
  String get csFirstHome;

  /// No description provided for @csFirstHomeHint.
  ///
  /// In en, this message translates to:
  /// **'Add home description and time percentage'**
  String get csFirstHomeHint;

  /// No description provided for @csFirstHomeOwner.
  ///
  /// In en, this message translates to:
  /// **'Parent/Guardian Name (First Home Owner)'**
  String get csFirstHomeOwner;

  /// No description provided for @csFirstHomeOwnerHint.
  ///
  /// In en, this message translates to:
  /// **'Enter first home owner\'s name'**
  String get csFirstHomeOwnerHint;

  /// No description provided for @csSecondHome.
  ///
  /// In en, this message translates to:
  /// **'Second Home'**
  String get csSecondHome;

  /// No description provided for @csSecondHomeHint.
  ///
  /// In en, this message translates to:
  /// **'Add home description and time percentage'**
  String get csSecondHomeHint;

  /// No description provided for @csSecondHomeOwner.
  ///
  /// In en, this message translates to:
  /// **'Parent/Guardian Name (Second Home Owner)'**
  String get csSecondHomeOwner;

  /// No description provided for @csSecondHomeOwnerHint.
  ///
  /// In en, this message translates to:
  /// **'Enter second home owner\'s name'**
  String get csSecondHomeOwnerHint;

  /// No description provided for @csMotherOccupation.
  ///
  /// In en, this message translates to:
  /// **'Mother\'s Occupation'**
  String get csMotherOccupation;

  /// No description provided for @csMotherOccupationHint.
  ///
  /// In en, this message translates to:
  /// **'Enter mother\'s occupation'**
  String get csMotherOccupationHint;

  /// No description provided for @csFatherOccupation.
  ///
  /// In en, this message translates to:
  /// **'Father\'s Occupation'**
  String get csFatherOccupation;

  /// No description provided for @csFatherOccupationHint.
  ///
  /// In en, this message translates to:
  /// **'Enter father\'s occupation'**
  String get csFatherOccupationHint;

  /// No description provided for @csDecisionMaker.
  ///
  /// In en, this message translates to:
  /// **'Who is Responsible for Medical, Educational and Personal Decisions for the Child'**
  String get csDecisionMaker;

  /// No description provided for @csDecisionBoth.
  ///
  /// In en, this message translates to:
  /// **'Both'**
  String get csDecisionBoth;

  /// No description provided for @csDecisionLegalGuardian.
  ///
  /// In en, this message translates to:
  /// **'Legal Guardian'**
  String get csDecisionLegalGuardian;

  /// No description provided for @csSeparationDecision.
  ///
  /// In en, this message translates to:
  /// **'In Case of Separation'**
  String get csSeparationDecision;

  /// No description provided for @csSeparationDecisionHint.
  ///
  /// In en, this message translates to:
  /// **'Mention who is responsible for the child\'s decisions'**
  String get csSeparationDecisionHint;

  /// No description provided for @csBothParentsAware.
  ///
  /// In en, this message translates to:
  /// **'Are Both Parents Aware of the Services Required at the Center'**
  String get csBothParentsAware;

  /// No description provided for @csFamilyMembersTitle.
  ///
  /// In en, this message translates to:
  /// **'Family Members and Residents'**
  String get csFamilyMembersTitle;

  /// No description provided for @csAddPerson.
  ///
  /// In en, this message translates to:
  /// **'Add Person'**
  String get csAddPerson;

  /// No description provided for @csMemberName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get csMemberName;

  /// No description provided for @csMemberNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter name'**
  String get csMemberNameHint;

  /// No description provided for @csMemberAge.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get csMemberAge;

  /// No description provided for @csMemberAgeHint.
  ///
  /// In en, this message translates to:
  /// **'Enter age'**
  String get csMemberAgeHint;

  /// No description provided for @csMemberRelationship.
  ///
  /// In en, this message translates to:
  /// **'Relationship'**
  String get csMemberRelationship;

  /// No description provided for @csMemberRelationshipHint.
  ///
  /// In en, this message translates to:
  /// **'Enter relationship'**
  String get csMemberRelationshipHint;

  /// No description provided for @csMemberResidence.
  ///
  /// In en, this message translates to:
  /// **'Place of Residence'**
  String get csMemberResidence;

  /// No description provided for @csResidenceHome1.
  ///
  /// In en, this message translates to:
  /// **'First Home'**
  String get csResidenceHome1;

  /// No description provided for @csResidenceHome2.
  ///
  /// In en, this message translates to:
  /// **'Second Home'**
  String get csResidenceHome2;

  /// No description provided for @csResidenceDoesNotLive.
  ///
  /// In en, this message translates to:
  /// **'Does Not Reside'**
  String get csResidenceDoesNotLive;

  /// No description provided for @csFamilyHealthHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Family Health and Psychological History'**
  String get csFamilyHealthHistoryTitle;

  /// No description provided for @csFamilyConditionFather.
  ///
  /// In en, this message translates to:
  /// **'Father'**
  String get csFamilyConditionFather;

  /// No description provided for @csFamilyConditionMother.
  ///
  /// In en, this message translates to:
  /// **'Mother'**
  String get csFamilyConditionMother;

  /// No description provided for @csFamilyConditionPaternalRel.
  ///
  /// In en, this message translates to:
  /// **'Paternal Relatives'**
  String get csFamilyConditionPaternalRel;

  /// No description provided for @csFamilyConditionOtherRel.
  ///
  /// In en, this message translates to:
  /// **'Other Relatives'**
  String get csFamilyConditionOtherRel;

  /// No description provided for @csFamilyConditionNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get csFamilyConditionNone;

  /// No description provided for @csFamilyConditionRelation.
  ///
  /// In en, this message translates to:
  /// **'Relationship'**
  String get csFamilyConditionRelation;

  /// No description provided for @csFamilyConditionRelationHint.
  ///
  /// In en, this message translates to:
  /// **'Enter relationship'**
  String get csFamilyConditionRelationHint;

  /// No description provided for @csAutismSpectrum.
  ///
  /// In en, this message translates to:
  /// **'Autism Spectrum'**
  String get csAutismSpectrum;

  /// No description provided for @csLanguageDelay.
  ///
  /// In en, this message translates to:
  /// **'Language Delay'**
  String get csLanguageDelay;

  /// No description provided for @csLearningDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Learning Difficulty'**
  String get csLearningDifficulty;

  /// No description provided for @csADHD.
  ///
  /// In en, this message translates to:
  /// **'Hyperactivity and Attention Deficit (ADHD)'**
  String get csADHD;

  /// No description provided for @csMoodDisorders.
  ///
  /// In en, this message translates to:
  /// **'Mood Disorders (Depression, Anxiety)'**
  String get csMoodDisorders;

  /// No description provided for @csSection3Title.
  ///
  /// In en, this message translates to:
  /// **'Pregnancy and Birth Information'**
  String get csSection3Title;

  /// No description provided for @csPregnancyBirthSubsection.
  ///
  /// In en, this message translates to:
  /// **'Pregnancy and Birth'**
  String get csPregnancyBirthSubsection;

  /// No description provided for @csLiveBirthCount.
  ///
  /// In en, this message translates to:
  /// **'Number of Pregnancies (Live Births)'**
  String get csLiveBirthCount;

  /// No description provided for @csLiveBirthCountHint.
  ///
  /// In en, this message translates to:
  /// **'Enter number of pregnancies'**
  String get csLiveBirthCountHint;

  /// No description provided for @csStillbirthCount.
  ///
  /// In en, this message translates to:
  /// **'Number of Pregnancies (Deaths)'**
  String get csStillbirthCount;

  /// No description provided for @csStillbirthCountHint.
  ///
  /// In en, this message translates to:
  /// **'Enter number of pregnancies'**
  String get csStillbirthCountHint;

  /// No description provided for @csMotherAgeAtBirth.
  ///
  /// In en, this message translates to:
  /// **'Mother\'s Age at Child\'s Birth'**
  String get csMotherAgeAtBirth;

  /// No description provided for @csMotherAgeAtBirthHint.
  ///
  /// In en, this message translates to:
  /// **'Enter mother\'s age'**
  String get csMotherAgeAtBirthHint;

  /// No description provided for @csFatherAgeAtBirth.
  ///
  /// In en, this message translates to:
  /// **'Father\'s Age at Child\'s Birth'**
  String get csFatherAgeAtBirth;

  /// No description provided for @csFatherAgeAtBirthHint.
  ///
  /// In en, this message translates to:
  /// **'Enter father\'s age'**
  String get csFatherAgeAtBirthHint;

  /// No description provided for @csParentKinship.
  ///
  /// In en, this message translates to:
  /// **'Degree of Kinship Between Parents'**
  String get csParentKinship;

  /// No description provided for @csKinshipFirst.
  ///
  /// In en, this message translates to:
  /// **'First Degree'**
  String get csKinshipFirst;

  /// No description provided for @csKinshipSecond.
  ///
  /// In en, this message translates to:
  /// **'Second Degree'**
  String get csKinshipSecond;

  /// No description provided for @csKinshipNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get csKinshipNone;

  /// No description provided for @csWasPregnancyPlanned.
  ///
  /// In en, this message translates to:
  /// **'Was the Pregnancy Planned'**
  String get csWasPregnancyPlanned;

  /// No description provided for @csUsedFertilityTreatment.
  ///
  /// In en, this message translates to:
  /// **'Were Fertility Treatments Used'**
  String get csUsedFertilityTreatment;

  /// No description provided for @csMedicationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Use of Medications/Supplements During Pregnancy'**
  String get csMedicationsTitle;

  /// No description provided for @csMedVitamins.
  ///
  /// In en, this message translates to:
  /// **'Vitamins'**
  String get csMedVitamins;

  /// No description provided for @csMedSupplements.
  ///
  /// In en, this message translates to:
  /// **'Supplements'**
  String get csMedSupplements;

  /// No description provided for @csMedAntidepressants.
  ///
  /// In en, this message translates to:
  /// **'Antidepressants'**
  String get csMedAntidepressants;

  /// No description provided for @csMedAntiSeizure.
  ///
  /// In en, this message translates to:
  /// **'Anti-Seizure'**
  String get csMedAntiSeizure;

  /// No description provided for @csMedOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get csMedOther;

  /// No description provided for @csMedUnsure.
  ///
  /// In en, this message translates to:
  /// **'Unsure'**
  String get csMedUnsure;

  /// No description provided for @csMedicationsOtherNote.
  ///
  /// In en, this message translates to:
  /// **'(If other is selected)'**
  String get csMedicationsOtherNote;

  /// No description provided for @csMedicationsOtherHint.
  ///
  /// In en, this message translates to:
  /// **'Enter medication types'**
  String get csMedicationsOtherHint;

  /// No description provided for @csPregnancyDifficultiesSection.
  ///
  /// In en, this message translates to:
  /// **'Difficulties During Pregnancy'**
  String get csPregnancyDifficultiesSection;

  /// No description provided for @csFeverInfection.
  ///
  /// In en, this message translates to:
  /// **'Fever/Infection'**
  String get csFeverInfection;

  /// No description provided for @csBleedingMiscarriage.
  ///
  /// In en, this message translates to:
  /// **'Bleeding/Threatened Miscarriage'**
  String get csBleedingMiscarriage;

  /// No description provided for @csHighBpDiabetes.
  ///
  /// In en, this message translates to:
  /// **'High Blood Pressure/Gestational Diabetes'**
  String get csHighBpDiabetes;

  /// No description provided for @csSevereStressAccidents.
  ///
  /// In en, this message translates to:
  /// **'Severe Stress/Accidents'**
  String get csSevereStressAccidents;

  /// No description provided for @csTriUnsure.
  ///
  /// In en, this message translates to:
  /// **'Unsure'**
  String get csTriUnsure;

  /// No description provided for @csLaborDeliverySection.
  ///
  /// In en, this message translates to:
  /// **'Labor and Delivery'**
  String get csLaborDeliverySection;

  /// No description provided for @csUsedPitocin.
  ///
  /// In en, this message translates to:
  /// **'Use of Stimulants (Pitocin)'**
  String get csUsedPitocin;

  /// No description provided for @csPrematureBirth.
  ///
  /// In en, this message translates to:
  /// **'Premature Birth'**
  String get csPrematureBirth;

  /// No description provided for @csPrematureWeeks.
  ///
  /// In en, this message translates to:
  /// **'Number of Weeks'**
  String get csPrematureWeeks;

  /// No description provided for @csPrematureWeeksHint.
  ///
  /// In en, this message translates to:
  /// **'Enter weeks'**
  String get csPrematureWeeksHint;

  /// No description provided for @csDeliveryComplications.
  ///
  /// In en, this message translates to:
  /// **'Complications (Breech, Cord Wrapped, Umbilical)'**
  String get csDeliveryComplications;

  /// No description provided for @csDeliveryComplicationsType.
  ///
  /// In en, this message translates to:
  /// **'Type of Complications'**
  String get csDeliveryComplicationsType;

  /// No description provided for @csDeliveryComplicationsHint.
  ///
  /// In en, this message translates to:
  /// **'Enter complications type'**
  String get csDeliveryComplicationsHint;

  /// No description provided for @csNICU.
  ///
  /// In en, this message translates to:
  /// **'NICU/Resuscitation'**
  String get csNICU;

  /// No description provided for @csNICUReason.
  ///
  /// In en, this message translates to:
  /// **'What is the Reason'**
  String get csNICUReason;

  /// No description provided for @csNICUReasonHint.
  ///
  /// In en, this message translates to:
  /// **'Enter NICU admission reason'**
  String get csNICUReasonHint;

  /// No description provided for @csNICUDuration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get csNICUDuration;

  /// No description provided for @csNICUDurationHint.
  ///
  /// In en, this message translates to:
  /// **'Duration of child\'s hospital stay'**
  String get csNICUDurationHint;

  /// No description provided for @csDeliveryType.
  ///
  /// In en, this message translates to:
  /// **'Type of Delivery'**
  String get csDeliveryType;

  /// No description provided for @csDeliveryNatural.
  ///
  /// In en, this message translates to:
  /// **'Natural'**
  String get csDeliveryNatural;

  /// No description provided for @csDeliveryCesarean.
  ///
  /// In en, this message translates to:
  /// **'Cesarean'**
  String get csDeliveryCesarean;

  /// No description provided for @csCesareanReason.
  ///
  /// In en, this message translates to:
  /// **'What is the Reason'**
  String get csCesareanReason;

  /// No description provided for @csCesareanReasonHint.
  ///
  /// In en, this message translates to:
  /// **'Reason for cesarean delivery'**
  String get csCesareanReasonHint;

  /// No description provided for @csFirstMonthProblems.
  ///
  /// In en, this message translates to:
  /// **'Problems in the First Month After Birth'**
  String get csFirstMonthProblems;

  /// No description provided for @csFirstMonthBreastfeeding.
  ///
  /// In en, this message translates to:
  /// **'Breastfeeding Difficulty'**
  String get csFirstMonthBreastfeeding;

  /// No description provided for @csFirstMonthSleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep Problems'**
  String get csFirstMonthSleep;

  /// No description provided for @csFirstMonthJaundice.
  ///
  /// In en, this message translates to:
  /// **'Jaundice'**
  String get csFirstMonthJaundice;

  /// No description provided for @csFirstMonthCongenital.
  ///
  /// In en, this message translates to:
  /// **'Congenital Defects'**
  String get csFirstMonthCongenital;

  /// No description provided for @csFirstMonthFainting.
  ///
  /// In en, this message translates to:
  /// **'Fainting/Loss of Consciousness'**
  String get csFirstMonthFainting;

  /// No description provided for @csFirstMonthCrying.
  ///
  /// In en, this message translates to:
  /// **'Excessive Crying'**
  String get csFirstMonthCrying;

  /// No description provided for @csFirstMonthDigestive.
  ///
  /// In en, this message translates to:
  /// **'Digestive Symptoms'**
  String get csFirstMonthDigestive;

  /// No description provided for @csFirstMonthReflux.
  ///
  /// In en, this message translates to:
  /// **'Reflux/Vomiting'**
  String get csFirstMonthReflux;

  /// No description provided for @csIfYes.
  ///
  /// In en, this message translates to:
  /// **'(If yes is selected)'**
  String get csIfYes;

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

  /// No description provided for @csSeparated.
  ///
  /// In en, this message translates to:
  /// **'Separated'**
  String get csSeparated;

  /// No description provided for @csDivorced.
  ///
  /// In en, this message translates to:
  /// **'Divorced'**
  String get csDivorced;

  /// No description provided for @csOneParentDeceased.
  ///
  /// In en, this message translates to:
  /// **'One Parent Deceased'**
  String get csOneParentDeceased;

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
  /// **'Communication, Language & Social Interaction'**
  String get csSection6Title;

  /// No description provided for @csS6CommMethodTitle.
  ///
  /// In en, this message translates to:
  /// **'Child\'s Basic Communication Method'**
  String get csS6CommMethodTitle;

  /// No description provided for @csS6CommMethodSingleWords.
  ///
  /// In en, this message translates to:
  /// **'Single words'**
  String get csS6CommMethodSingleWords;

  /// No description provided for @csS6CommMethodShortSentences.
  ///
  /// In en, this message translates to:
  /// **'Short sentences'**
  String get csS6CommMethodShortSentences;

  /// No description provided for @csS6CommMethodFullSentences.
  ///
  /// In en, this message translates to:
  /// **'Complete sentences'**
  String get csS6CommMethodFullSentences;

  /// No description provided for @csS6CommMethodSigns.
  ///
  /// In en, this message translates to:
  /// **'Signs'**
  String get csS6CommMethodSigns;

  /// No description provided for @csS6CommMethodPecs.
  ///
  /// In en, this message translates to:
  /// **'Pictures / PECS'**
  String get csS6CommMethodPecs;

  /// No description provided for @csS6CommMethodDevice.
  ///
  /// In en, this message translates to:
  /// **'Communication device'**
  String get csS6CommMethodDevice;

  /// No description provided for @csS6CommMethodManualPull.
  ///
  /// In en, this message translates to:
  /// **'Manual pulling'**
  String get csS6CommMethodManualPull;

  /// No description provided for @csS6CommMethodCrying.
  ///
  /// In en, this message translates to:
  /// **'Crying / behaviors'**
  String get csS6CommMethodCrying;

  /// No description provided for @csS6CommMethodOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get csS6CommMethodOther;

  /// No description provided for @csS6CommMethodOtherLabel.
  ///
  /// In en, this message translates to:
  /// **'What is the child\'s communication method?'**
  String get csS6CommMethodOtherLabel;

  /// No description provided for @csS6CommMethodOtherHint.
  ///
  /// In en, this message translates to:
  /// **'Enter communication method'**
  String get csS6CommMethodOtherHint;

  /// No description provided for @csS6CommMethodOtherNote.
  ///
  /// In en, this message translates to:
  /// **'(If the previous question answer is \"Other\")'**
  String get csS6CommMethodOtherNote;

  /// No description provided for @csS6ExprUnderstandTitle.
  ///
  /// In en, this message translates to:
  /// **'Ability to Express and Understand'**
  String get csS6ExprUnderstandTitle;

  /// No description provided for @csS6ExpressesNeeds.
  ///
  /// In en, this message translates to:
  /// **'Expressing needs'**
  String get csS6ExpressesNeeds;

  /// No description provided for @csS6RequestsPreferred.
  ///
  /// In en, this message translates to:
  /// **'Requesting preferred items'**
  String get csS6RequestsPreferred;

  /// No description provided for @csS6UnderstandsSimple.
  ///
  /// In en, this message translates to:
  /// **'Understanding simple instructions'**
  String get csS6UnderstandsSimple;

  /// No description provided for @csS6UnderstandsComplex.
  ///
  /// In en, this message translates to:
  /// **'Understanding complex instructions'**
  String get csS6UnderstandsComplex;

  /// No description provided for @csS6OptionYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get csS6OptionYes;

  /// No description provided for @csS6OptionSometimes.
  ///
  /// In en, this message translates to:
  /// **'Sometimes'**
  String get csS6OptionSometimes;

  /// No description provided for @csS6OptionNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get csS6OptionNo;

  /// No description provided for @csS6SocialCommTitle.
  ///
  /// In en, this message translates to:
  /// **'Social Communication'**
  String get csS6SocialCommTitle;

  /// No description provided for @csS6InitiatesInteraction.
  ///
  /// In en, this message translates to:
  /// **'Initiates interaction'**
  String get csS6InitiatesInteraction;

  /// No description provided for @csS6RespondsToOthers.
  ///
  /// In en, this message translates to:
  /// **'Responds to others'**
  String get csS6RespondsToOthers;

  /// No description provided for @csS6PrefersSoloPlay.
  ///
  /// In en, this message translates to:
  /// **'Prefers solo play'**
  String get csS6PrefersSoloPlay;

  /// No description provided for @csS6ImitatesOthers.
  ///
  /// In en, this message translates to:
  /// **'Imitates others'**
  String get csS6ImitatesOthers;

  /// No description provided for @csS6DifficultyPeers.
  ///
  /// In en, this message translates to:
  /// **'Difficulty playing with peers'**
  String get csS6DifficultyPeers;

  /// No description provided for @csS6DifficultyTurns.
  ///
  /// In en, this message translates to:
  /// **'Difficulty with turn-taking'**
  String get csS6DifficultyTurns;

  /// No description provided for @csS6CommNotes.
  ///
  /// In en, this message translates to:
  /// **'Additional notes about communication and social interaction'**
  String get csS6CommNotes;

  /// No description provided for @csS6CommNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Enter notes'**
  String get csS6CommNotesHint;

  /// No description provided for @csS6PragmaticTitle.
  ///
  /// In en, this message translates to:
  /// **'Evaluation of Social and Pragmatic Skills'**
  String get csS6PragmaticTitle;

  /// No description provided for @csS6InitiatesConversation.
  ///
  /// In en, this message translates to:
  /// **'Starting conversation with others'**
  String get csS6InitiatesConversation;

  /// No description provided for @csS6MaintainsEyeContact.
  ///
  /// In en, this message translates to:
  /// **'Maintaining eye contact'**
  String get csS6MaintainsEyeContact;

  /// No description provided for @csS6UnderstandsBodyLanguage.
  ///
  /// In en, this message translates to:
  /// **'Understanding body language and facial expressions'**
  String get csS6UnderstandsBodyLanguage;

  /// No description provided for @csS6UnderstandsJokes.
  ///
  /// In en, this message translates to:
  /// **'Understanding jokes or figurative speech'**
  String get csS6UnderstandsJokes;

  /// No description provided for @csS6ConversationTurnTaking.
  ///
  /// In en, this message translates to:
  /// **'Turn-taking in conversation'**
  String get csS6ConversationTurnTaking;

  /// No description provided for @csS6OptionAlways.
  ///
  /// In en, this message translates to:
  /// **'Always'**
  String get csS6OptionAlways;

  /// No description provided for @csS6OptionRarely.
  ///
  /// In en, this message translates to:
  /// **'Rarely'**
  String get csS6OptionRarely;

  /// No description provided for @csS6OptionGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get csS6OptionGood;

  /// No description provided for @csS6OptionAcceptable.
  ///
  /// In en, this message translates to:
  /// **'Acceptable'**
  String get csS6OptionAcceptable;

  /// No description provided for @csS6OptionWeak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get csS6OptionWeak;

  /// No description provided for @csS6OptionPartial.
  ///
  /// In en, this message translates to:
  /// **'Partially'**
  String get csS6OptionPartial;

  /// No description provided for @csS6OptionMastered.
  ///
  /// In en, this message translates to:
  /// **'Mastered'**
  String get csS6OptionMastered;

  /// No description provided for @csS6OptionInTraining.
  ///
  /// In en, this message translates to:
  /// **'In training'**
  String get csS6OptionInTraining;

  /// No description provided for @csS6OptionMissing.
  ///
  /// In en, this message translates to:
  /// **'Missing'**
  String get csS6OptionMissing;

  /// No description provided for @csSection7Title.
  ///
  /// In en, this message translates to:
  /// **'Daily Life Skills and Independence'**
  String get csSection7Title;

  /// No description provided for @csS7EatingTitle.
  ///
  /// In en, this message translates to:
  /// **'Eating and Drinking'**
  String get csS7EatingTitle;

  /// No description provided for @csS7UsesSpoonFork.
  ///
  /// In en, this message translates to:
  /// **'Uses spoon/fork'**
  String get csS7UsesSpoonFork;

  /// No description provided for @csS7SelectiveEater.
  ///
  /// In en, this message translates to:
  /// **'Selective in food'**
  String get csS7SelectiveEater;

  /// No description provided for @csS7UsesHandsForEating.
  ///
  /// In en, this message translates to:
  /// **'Uses hands for eating'**
  String get csS7UsesHandsForEating;

  /// No description provided for @csS7RefusesTextures.
  ///
  /// In en, this message translates to:
  /// **'Refuses certain textures'**
  String get csS7RefusesTextures;

  /// No description provided for @csS7DrinksFromCup.
  ///
  /// In en, this message translates to:
  /// **'Drinks from cup/straw'**
  String get csS7DrinksFromCup;

  /// No description provided for @csS7NeedsFullAssistance.
  ///
  /// In en, this message translates to:
  /// **'Needs full assistance'**
  String get csS7NeedsFullAssistance;

  /// No description provided for @csS7HowRequestsFoodLabel.
  ///
  /// In en, this message translates to:
  /// **'How does the child request food?'**
  String get csS7HowRequestsFoodLabel;

  /// No description provided for @csS7HowRequestsFoodHint.
  ///
  /// In en, this message translates to:
  /// **'Describe how the child requests food...'**
  String get csS7HowRequestsFoodHint;

  /// No description provided for @csS7DressingTitle.
  ///
  /// In en, this message translates to:
  /// **'Dressing'**
  String get csS7DressingTitle;

  /// No description provided for @csS7RemovesShoesSocks.
  ///
  /// In en, this message translates to:
  /// **'Removes shoes/socks'**
  String get csS7RemovesShoesSocks;

  /// No description provided for @csS7ClosesZipperButtons.
  ///
  /// In en, this message translates to:
  /// **'Closes zippers/buttons'**
  String get csS7ClosesZipperButtons;

  /// No description provided for @csS7DressesWithAssistance.
  ///
  /// In en, this message translates to:
  /// **'Dresses with assistance'**
  String get csS7DressesWithAssistance;

  /// No description provided for @csS7HygieneTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal Hygiene'**
  String get csS7HygieneTitle;

  /// No description provided for @csS7WashesHandsFace.
  ///
  /// In en, this message translates to:
  /// **'Washes hands/face'**
  String get csS7WashesHandsFace;

  /// No description provided for @csS7BathesAlone.
  ///
  /// In en, this message translates to:
  /// **'Bathes alone'**
  String get csS7BathesAlone;

  /// No description provided for @csS7CleansTeetHair.
  ///
  /// In en, this message translates to:
  /// **'Cleans teeth/hair'**
  String get csS7CleansTeetHair;

  /// No description provided for @csS7NailCuttingDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Nail cutting (difficult)'**
  String get csS7NailCuttingDifficulty;

  /// No description provided for @csS7BathroomSleepTitle.
  ///
  /// In en, this message translates to:
  /// **'Bathroom and Sleep'**
  String get csS7BathroomSleepTitle;

  /// No description provided for @csS7BathroomIndependenceLabel.
  ///
  /// In en, this message translates to:
  /// **'Bathroom independence'**
  String get csS7BathroomIndependenceLabel;

  /// No description provided for @csS7OptionFullyIndependent.
  ///
  /// In en, this message translates to:
  /// **'Fully independent'**
  String get csS7OptionFullyIndependent;

  /// No description provided for @csS7OptionCurrentlyTraining.
  ///
  /// In en, this message translates to:
  /// **'Currently training'**
  String get csS7OptionCurrentlyTraining;

  /// No description provided for @csS7OptionUsesDiapers.
  ///
  /// In en, this message translates to:
  /// **'Uses diapers'**
  String get csS7OptionUsesDiapers;

  /// No description provided for @csS7HowRequestsSleepLabel.
  ///
  /// In en, this message translates to:
  /// **'How does the child request sleep?'**
  String get csS7HowRequestsSleepLabel;

  /// No description provided for @csS7HowRequestsSleepHint.
  ///
  /// In en, this message translates to:
  /// **'Describe how the child requests sleep...'**
  String get csS7HowRequestsSleepHint;

  /// No description provided for @csSection8Title.
  ///
  /// In en, this message translates to:
  /// **'Sensory and Behavioral Profile'**
  String get csSection8Title;

  /// No description provided for @csS8ProblemBehaviorsTitle.
  ///
  /// In en, this message translates to:
  /// **'Problem Behaviors (Concerning)'**
  String get csS8ProblemBehaviorsTitle;

  /// No description provided for @csS8BehaviorDescHint.
  ///
  /// In en, this message translates to:
  /// **'Describe behaviors and frequency...'**
  String get csS8BehaviorDescHint;

  /// No description provided for @csS8Aggression.
  ///
  /// In en, this message translates to:
  /// **'Aggression toward others'**
  String get csS8Aggression;

  /// No description provided for @csS8SelfHarm.
  ///
  /// In en, this message translates to:
  /// **'Self-harm'**
  String get csS8SelfHarm;

  /// No description provided for @csS8StereotypicalBehaviors.
  ///
  /// In en, this message translates to:
  /// **'Stereotypical behaviors (flapping / spinning)'**
  String get csS8StereotypicalBehaviors;

  /// No description provided for @csS8ResistanceToChange.
  ///
  /// In en, this message translates to:
  /// **'Resistance to change / transition'**
  String get csS8ResistanceToChange;

  /// No description provided for @csS8ExcessiveAttachment.
  ///
  /// In en, this message translates to:
  /// **'Excessive attachment to specific objects'**
  String get csS8ExcessiveAttachment;

  /// No description provided for @csS8BehavioralPatternsTitle.
  ///
  /// In en, this message translates to:
  /// **'Useful and Repetitive Behavioral Patterns'**
  String get csS8BehavioralPatternsTitle;

  /// No description provided for @csS8PatternLabel.
  ///
  /// In en, this message translates to:
  /// **'Pattern'**
  String get csS8PatternLabel;

  /// No description provided for @csS8PatternHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the pattern...'**
  String get csS8PatternHint;

  /// No description provided for @csS8PracticesLabel.
  ///
  /// In en, this message translates to:
  /// **'Practices'**
  String get csS8PracticesLabel;

  /// No description provided for @csS8PracticesHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the practices...'**
  String get csS8PracticesHint;

  /// No description provided for @csS8ExpectedFunctionLabel.
  ///
  /// In en, this message translates to:
  /// **'Expected function'**
  String get csS8ExpectedFunctionLabel;

  /// No description provided for @csS8ExpectedFunctionHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the expected function...'**
  String get csS8ExpectedFunctionHint;

  /// No description provided for @csS8AddPattern.
  ///
  /// In en, this message translates to:
  /// **'Add another pattern'**
  String get csS8AddPattern;

  /// No description provided for @csS8SensoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Sensory Integration and Organization'**
  String get csS8SensoryTitle;

  /// No description provided for @csS8GeneralStateLabel.
  ///
  /// In en, this message translates to:
  /// **'General description (general state of attention activity)'**
  String get csS8GeneralStateLabel;

  /// No description provided for @csS8StateCalm.
  ///
  /// In en, this message translates to:
  /// **'Calm'**
  String get csS8StateCalm;

  /// No description provided for @csS8StateDistracted.
  ///
  /// In en, this message translates to:
  /// **'Distracted'**
  String get csS8StateDistracted;

  /// No description provided for @csS8StateVeryActive.
  ///
  /// In en, this message translates to:
  /// **'Very active'**
  String get csS8StateVeryActive;

  /// No description provided for @csS8StateFastTransition.
  ///
  /// In en, this message translates to:
  /// **'Fast transition'**
  String get csS8StateFastTransition;

  /// No description provided for @csS8StateAbnormal.
  ///
  /// In en, this message translates to:
  /// **'Abnormal'**
  String get csS8StateAbnormal;

  /// No description provided for @csS8GeneralStateNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the general state...'**
  String get csS8GeneralStateNotesHint;

  /// No description provided for @csS8SensoryInterestsLabel.
  ///
  /// In en, this message translates to:
  /// **'Special sensory interests'**
  String get csS8SensoryInterestsLabel;

  /// No description provided for @csS8HasSensoryIssues.
  ///
  /// In en, this message translates to:
  /// **'Does the child have problems with the senses?'**
  String get csS8HasSensoryIssues;

  /// No description provided for @csS8SensoryIssuesNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Add notes...'**
  String get csS8SensoryIssuesNotesHint;

  /// No description provided for @csS8HearingIssue.
  ///
  /// In en, this message translates to:
  /// **'Hearing (gain, loss)'**
  String get csS8HearingIssue;

  /// No description provided for @csS8TouchIssue.
  ///
  /// In en, this message translates to:
  /// **'Touch (sensitivity)'**
  String get csS8TouchIssue;

  /// No description provided for @csS8TasteIssue.
  ///
  /// In en, this message translates to:
  /// **'Taste (putting in mouth)'**
  String get csS8TasteIssue;

  /// No description provided for @csS8VestibularIssue.
  ///
  /// In en, this message translates to:
  /// **'Body position (sounds, spinning)'**
  String get csS8VestibularIssue;

  /// No description provided for @csS8VisualSensoryIssue.
  ///
  /// In en, this message translates to:
  /// **'Visual (colors, light)'**
  String get csS8VisualSensoryIssue;

  /// No description provided for @csS8SensoryNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Add notes...'**
  String get csS8SensoryNotesHint;

  /// No description provided for @csS8SensoryReactionLabel.
  ///
  /// In en, this message translates to:
  /// **'Child\'s reaction to sensory stimuli'**
  String get csS8SensoryReactionLabel;

  /// No description provided for @csS8SensoryReactionHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the child\'s reaction...'**
  String get csS8SensoryReactionHint;

  /// No description provided for @csS8SocialBehaviorsTitle.
  ///
  /// In en, this message translates to:
  /// **'Social Behaviors'**
  String get csS8SocialBehaviorsTitle;

  /// No description provided for @csS8MakesFriendsEasily.
  ///
  /// In en, this message translates to:
  /// **'Does the child make friends easily?'**
  String get csS8MakesFriendsEasily;

  /// No description provided for @csS8MakesFriendsNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Describe...'**
  String get csS8MakesFriendsNotesHint;

  /// No description provided for @csS8SharesInterests.
  ///
  /// In en, this message translates to:
  /// **'Does the child share social skills or interests?'**
  String get csS8SharesInterests;

  /// No description provided for @csS8SharesInterestsNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Describe...'**
  String get csS8SharesInterestsNotesHint;

  /// No description provided for @csS8AbuseExposure.
  ///
  /// In en, this message translates to:
  /// **'Has the child been exposed to any form of abuse, physical insult, or domestic violence?'**
  String get csS8AbuseExposure;

  /// No description provided for @csS8AbuseWitnessed.
  ///
  /// In en, this message translates to:
  /// **'Yes, witnessed behavior before avoiding'**
  String get csS8AbuseWitnessed;

  /// No description provided for @csS8AbuseNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Describe...'**
  String get csS8AbuseNotesHint;

  /// No description provided for @csS8HasSignificantSocialEvent.
  ///
  /// In en, this message translates to:
  /// **'Has the child been exposed to a major life event (such as abuse or personal friendship loss)?'**
  String get csS8HasSignificantSocialEvent;

  /// No description provided for @csS8SignificantSocialEventNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Describe...'**
  String get csS8SignificantSocialEventNotesHint;

  /// No description provided for @csS8ReactionToNegativeBehavior.
  ///
  /// In en, this message translates to:
  /// **'What is the child\'s reaction to others\' negative behavior?'**
  String get csS8ReactionToNegativeBehavior;

  /// No description provided for @csS8ReactionToNegativeBehaviorHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the reaction...'**
  String get csS8ReactionToNegativeBehaviorHint;

  /// No description provided for @csSection9Title.
  ///
  /// In en, this message translates to:
  /// **'Capabilities, Strengths, and Interests'**
  String get csSection9Title;

  /// No description provided for @csS9ObservedStrengthsLabel.
  ///
  /// In en, this message translates to:
  /// **'Observed Strengths'**
  String get csS9ObservedStrengthsLabel;

  /// No description provided for @csS9ObservedStrengthsHint.
  ///
  /// In en, this message translates to:
  /// **'Describe observed strengths...'**
  String get csS9ObservedStrengthsHint;

  /// No description provided for @csS9PreferredActivitiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Preferred Activities / Reinforcers'**
  String get csS9PreferredActivitiesTitle;

  /// No description provided for @csS9ActivitySensoryGames.
  ///
  /// In en, this message translates to:
  /// **'Sensory games'**
  String get csS9ActivitySensoryGames;

  /// No description provided for @csS9ActivityElectronics.
  ///
  /// In en, this message translates to:
  /// **'Electronics'**
  String get csS9ActivityElectronics;

  /// No description provided for @csS9ActivityMotor.
  ///
  /// In en, this message translates to:
  /// **'Motor'**
  String get csS9ActivityMotor;

  /// No description provided for @csS9ActivityFoods.
  ///
  /// In en, this message translates to:
  /// **'Foods'**
  String get csS9ActivityFoods;

  /// No description provided for @csS9ActivityCharacters.
  ///
  /// In en, this message translates to:
  /// **'Characters'**
  String get csS9ActivityCharacters;

  /// No description provided for @csS9ActivityMusic.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get csS9ActivityMusic;

  /// No description provided for @csS9ActivityOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get csS9ActivityOther;

  /// No description provided for @csS9OtherActivitiesLabel.
  ///
  /// In en, this message translates to:
  /// **'What are the child\'s preferred activities (if other was selected in the previous question)'**
  String get csS9OtherActivitiesLabel;

  /// No description provided for @csS9OtherActivitiesHint.
  ///
  /// In en, this message translates to:
  /// **'Enter child\'s preferred activities'**
  String get csS9OtherActivitiesHint;

  /// No description provided for @csS9PreferenceScanTitle.
  ///
  /// In en, this message translates to:
  /// **'Preference and Reinforcer Survey'**
  String get csS9PreferenceScanTitle;

  /// No description provided for @csS9PrefFoodLabel.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get csS9PrefFoodLabel;

  /// No description provided for @csS9PrefSensoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Sensory'**
  String get csS9PrefSensoryLabel;

  /// No description provided for @csS9PrefSocialLabel.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get csS9PrefSocialLabel;

  /// No description provided for @csS9PrefMaterialLabel.
  ///
  /// In en, this message translates to:
  /// **'Material / Activity'**
  String get csS9PrefMaterialLabel;

  /// No description provided for @csS9PrefExampleHint.
  ///
  /// In en, this message translates to:
  /// **'Example'**
  String get csS9PrefExampleHint;

  /// No description provided for @csS9PrefHighlyPreferred.
  ///
  /// In en, this message translates to:
  /// **'Highly preferred'**
  String get csS9PrefHighlyPreferred;

  /// No description provided for @csS9PrefAcceptable.
  ///
  /// In en, this message translates to:
  /// **'Acceptable'**
  String get csS9PrefAcceptable;

  /// No description provided for @csS9PrefNotPreferred.
  ///
  /// In en, this message translates to:
  /// **'Not preferred'**
  String get csS9PrefNotPreferred;

  /// No description provided for @csS9PositiveDistinctionLabel.
  ///
  /// In en, this message translates to:
  /// **'What positively distinguishes the child?'**
  String get csS9PositiveDistinctionLabel;

  /// No description provided for @csS9PositiveDistinctionHint.
  ///
  /// In en, this message translates to:
  /// **'Describe what positively distinguishes the child...'**
  String get csS9PositiveDistinctionHint;

  /// No description provided for @csSection10Title.
  ///
  /// In en, this message translates to:
  /// **'Educational and Services'**
  String get csSection10Title;

  /// No description provided for @csS10EnrolledInSchool.
  ///
  /// In en, this message translates to:
  /// **'Educational enrollment'**
  String get csS10EnrolledInSchool;

  /// No description provided for @csS10SchoolNameLabel.
  ///
  /// In en, this message translates to:
  /// **'School name'**
  String get csS10SchoolNameLabel;

  /// No description provided for @csS10SchoolNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter child\'s school name'**
  String get csS10SchoolNameHint;

  /// No description provided for @csS10SchoolGradeLabel.
  ///
  /// In en, this message translates to:
  /// **'Grade'**
  String get csS10SchoolGradeLabel;

  /// No description provided for @csS10SchoolGradeHint.
  ///
  /// In en, this message translates to:
  /// **'Enter child\'s grade'**
  String get csS10SchoolGradeHint;

  /// No description provided for @csS10CurrentServicesTitle.
  ///
  /// In en, this message translates to:
  /// **'Current / Previous Services'**
  String get csS10CurrentServicesTitle;

  /// No description provided for @csS10ServiceABA.
  ///
  /// In en, this message translates to:
  /// **'ABA'**
  String get csS10ServiceABA;

  /// No description provided for @csS10ServiceSpeech.
  ///
  /// In en, this message translates to:
  /// **'Speech therapy'**
  String get csS10ServiceSpeech;

  /// No description provided for @csS10ServiceOccupational.
  ///
  /// In en, this message translates to:
  /// **'Occupational therapy'**
  String get csS10ServiceOccupational;

  /// No description provided for @csS10ServicePhysical.
  ///
  /// In en, this message translates to:
  /// **'Physical therapy'**
  String get csS10ServicePhysical;

  /// No description provided for @csS10ServicePsychological.
  ///
  /// In en, this message translates to:
  /// **'Psychological'**
  String get csS10ServicePsychological;

  /// No description provided for @csS10ServiceSpecialEd.
  ///
  /// In en, this message translates to:
  /// **'Special education'**
  String get csS10ServiceSpecialEd;

  /// No description provided for @csS10ServiceOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get csS10ServiceOther;

  /// No description provided for @csS10ServiceNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get csS10ServiceNone;

  /// No description provided for @csS10OtherServiceLabel.
  ///
  /// In en, this message translates to:
  /// **'What are the current/previous services (if other was selected in the previous question)'**
  String get csS10OtherServiceLabel;

  /// No description provided for @csS10OtherServiceHint.
  ///
  /// In en, this message translates to:
  /// **'Enter services'**
  String get csS10OtherServiceHint;

  /// No description provided for @csS10ServiceDurationLabel.
  ///
  /// In en, this message translates to:
  /// **'Service duration'**
  String get csS10ServiceDurationLabel;

  /// No description provided for @csS10ServiceDurationHint.
  ///
  /// In en, this message translates to:
  /// **'Enter service duration'**
  String get csS10ServiceDurationHint;

  /// No description provided for @csS10HasIEP.
  ///
  /// In en, this message translates to:
  /// **'Is there an individualized educational plan?'**
  String get csS10HasIEP;

  /// No description provided for @csS10PreviousReportsTitle.
  ///
  /// In en, this message translates to:
  /// **'Previous Assessment Reports'**
  String get csS10PreviousReportsTitle;

  /// No description provided for @csS10ReportVineland.
  ///
  /// In en, this message translates to:
  /// **'Vineland'**
  String get csS10ReportVineland;

  /// No description provided for @csS10ReportEFL.
  ///
  /// In en, this message translates to:
  /// **'EFL'**
  String get csS10ReportEFL;

  /// No description provided for @csS10ReportAFLS.
  ///
  /// In en, this message translates to:
  /// **'AFLS'**
  String get csS10ReportAFLS;

  /// No description provided for @csS10ReportABLLS.
  ///
  /// In en, this message translates to:
  /// **'ABLLS-R'**
  String get csS10ReportABLLS;

  /// No description provided for @csS10ReportVBMAPP.
  ///
  /// In en, this message translates to:
  /// **'VB-MAPP'**
  String get csS10ReportVBMAPP;

  /// No description provided for @csS10ReportOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get csS10ReportOther;

  /// No description provided for @csS10ReportNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get csS10ReportNone;

  /// No description provided for @csS10SchoolSupportTitle.
  ///
  /// In en, this message translates to:
  /// **'School Environment and Support Details'**
  String get csS10SchoolSupportTitle;

  /// No description provided for @csS10ClassTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Class type'**
  String get csS10ClassTypeLabel;

  /// No description provided for @csS10ClassTypeFullInclusion.
  ///
  /// In en, this message translates to:
  /// **'Full inclusion'**
  String get csS10ClassTypeFullInclusion;

  /// No description provided for @csS10ClassTypePartialInclusion.
  ///
  /// In en, this message translates to:
  /// **'Partial inclusion'**
  String get csS10ClassTypePartialInclusion;

  /// No description provided for @csS10ClassTypeSpecialClass.
  ///
  /// In en, this message translates to:
  /// **'Special class'**
  String get csS10ClassTypeSpecialClass;

  /// No description provided for @csS10ClassTypeCareCenter.
  ///
  /// In en, this message translates to:
  /// **'Care center'**
  String get csS10ClassTypeCareCenter;

  /// No description provided for @csS10HasShadowTeacher.
  ///
  /// In en, this message translates to:
  /// **'Is there a shadow teacher?'**
  String get csS10HasShadowTeacher;

  /// No description provided for @csS10ShadowTeacherNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Teacher name'**
  String get csS10ShadowTeacherNameLabel;

  /// No description provided for @csS10ShadowTeacherNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter teacher name'**
  String get csS10ShadowTeacherNameHint;

  /// No description provided for @csS10EnvironmentalModsTitle.
  ///
  /// In en, this message translates to:
  /// **'Environmental modifications'**
  String get csS10EnvironmentalModsTitle;

  /// No description provided for @csS10ModReduceDistractions.
  ///
  /// In en, this message translates to:
  /// **'Reduce distractions'**
  String get csS10ModReduceDistractions;

  /// No description provided for @csS10ModVisualSchedule.
  ///
  /// In en, this message translates to:
  /// **'Visual schedule'**
  String get csS10ModVisualSchedule;

  /// No description provided for @csS10ModSpecificSeat.
  ///
  /// In en, this message translates to:
  /// **'Specific seating'**
  String get csS10ModSpecificSeat;

  /// No description provided for @csS10ModOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get csS10ModOther;

  /// No description provided for @csS10SchoolBehaviorLabel.
  ///
  /// In en, this message translates to:
  /// **'Behavior at school'**
  String get csS10SchoolBehaviorLabel;

  /// No description provided for @csS10SchoolBehaviorHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the child\'s behavior at school...'**
  String get csS10SchoolBehaviorHint;

  /// No description provided for @csSection11Title.
  ///
  /// In en, this message translates to:
  /// **'Family Priorities and Goals'**
  String get csSection11Title;

  /// No description provided for @csS11TopConcernsLabel.
  ///
  /// In en, this message translates to:
  /// **'Top 3 family concerns'**
  String get csS11TopConcernsLabel;

  /// No description provided for @csS11TopConcernsHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the top 3 concerns...'**
  String get csS11TopConcernsHint;

  /// No description provided for @csS11TopGoalsLabel.
  ///
  /// In en, this message translates to:
  /// **'Top 3 goals the family wants to achieve'**
  String get csS11TopGoalsLabel;

  /// No description provided for @csS11TopGoalsHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the top 3 goals...'**
  String get csS11TopGoalsHint;

  /// No description provided for @csS11SessionTimePrefsLabel.
  ///
  /// In en, this message translates to:
  /// **'Session time preferences'**
  String get csS11SessionTimePrefsLabel;

  /// No description provided for @csS11SessionTimePrefsHint.
  ///
  /// In en, this message translates to:
  /// **'Enter session time preferences'**
  String get csS11SessionTimePrefsHint;

  /// No description provided for @csS11ParentTrainingReadinessLabel.
  ///
  /// In en, this message translates to:
  /// **'Readiness for parent training'**
  String get csS11ParentTrainingReadinessLabel;

  /// No description provided for @csS11OptionMaybe.
  ///
  /// In en, this message translates to:
  /// **'Maybe'**
  String get csS11OptionMaybe;

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
  /// **'Initial Assessment and Follow-up Plan'**
  String get csSection13Title;

  /// No description provided for @csS13PriorityLevel.
  ///
  /// In en, this message translates to:
  /// **'Priority level'**
  String get csS13PriorityLevel;

  /// No description provided for @csS13PriorityLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get csS13PriorityLow;

  /// No description provided for @csS13PriorityMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get csS13PriorityMedium;

  /// No description provided for @csS13PriorityHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get csS13PriorityHigh;

  /// No description provided for @csS13PriorityUrgent.
  ///
  /// In en, this message translates to:
  /// **'Urgent'**
  String get csS13PriorityUrgent;

  /// No description provided for @csS13SpecializationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Suggested specializations'**
  String get csS13SpecializationsTitle;

  /// No description provided for @csS13SpecABA.
  ///
  /// In en, this message translates to:
  /// **'ABA'**
  String get csS13SpecABA;

  /// No description provided for @csS13SpecSpeech.
  ///
  /// In en, this message translates to:
  /// **'Speech therapy'**
  String get csS13SpecSpeech;

  /// No description provided for @csS13SpecOccupational.
  ///
  /// In en, this message translates to:
  /// **'Occupational therapy'**
  String get csS13SpecOccupational;

  /// No description provided for @csS13SpecPhysical.
  ///
  /// In en, this message translates to:
  /// **'Physical therapy'**
  String get csS13SpecPhysical;

  /// No description provided for @csS13SpecPsychological.
  ///
  /// In en, this message translates to:
  /// **'Psychological'**
  String get csS13SpecPsychological;

  /// No description provided for @csS13SpecSpecialEd.
  ///
  /// In en, this message translates to:
  /// **'Special education'**
  String get csS13SpecSpecialEd;

  /// No description provided for @csS13AdditionalReqsTitle.
  ///
  /// In en, this message translates to:
  /// **'Additional requirements'**
  String get csS13AdditionalReqsTitle;

  /// No description provided for @csS13ReviewOtherReports.
  ///
  /// In en, this message translates to:
  /// **'Review other reports'**
  String get csS13ReviewOtherReports;

  /// No description provided for @csS13DirectObservation.
  ///
  /// In en, this message translates to:
  /// **'Direct observation'**
  String get csS13DirectObservation;

  /// No description provided for @csS13FamilyMeeting.
  ///
  /// In en, this message translates to:
  /// **'Family meeting'**
  String get csS13FamilyMeeting;

  /// No description provided for @csS13NotesAndNextStepsLabel.
  ///
  /// In en, this message translates to:
  /// **'Summary of notes and next steps'**
  String get csS13NotesAndNextStepsLabel;

  /// No description provided for @csS13NotesAndNextStepsHint.
  ///
  /// In en, this message translates to:
  /// **'Enter notes and next steps...'**
  String get csS13NotesAndNextStepsHint;

  /// No description provided for @csS13NextAssessmentDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Next assessment date'**
  String get csS13NextAssessmentDateLabel;

  /// No description provided for @csS13NextAssessmentTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Next assessment time'**
  String get csS13NextAssessmentTimeLabel;

  /// No description provided for @csSectionDocsTitle.
  ///
  /// In en, this message translates to:
  /// **'Documents and Consents'**
  String get csSectionDocsTitle;

  /// No description provided for @csSectionDocsSubmittedTitle.
  ///
  /// In en, this message translates to:
  /// **'Documents Submitted'**
  String get csSectionDocsSubmittedTitle;

  /// No description provided for @csSectionDocsID.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get csSectionDocsID;

  /// No description provided for @csSectionDocsMedicalReports.
  ///
  /// In en, this message translates to:
  /// **'Medical reports'**
  String get csSectionDocsMedicalReports;

  /// No description provided for @csSectionDocsDiagnosticReports.
  ///
  /// In en, this message translates to:
  /// **'Diagnostic reports'**
  String get csSectionDocsDiagnosticReports;

  /// No description provided for @csSectionDocsSchoolReports.
  ///
  /// In en, this message translates to:
  /// **'School reports'**
  String get csSectionDocsSchoolReports;

  /// No description provided for @csSectionDocsPrevTreatmentReports.
  ///
  /// In en, this message translates to:
  /// **'Previous treatment reports'**
  String get csSectionDocsPrevTreatmentReports;

  /// No description provided for @csSectionDocsOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get csSectionDocsOther;

  /// No description provided for @csSectionDocsOtherLabel.
  ///
  /// In en, this message translates to:
  /// **'What are the documents submitted'**
  String get csSectionDocsOtherLabel;

  /// No description provided for @csSectionDocsOtherNote.
  ///
  /// In en, this message translates to:
  /// **'(In case other was selected in the previous question)'**
  String get csSectionDocsOtherNote;

  /// No description provided for @csSectionDocsOtherHint.
  ///
  /// In en, this message translates to:
  /// **'Enter document name'**
  String get csSectionDocsOtherHint;

  /// No description provided for @csSectionDocsConsentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Consents'**
  String get csSectionDocsConsentsTitle;

  /// No description provided for @csSectionDocsConsentPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get csSectionDocsConsentPrivacy;

  /// No description provided for @csSectionDocsConsentInfoSharing.
  ///
  /// In en, this message translates to:
  /// **'Information sharing'**
  String get csSectionDocsConsentInfoSharing;

  /// No description provided for @csSectionDocsConsentOtherComms.
  ///
  /// In en, this message translates to:
  /// **'Communications with other parties'**
  String get csSectionDocsConsentOtherComms;

  /// No description provided for @csSectionDocsConsentAssessments.
  ///
  /// In en, this message translates to:
  /// **'Complete assessments'**
  String get csSectionDocsConsentAssessments;

  /// No description provided for @csSectionDocsConsentFuturePlan.
  ///
  /// In en, this message translates to:
  /// **'Future steps plan'**
  String get csSectionDocsConsentFuturePlan;

  /// No description provided for @csSection14Title.
  ///
  /// In en, this message translates to:
  /// **'Daily Routine'**
  String get csSection14Title;

  /// No description provided for @csS14WeekdayRoutineLabel.
  ///
  /// In en, this message translates to:
  /// **'Weekday routine (Work / School)'**
  String get csS14WeekdayRoutineLabel;

  /// No description provided for @csS14WeekdayRoutineHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the weekday routine...'**
  String get csS14WeekdayRoutineHint;

  /// No description provided for @csS14WeekendRoutineLabel.
  ///
  /// In en, this message translates to:
  /// **'Weekend routine'**
  String get csS14WeekendRoutineLabel;

  /// No description provided for @csS14WeekendRoutineHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the weekend routine...'**
  String get csS14WeekendRoutineHint;

  /// No description provided for @csSection15Title.
  ///
  /// In en, this message translates to:
  /// **'Signatures'**
  String get csSection15Title;

  /// No description provided for @csS15GuardianNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Guardian / Caregiver Name'**
  String get csS15GuardianNameLabel;

  /// No description provided for @csS15GuardianNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter guardian name'**
  String get csS15GuardianNameHint;

  /// No description provided for @csS15SignatureLabel.
  ///
  /// In en, this message translates to:
  /// **'Signature'**
  String get csS15SignatureLabel;

  /// No description provided for @csS15ClearSignature.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get csS15ClearSignature;

  /// No description provided for @csS15DateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get csS15DateLabel;

  /// No description provided for @csS15SpecialistNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name of Receiving Specialist'**
  String get csS15SpecialistNameLabel;

  /// No description provided for @csS15SpecialistNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter specialist name'**
  String get csS15SpecialistNameHint;

  /// No description provided for @csS15JobTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Job Title'**
  String get csS15JobTitleLabel;

  /// No description provided for @csS15JobTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Enter job title'**
  String get csS15JobTitleHint;

  /// No description provided for @csS15AddTeamMember.
  ///
  /// In en, this message translates to:
  /// **'+ Add team members who participated in the interview if any'**
  String get csS15AddTeamMember;

  /// No description provided for @csS15SpecializationLabel.
  ///
  /// In en, this message translates to:
  /// **'Specialization'**
  String get csS15SpecializationLabel;

  /// No description provided for @csS15SpecializationHint.
  ///
  /// In en, this message translates to:
  /// **'Enter specialization'**
  String get csS15SpecializationHint;

  /// No description provided for @csS15MemberNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get csS15MemberNameLabel;

  /// No description provided for @csS15MemberNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter member name'**
  String get csS15MemberNameHint;

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

  /// No description provided for @csS4ComprehensiveTitle.
  ///
  /// In en, this message translates to:
  /// **'Comprehensive Medical History'**
  String get csS4ComprehensiveTitle;

  /// No description provided for @csS4MedHistYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get csS4MedHistYes;

  /// No description provided for @csS4MedHistNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get csS4MedHistNo;

  /// No description provided for @csS4HearingVision.
  ///
  /// In en, this message translates to:
  /// **'Hearing/Vision Issues'**
  String get csS4HearingVision;

  /// No description provided for @csS4SeizuresHeadInjury.
  ///
  /// In en, this message translates to:
  /// **'Seizures/Head Injury'**
  String get csS4SeizuresHeadInjury;

  /// No description provided for @csS4SleepNutrition.
  ///
  /// In en, this message translates to:
  /// **'Sleep/Nutrition Issues'**
  String get csS4SleepNutrition;

  /// No description provided for @csS4BloodAnemiaResp.
  ///
  /// In en, this message translates to:
  /// **'Blood/Anemia/Respiratory Issues'**
  String get csS4BloodAnemiaResp;

  /// No description provided for @csS4DentalPerception.
  ///
  /// In en, this message translates to:
  /// **'Dental/Perception Issues'**
  String get csS4DentalPerception;

  /// No description provided for @csS4FattyFailureStunting.
  ///
  /// In en, this message translates to:
  /// **'Fatty Failure/Stunting'**
  String get csS4FattyFailureStunting;

  /// No description provided for @csS4PrevTreatmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Previous Treatments'**
  String get csS4PrevTreatmentTitle;

  /// No description provided for @csS4AddTreatment.
  ///
  /// In en, this message translates to:
  /// **'Add Treatment'**
  String get csS4AddTreatment;

  /// No description provided for @csS4CurrentMedsTitle.
  ///
  /// In en, this message translates to:
  /// **'Current Medications'**
  String get csS4CurrentMedsTitle;

  /// No description provided for @csS4AddMedication.
  ///
  /// In en, this message translates to:
  /// **'Add Medication'**
  String get csS4AddMedication;

  /// No description provided for @csS4DiagnosesTitle.
  ///
  /// In en, this message translates to:
  /// **'Diagnoses'**
  String get csS4DiagnosesTitle;

  /// No description provided for @csS4DiagnosedOption.
  ///
  /// In en, this message translates to:
  /// **'Diagnosed'**
  String get csS4DiagnosedOption;

  /// No description provided for @csS4SuspectedOption.
  ///
  /// In en, this message translates to:
  /// **'Suspected'**
  String get csS4SuspectedOption;

  /// No description provided for @csS4ASD.
  ///
  /// In en, this message translates to:
  /// **'Autism Spectrum Disorder'**
  String get csS4ASD;

  /// No description provided for @csS4ADHD.
  ///
  /// In en, this message translates to:
  /// **'ADHD'**
  String get csS4ADHD;

  /// No description provided for @csS4LearningDelay.
  ///
  /// In en, this message translates to:
  /// **'Learning Delay'**
  String get csS4LearningDelay;

  /// No description provided for @csS4DownSyndrome.
  ///
  /// In en, this message translates to:
  /// **'Down Syndrome'**
  String get csS4DownSyndrome;

  /// No description provided for @csS4OtherDiagnosis.
  ///
  /// In en, this message translates to:
  /// **'Other Diagnosis'**
  String get csS4OtherDiagnosis;

  /// No description provided for @csS4MedAssessTitle.
  ///
  /// In en, this message translates to:
  /// **'Medical Assessments'**
  String get csS4MedAssessTitle;

  /// No description provided for @csS4NormalOption.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get csS4NormalOption;

  /// No description provided for @csS4AbnormalOption.
  ///
  /// In en, this message translates to:
  /// **'Abnormal'**
  String get csS4AbnormalOption;

  /// No description provided for @csS4AssessmentNotes.
  ///
  /// In en, this message translates to:
  /// **'Assessment Notes'**
  String get csS4AssessmentNotes;

  /// No description provided for @csS4AuditoryVisual.
  ///
  /// In en, this message translates to:
  /// **'Auditory/Visual'**
  String get csS4AuditoryVisual;

  /// No description provided for @csS4BrainScanEEG.
  ///
  /// In en, this message translates to:
  /// **'Brain Scan/EEG'**
  String get csS4BrainScanEEG;

  /// No description provided for @csS4GeneticTest.
  ///
  /// In en, this message translates to:
  /// **'Genetic Test'**
  String get csS4GeneticTest;

  /// No description provided for @csS4PsychoIQ.
  ///
  /// In en, this message translates to:
  /// **'Psychological/IQ'**
  String get csS4PsychoIQ;

  /// No description provided for @csS4DietAllergyTitle.
  ///
  /// In en, this message translates to:
  /// **'Diet and Allergies'**
  String get csS4DietAllergyTitle;

  /// No description provided for @csS4HasAllergiesQuestion.
  ///
  /// In en, this message translates to:
  /// **'Does the child have allergies?'**
  String get csS4HasAllergiesQuestion;

  /// No description provided for @csS4AllergyTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Allergy Type'**
  String get csS4AllergyTypeLabel;

  /// No description provided for @csS4AllergyTypeHint.
  ///
  /// In en, this message translates to:
  /// **'E.g., Peanuts, Dairy'**
  String get csS4AllergyTypeHint;

  /// No description provided for @csS4SpecialDietQuestion.
  ///
  /// In en, this message translates to:
  /// **'Is the child on a special diet?'**
  String get csS4SpecialDietQuestion;

  /// No description provided for @csS4GlutenFree.
  ///
  /// In en, this message translates to:
  /// **'Gluten Free'**
  String get csS4GlutenFree;

  /// No description provided for @csS4CaseinFree.
  ///
  /// In en, this message translates to:
  /// **'Casein Free'**
  String get csS4CaseinFree;

  /// No description provided for @csS4Biometric.
  ///
  /// In en, this message translates to:
  /// **'Biometric'**
  String get csS4Biometric;

  /// No description provided for @csS4OtherDiet.
  ///
  /// In en, this message translates to:
  /// **'Other Diet'**
  String get csS4OtherDiet;

  /// No description provided for @csS4OtherDietHint.
  ///
  /// In en, this message translates to:
  /// **'Specify other diet'**
  String get csS4OtherDietHint;

  /// No description provided for @csS4AltVaccinesQuestion.
  ///
  /// In en, this message translates to:
  /// **'Any alternative vaccines?'**
  String get csS4AltVaccinesQuestion;

  /// No description provided for @csS4AltVaccinesDescLabel.
  ///
  /// In en, this message translates to:
  /// **'Alternative Vaccines Description'**
  String get csS4AltVaccinesDescLabel;

  /// No description provided for @csS4AltVaccinesDescHint.
  ///
  /// In en, this message translates to:
  /// **'Describe alternative vaccines'**
  String get csS4AltVaccinesDescHint;

  /// No description provided for @csS4AllVaccinesOnTimeQuestion.
  ///
  /// In en, this message translates to:
  /// **'All vaccines on time?'**
  String get csS4AllVaccinesOnTimeQuestion;

  /// No description provided for @csS4RemoveTreatment.
  ///
  /// In en, this message translates to:
  /// **'Remove Treatment'**
  String get csS4RemoveTreatment;

  /// No description provided for @csS4TreatmentTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Treatment Type'**
  String get csS4TreatmentTypeLabel;

  /// No description provided for @csS4TreatmentTypeHint.
  ///
  /// In en, this message translates to:
  /// **'Select treatment type'**
  String get csS4TreatmentTypeHint;

  /// No description provided for @csS4TreatmentSpeech.
  ///
  /// In en, this message translates to:
  /// **'Speech Therapy'**
  String get csS4TreatmentSpeech;

  /// No description provided for @csS4TreatmentOccupational.
  ///
  /// In en, this message translates to:
  /// **'Occupational Therapy'**
  String get csS4TreatmentOccupational;

  /// No description provided for @csS4TreatmentPhysical.
  ///
  /// In en, this message translates to:
  /// **'Physical Therapy'**
  String get csS4TreatmentPhysical;

  /// No description provided for @csS4TreatmentABA.
  ///
  /// In en, this message translates to:
  /// **'ABA Therapy'**
  String get csS4TreatmentABA;

  /// No description provided for @csS4TreatmentPsychological.
  ///
  /// In en, this message translates to:
  /// **'Psychological Therapy'**
  String get csS4TreatmentPsychological;

  /// No description provided for @csS4TreatmentOther.
  ///
  /// In en, this message translates to:
  /// **'Other Therapy'**
  String get csS4TreatmentOther;

  /// No description provided for @csS4OrganizationLabel.
  ///
  /// In en, this message translates to:
  /// **'Organization'**
  String get csS4OrganizationLabel;

  /// No description provided for @csS4OrganizationHint.
  ///
  /// In en, this message translates to:
  /// **'E.g., ABC Center'**
  String get csS4OrganizationHint;

  /// No description provided for @csS4ImprovementsLabel.
  ///
  /// In en, this message translates to:
  /// **'Improvements'**
  String get csS4ImprovementsLabel;

  /// No description provided for @csS4NotesHint.
  ///
  /// In en, this message translates to:
  /// **'Any additional notes'**
  String get csS4NotesHint;

  /// No description provided for @csS4MedNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Medication Name'**
  String get csS4MedNameLabel;

  /// No description provided for @csS4MedNameHint.
  ///
  /// In en, this message translates to:
  /// **'E.g., Ritalin'**
  String get csS4MedNameHint;

  /// No description provided for @csS4DosageTimingLabel.
  ///
  /// In en, this message translates to:
  /// **'Dosage & Timing'**
  String get csS4DosageTimingLabel;

  /// No description provided for @csS4DosageTimingHint.
  ///
  /// In en, this message translates to:
  /// **'E.g., 10mg morning'**
  String get csS4DosageTimingHint;

  /// No description provided for @csS4UsageDurationLabel.
  ///
  /// In en, this message translates to:
  /// **'Usage Duration'**
  String get csS4UsageDurationLabel;

  /// No description provided for @csS4UsageDurationHint.
  ///
  /// In en, this message translates to:
  /// **'E.g., 6 months'**
  String get csS4UsageDurationHint;

  /// No description provided for @csS5Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Birth Period Information'**
  String get csS5Subtitle;

  /// No description provided for @csS5SocialEmotionalTitle.
  ///
  /// In en, this message translates to:
  /// **'Social & Emotional Development'**
  String get csS5SocialEmotionalTitle;

  /// No description provided for @csS5SocialSmile.
  ///
  /// In en, this message translates to:
  /// **'Social Smile'**
  String get csS5SocialSmile;

  /// No description provided for @csS5KnowsFamilyMembers.
  ///
  /// In en, this message translates to:
  /// **'Knows Family Members'**
  String get csS5KnowsFamilyMembers;

  /// No description provided for @csS5RespondsToName.
  ///
  /// In en, this message translates to:
  /// **'Responds to Name'**
  String get csS5RespondsToName;

  /// No description provided for @csS5ShowsAffection.
  ///
  /// In en, this message translates to:
  /// **'Shows Affection'**
  String get csS5ShowsAffection;

  /// No description provided for @csS5ShyOrFearful.
  ///
  /// In en, this message translates to:
  /// **'Shy or Fearful'**
  String get csS5ShyOrFearful;

  /// No description provided for @csS5CognitiveTitle.
  ///
  /// In en, this message translates to:
  /// **'Cognitive Development'**
  String get csS5CognitiveTitle;

  /// No description provided for @csS5ImitatesAdults.
  ///
  /// In en, this message translates to:
  /// **'Imitates Adults'**
  String get csS5ImitatesAdults;

  /// No description provided for @csS5PutsObjectsInMouth.
  ///
  /// In en, this message translates to:
  /// **'Puts Objects in Mouth'**
  String get csS5PutsObjectsInMouth;

  /// No description provided for @csS5RecognizesColors.
  ///
  /// In en, this message translates to:
  /// **'Recognizes Colors'**
  String get csS5RecognizesColors;

  /// No description provided for @csS5ImaginativePlay.
  ///
  /// In en, this message translates to:
  /// **'Imaginative Play'**
  String get csS5ImaginativePlay;

  /// No description provided for @csS5FollowsInstructions.
  ///
  /// In en, this message translates to:
  /// **'Follows Instructions'**
  String get csS5FollowsInstructions;

  /// No description provided for @csS5LanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language Development'**
  String get csS5LanguageTitle;

  /// No description provided for @csS5Cooing.
  ///
  /// In en, this message translates to:
  /// **'Cooing'**
  String get csS5Cooing;

  /// No description provided for @csS5TwoWordPhrases.
  ///
  /// In en, this message translates to:
  /// **'Two-Word Phrases'**
  String get csS5TwoWordPhrases;

  /// No description provided for @csS5UsesGestures.
  ///
  /// In en, this message translates to:
  /// **'Uses Gestures'**
  String get csS5UsesGestures;

  /// No description provided for @csS5RequestsByWords.
  ///
  /// In en, this message translates to:
  /// **'Requests by Words'**
  String get csS5RequestsByWords;

  /// No description provided for @csS5MotorTitle.
  ///
  /// In en, this message translates to:
  /// **'Motor Development'**
  String get csS5MotorTitle;

  /// No description provided for @csS5SittingCrawling.
  ///
  /// In en, this message translates to:
  /// **'Sitting/Crawling'**
  String get csS5SittingCrawling;

  /// No description provided for @csS5JumpingClimbing.
  ///
  /// In en, this message translates to:
  /// **'Jumping/Climbing'**
  String get csS5JumpingClimbing;

  /// No description provided for @csS5WalkingWithoutHelp.
  ///
  /// In en, this message translates to:
  /// **'Walking Without Help'**
  String get csS5WalkingWithoutHelp;

  /// No description provided for @csS5HoldingPenDrawing.
  ///
  /// In en, this message translates to:
  /// **'Holding Pen/Drawing'**
  String get csS5HoldingPenDrawing;

  /// No description provided for @csS5KickingThrowing.
  ///
  /// In en, this message translates to:
  /// **'Kicking/Throwing'**
  String get csS5KickingThrowing;

  /// No description provided for @csS5MilestoneAgesTitle.
  ///
  /// In en, this message translates to:
  /// **'Milestone Ages'**
  String get csS5MilestoneAgesTitle;

  /// No description provided for @csS5SocialSmileMilestone.
  ///
  /// In en, this message translates to:
  /// **'Social Smile Age'**
  String get csS5SocialSmileMilestone;

  /// No description provided for @csS5AgeHint.
  ///
  /// In en, this message translates to:
  /// **'Age in months'**
  String get csS5AgeHint;

  /// No description provided for @csS5IndependentSitting.
  ///
  /// In en, this message translates to:
  /// **'Independent Sitting'**
  String get csS5IndependentSitting;

  /// No description provided for @csS5IndependentWalking.
  ///
  /// In en, this message translates to:
  /// **'Independent Walking'**
  String get csS5IndependentWalking;

  /// No description provided for @csS5FirstFunctionalWord.
  ///
  /// In en, this message translates to:
  /// **'First Functional Word'**
  String get csS5FirstFunctionalWord;

  /// No description provided for @csS5RegressionTitle.
  ///
  /// In en, this message translates to:
  /// **'Developmental Regression'**
  String get csS5RegressionTitle;

  /// No description provided for @csS5RegressionQuestion.
  ///
  /// In en, this message translates to:
  /// **'Any regression?'**
  String get csS5RegressionQuestion;

  /// No description provided for @csS5RegressionAgeLabel.
  ///
  /// In en, this message translates to:
  /// **'Regression Age'**
  String get csS5RegressionAgeLabel;

  /// No description provided for @csS5RegressionAgeHint.
  ///
  /// In en, this message translates to:
  /// **'Age when regression occurred'**
  String get csS5RegressionAgeHint;

  /// No description provided for @csS5RegressionAgeNote.
  ///
  /// In en, this message translates to:
  /// **'Age in months'**
  String get csS5RegressionAgeNote;

  /// No description provided for @csS5RegressionDetailsLabel.
  ///
  /// In en, this message translates to:
  /// **'Regression Details'**
  String get csS5RegressionDetailsLabel;

  /// No description provided for @csS5RegressionDetailsHint.
  ///
  /// In en, this message translates to:
  /// **'Provide details of regression'**
  String get csS5RegressionDetailsHint;

  /// No description provided for @csS5NotesHint.
  ///
  /// In en, this message translates to:
  /// **'Any additional notes'**
  String get csS5NotesHint;

  /// No description provided for @downloadCaseStudy.
  ///
  /// In en, this message translates to:
  /// **'Download Case Study'**
  String get downloadCaseStudy;

  /// No description provided for @fillCaseStudyForm.
  ///
  /// In en, this message translates to:
  /// **'Fill Case Study Form'**
  String get fillCaseStudyForm;

  /// No description provided for @totalFamilies.
  ///
  /// In en, this message translates to:
  /// **'Total Families'**
  String get totalFamilies;

  /// No description provided for @activeChildren.
  ///
  /// In en, this message translates to:
  /// **'Active Children'**
  String get activeChildren;

  /// No description provided for @todayAppointments.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Appointments'**
  String get todayAppointments;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActions;

  /// No description provided for @addFamily.
  ///
  /// In en, this message translates to:
  /// **'Add Family'**
  String get addFamily;

  /// No description provided for @addChild.
  ///
  /// In en, this message translates to:
  /// **'Add Child'**
  String get addChild;

  /// No description provided for @newAppointment.
  ///
  /// In en, this message translates to:
  /// **'New Appointment'**
  String get newAppointment;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @manageDailySessions.
  ///
  /// In en, this message translates to:
  /// **'Manage daily therapy sessions'**
  String get manageDailySessions;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @statusConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get statusConfirmed;

  /// No description provided for @statusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get statusCancelled;

  /// No description provided for @statusWaiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting'**
  String get statusWaiting;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @printReport.
  ///
  /// In en, this message translates to:
  /// **'Print Report'**
  String get printReport;

  /// No description provided for @addFamilyTitle.
  ///
  /// In en, this message translates to:
  /// **'Add New Family'**
  String get addFamilyTitle;

  /// No description provided for @addChildTitle.
  ///
  /// In en, this message translates to:
  /// **'Add New Child'**
  String get addChildTitle;

  /// No description provided for @newAppointmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Schedule New Appointment'**
  String get newAppointmentTitle;

  /// No description provided for @resetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPasswordTitle;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInfo;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name (Family)'**
  String get lastName;

  /// No description provided for @nameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter name'**
  String get nameHint;

  /// No description provided for @usernameLabel.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get usernameLabel;

  /// No description provided for @usernameHint.
  ///
  /// In en, this message translates to:
  /// **'Child ID number'**
  String get usernameHint;

  /// No description provided for @fatherMobile.
  ///
  /// In en, this message translates to:
  /// **'Father\'s Mobile'**
  String get fatherMobile;

  /// No description provided for @fatherMobileHint.
  ///
  /// In en, this message translates to:
  /// **'Father\'s mobile number'**
  String get fatherMobileHint;

  /// No description provided for @motherMobile.
  ///
  /// In en, this message translates to:
  /// **'Mother\'s Mobile'**
  String get motherMobile;

  /// No description provided for @motherMobileHint.
  ///
  /// In en, this message translates to:
  /// **'Mother\'s mobile number'**
  String get motherMobileHint;

  /// No description provided for @addChildrenSection.
  ///
  /// In en, this message translates to:
  /// **'Add Children'**
  String get addChildrenSection;

  /// No description provided for @assignChildrenTitle.
  ///
  /// In en, this message translates to:
  /// **'Assign Children'**
  String get assignChildrenTitle;

  /// No description provided for @nationalId.
  ///
  /// In en, this message translates to:
  /// **'National ID Number'**
  String get nationalId;

  /// No description provided for @nationalIdHint.
  ///
  /// In en, this message translates to:
  /// **'Enter child\'s national ID'**
  String get nationalIdHint;

  /// No description provided for @diagnosisLabel.
  ///
  /// In en, this message translates to:
  /// **'Diagnosis'**
  String get diagnosisLabel;

  /// No description provided for @diagnosisHint.
  ///
  /// In en, this message translates to:
  /// **'Select diagnosis'**
  String get diagnosisHint;

  /// No description provided for @birthDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Birth Date (Gregorian)'**
  String get birthDateLabel;

  /// No description provided for @ageFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get ageFieldLabel;

  /// No description provided for @ageFieldHint.
  ///
  /// In en, this message translates to:
  /// **'Enter child\'s age'**
  String get ageFieldHint;

  /// No description provided for @assignChildFamilyTitle.
  ///
  /// In en, this message translates to:
  /// **'Assign Child Family'**
  String get assignChildFamilyTitle;

  /// No description provided for @nextButton.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextButton;

  /// No description provided for @documentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get documentsTitle;

  /// No description provided for @addDocumentLabel.
  ///
  /// In en, this message translates to:
  /// **'+ Add Document'**
  String get addDocumentLabel;

  /// No description provided for @documentNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Document Name'**
  String get documentNameLabel;

  /// No description provided for @documentNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter document name'**
  String get documentNameHint;

  /// No description provided for @uploadDocumentLabel.
  ///
  /// In en, this message translates to:
  /// **'Upload Document'**
  String get uploadDocumentLabel;

  /// No description provided for @selectChildLabel.
  ///
  /// In en, this message translates to:
  /// **'Select Child'**
  String get selectChildLabel;

  /// No description provided for @selectTherapistLabel.
  ///
  /// In en, this message translates to:
  /// **'Select Therapist'**
  String get selectTherapistLabel;

  /// No description provided for @selectTherapistHint.
  ///
  /// In en, this message translates to:
  /// **'Select therapist'**
  String get selectTherapistHint;

  /// No description provided for @appointmentTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Appointment Type'**
  String get appointmentTypeLabel;

  /// No description provided for @appointmentTypeHint.
  ///
  /// In en, this message translates to:
  /// **'Select appointment type'**
  String get appointmentTypeHint;

  /// No description provided for @selectDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDateLabel;

  /// No description provided for @selectTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Select Time'**
  String get selectTimeLabel;

  /// No description provided for @scheduleScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Appointment Schedule'**
  String get scheduleScreenTitle;

  /// No description provided for @assignFamily.
  ///
  /// In en, this message translates to:
  /// **'Assign Family'**
  String get assignFamily;

  /// No description provided for @selectFamilyHint.
  ///
  /// In en, this message translates to:
  /// **'Select child\'s family'**
  String get selectFamilyHint;

  /// No description provided for @newPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPasswordLabel;

  /// No description provided for @newPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get newPasswordHint;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmPasswordLabel;

  /// No description provided for @confirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get confirmPasswordHint;

  /// No description provided for @passwordsMustMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsMustMatch;

  /// No description provided for @genderSelectHint.
  ///
  /// In en, this message translates to:
  /// **'Select child\'s gender'**
  String get genderSelectHint;

  /// No description provided for @childNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Child Name'**
  String get childNameLabel;

  /// No description provided for @childNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter child\'s name'**
  String get childNameHint;

  /// No description provided for @saveSuccess.
  ///
  /// In en, this message translates to:
  /// **'Saved successfully'**
  String get saveSuccess;

  /// No description provided for @scheduleDateSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage daily therapy sessions'**
  String get scheduleDateSubtitle;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequired;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get searchHint;

  /// No description provided for @selectGenderLabel.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get selectGenderLabel;

  /// No description provided for @appointmentTypeSession.
  ///
  /// In en, this message translates to:
  /// **'Therapy Session'**
  String get appointmentTypeSession;

  /// No description provided for @appointmentTypeAssessment.
  ///
  /// In en, this message translates to:
  /// **'Assessment'**
  String get appointmentTypeAssessment;

  /// No description provided for @appointmentTypeFollowUp.
  ///
  /// In en, this message translates to:
  /// **'Follow-up'**
  String get appointmentTypeFollowUp;

  /// No description provided for @selectChildHint.
  ///
  /// In en, this message translates to:
  /// **'Select child'**
  String get selectChildHint;
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
