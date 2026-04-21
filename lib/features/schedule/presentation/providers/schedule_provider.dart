import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/schedule_session.dart';

typedef SessionMap = Map<DateTime, List<ScheduleSession>>;

SessionMap _buildMockSessions() {
  final now = DateTime.now();
  final map = <DateTime, List<ScheduleSession>>{};

  void add(int year, int month, int day, List<ScheduleSession> sessions) {
    try {
      final date = DateTime(year, month, day);
      if (date.month == month) map[date] = sessions;
    } catch (_) {}
  }

  final y = now.year;
  final m = now.month;
  final d = now.day;

  // Today - upcoming
  add(y, m, d, [
    const ScheduleSession(id: 't1', childName: 'Ahmed Ali', sessionType: 'Speech Session', time: '10:00', status: SessionStatus.upcoming),
    const ScheduleSession(id: 't2', childName: 'Sara Hassan', sessionType: 'Speech Session', time: '11:30', status: SessionStatus.upcoming),
  ]);

  // Past days - completed
  for (int i = 1; i <= 6; i++) {
    if (d - i > 0) {
      add(y, m, d - i, [
        ScheduleSession(id: 'p${i}a', childName: 'Omar Khalid', sessionType: 'Speech Session', time: '09:00', status: SessionStatus.completed),
        if (i % 2 == 0)
          ScheduleSession(id: 'p${i}b', childName: 'Nour Ahmed', sessionType: 'Speech Session', time: '10:30', status: SessionStatus.completed),
      ]);
    }
  }

  // A holiday in the past
  if (d - 8 > 0) {
    add(y, m, d - 8, [
      const ScheduleSession(id: 'h1', childName: '', sessionType: '', time: '', status: SessionStatus.holiday),
    ]);
  }

  // Future days - upcoming
  for (int i = 1; i <= 8; i++) {
    add(y, m, d + i, [
      ScheduleSession(id: 'f${i}a', childName: 'Layla Ibrahim', sessionType: 'Speech Session', time: '10:00', status: SessionStatus.upcoming),
      if (i % 3 == 0)
        ScheduleSession(id: 'f${i}b', childName: 'Yusuf Naser', sessionType: 'Speech Session', time: '11:00', status: SessionStatus.upcoming),
    ]);
  }

  // A future holiday
  add(y, m, d + 6, [
    const ScheduleSession(id: 'h2', childName: '', sessionType: '', time: '', status: SessionStatus.holiday),
  ]);

  // Previous month - some completed sessions
  for (int i = 1; i <= 5; i++) {
    add(y, m - 1, 28 - i, [
      ScheduleSession(id: 'pm$i', childName: 'Child $i', sessionType: 'Speech Session', time: '09:00', status: SessionStatus.completed),
    ]);
  }

  // Next month - some upcoming sessions
  for (int i = 1; i <= 5; i++) {
    add(y, m + 1, i + 2, [
      ScheduleSession(id: 'nm$i', childName: 'Child $i', sessionType: 'Speech Session', time: '10:00', status: SessionStatus.upcoming),
    ]);
  }

  return map;
}

class ScheduleState {
  final DateTime displayedMonth;
  final DateTime? selectedDate;
  final SessionMap sessions;

  const ScheduleState({
    required this.displayedMonth,
    required this.selectedDate,
    required this.sessions,
  });

  ScheduleState copyWith({
    DateTime? displayedMonth,
    DateTime? selectedDate,
    SessionMap? sessions,
  }) {
    return ScheduleState(
      displayedMonth: displayedMonth ?? this.displayedMonth,
      selectedDate: selectedDate ?? this.selectedDate,
      sessions: sessions ?? this.sessions,
    );
  }
}

class ScheduleNotifier extends StateNotifier<ScheduleState> {
  ScheduleNotifier()
      : super(ScheduleState(
          displayedMonth: DateTime(DateTime.now().year, DateTime.now().month, 1),
          selectedDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
          sessions: _buildMockSessions(),
        ));

  void previousMonth() {
    final d = state.displayedMonth;
    state = state.copyWith(displayedMonth: DateTime(d.year, d.month - 1, 1));
  }

  void nextMonth() {
    final d = state.displayedMonth;
    state = state.copyWith(displayedMonth: DateTime(d.year, d.month + 1, 1));
  }

  void selectDate(DateTime date) {
    state = state.copyWith(selectedDate: date);
  }
}

final scheduleProvider =
    StateNotifierProvider<ScheduleNotifier, ScheduleState>(
  (ref) => ScheduleNotifier(),
);
