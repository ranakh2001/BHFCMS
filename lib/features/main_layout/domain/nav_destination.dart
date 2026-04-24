import 'package:flutter/material.dart';

/// Describes a single bottom-nav entry.
/// [MainLayoutScreen] builds a role-specific list of these;
/// [CustomBottomNavBar] renders them without knowing anything about roles.
class NavDestination {
  final String iconPath;
  final Widget screen;

  const NavDestination({
    required this.iconPath,
    required this.screen,
  });
}
