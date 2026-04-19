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
}
