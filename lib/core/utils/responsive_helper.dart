import 'package:flutter/widgets.dart';

class ResponsiveHelper {
  final BuildContext context;
  late final double screenWidth;
  late final double screenHeight;
  late final double safeWidth;
  late final double safeHeight;

  // Base mobile design size (e.g., standard iPhone sizes)
  static const double _baseWidth = 375.0;
  static const double _baseHeight = 812.0;

  ResponsiveHelper(this.context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;

    safeWidth = screenWidth - mediaQuery.padding.left - mediaQuery.padding.right;
    safeHeight = screenHeight - mediaQuery.padding.top - mediaQuery.padding.bottom;
  }

  /// Scales width based on ratio, avoiding extreme scaling
  double scaleWidth(double value) {
    double scale = screenWidth / _baseWidth;
    // Clamp to prevent elements from getting too small or unnecessarily huge
    return value * scale.clamp(0.8, 1.3);
  }

  /// Scales height based on height ratio, avoiding extreme scaling
  double scaleHeight(double value) {
    double scale = screenHeight / _baseHeight;
    return value * scale.clamp(0.8, 1.3);
  }

  /// Moderate text scaling based on width
  double scaleText(double value) {
    double scale = screenWidth / _baseWidth;
    // Tighter clamp for text to ensure readability (neither too tiny nor too massive)
    return value * scale.clamp(0.85, 1.15);
  }

  /// Scales border radius based on width only
  double scaleRadius(double value) {
    double scale = screenWidth / _baseWidth;
    return value * scale.clamp(0.8, 1.3);
  }

  /// Scales uniform spacing (padding/margin) proportionally based on width
  double scaleSpacing(double value) {
    return scaleWidth(value);
  }
}
