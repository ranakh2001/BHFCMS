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
}
