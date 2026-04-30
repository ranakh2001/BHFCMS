enum MediaType { video, audio }

class SessionMediaModel {
  final String id;
  final MediaType type;
  final String url;
  final String title;
  final bool isVisibleToParent;

  const SessionMediaModel({
    required this.id,
    required this.type,
    required this.url,
    required this.title,
    this.isVisibleToParent = false,
  });

  SessionMediaModel copyWith({bool? isVisibleToParent}) => SessionMediaModel(
        id: id,
        type: type,
        url: url,
        title: title,
        isVisibleToParent: isVisibleToParent ?? this.isVisibleToParent,
      );
}

class AssignmentModel {
  final String id;
  final String title;
  final bool isSharedWithParent;

  const AssignmentModel({
    required this.id,
    required this.title,
    this.isSharedWithParent = false,
  });

  AssignmentModel copyWith({bool? isSharedWithParent}) => AssignmentModel(
        id: id,
        title: title,
        isSharedWithParent: isSharedWithParent ?? this.isSharedWithParent,
      );
}
