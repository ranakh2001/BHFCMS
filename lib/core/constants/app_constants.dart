class AppConstants {
  static const String appName = 'BHCFMS';
  
  // API URLs — canonical value lives in NetworkConstants; kept here for
  // legacy references that haven't been migrated yet.
  static const String baseUrl = 'https://bhcfms.net/api/v2/';

  // Timeouts (milliseconds)
  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;
}
