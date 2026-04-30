enum SessionStatus { upcoming, completed, holiday, confirmed, cancelled, waiting, postponed, deleted }

class ScheduleSession {
  final String id;
  final String childName;
  final String? therapistName;
  final String sessionType;
  final String time;
  final SessionStatus status;

  const ScheduleSession({
    required this.id,
    required this.childName,
    this.therapistName,
    required this.sessionType,
    required this.time,
    required this.status,
  });
}
