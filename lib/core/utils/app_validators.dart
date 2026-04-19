import '../localization/generated/app_localizations.dart';

class AppValidators {
  static String? validateEmail(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) {
      return l10n.validationRequired;
    }
    
    // Standard email regex
    final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    
    if (!emailRegExp.hasMatch(value.trim())) {
      return l10n.validationEmail;
    }
    
    return null;
  }

  static String? validatePassword(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) {
      return l10n.validationRequired;
    }
    
    if (value.length < 6) {
      return l10n.validationPasswordLength;
    }
    
    return null;
  }
}
