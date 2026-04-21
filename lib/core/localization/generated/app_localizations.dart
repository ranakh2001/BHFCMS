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
