import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoalsNotifier extends Notifier<List<bool>> {
  @override
  List<bool> build() => [true, false, false];

  void toggle(int index) {
    final updated = List<bool>.from(state);
    updated[index] = !updated[index];
    state = updated;
  }
}

final goalsProvider = NotifierProvider<GoalsNotifier, List<bool>>(GoalsNotifier.new);
