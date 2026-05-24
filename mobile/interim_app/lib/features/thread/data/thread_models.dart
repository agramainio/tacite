class PreparationThread {
  const PreparationThread({
    required this.id,
    required this.kind,
    required this.title,
    required this.status,
    required this.createdAt,
    this.userGoal,
    this.startedOn,
    this.endedOn,
  });

  factory PreparationThread.fromJson(Map<String, dynamic> json) {
    return PreparationThread(
      id: json['id'] as String,
      kind: json['kind'] as String,
      title: json['title'] as String,
      status: json['status'] as String,
      userGoal: json['user_goal'] as String?,
      startedOn: json['started_on'] as String?,
      endedOn: json['ended_on'] as String?,
      createdAt: json['created_at'] as String,
    );
  }

  final String id;
  final String kind;
  final String title;
  final String status;
  final String? userGoal;
  final String? startedOn;
  final String? endedOn;
  final String createdAt;
}
