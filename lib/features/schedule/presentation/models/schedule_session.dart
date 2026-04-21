enum SessionStatus { upcoming, completed, holiday }

class ScheduleSession {
  final String id;
  final String childName;
  final String sessionType;
  final String time;
  final SessionStatus status;

  const ScheduleSession({
    required this.id,
    required this.childName,
    required this.sessionType,
    required this.time,
    required this.status,
  });
}
