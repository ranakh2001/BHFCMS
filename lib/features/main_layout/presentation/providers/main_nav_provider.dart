import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Controls the active bottom-navigation tab index for [MainLayoutScreen].
///
/// Any widget in the tree can switch tabs by writing:
///   ref.read(mainNavIndexProvider.notifier).state = <tabIndex>;
final mainNavIndexProvider = StateProvider<int>((ref) => 0);
