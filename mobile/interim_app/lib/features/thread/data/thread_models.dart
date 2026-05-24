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

class RawNote {
  const RawNote({
    required this.id,
    required this.threadId,
    required this.originalText,
    required this.inputMode,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    this.userLocalDate,
    this.rawEmojis,
  });

  factory RawNote.fromJson(Map<String, dynamic> json) {
    return RawNote(
      id: json['id'] as String,
      threadId: json['thread_id'] as String,
      originalText: json['original_text'] as String,
      inputMode: json['input_mode'] as String,
      userLocalDate: json['user_local_date'] as String?,
      rawEmojis: json['raw_emojis'],
      isDeleted: json['is_deleted'] as bool,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }

  final String id;
  final String threadId;
  final String originalText;
  final String inputMode;
  final String? userLocalDate;
  final Object? rawEmojis;
  final bool isDeleted;
  final String createdAt;
  final String updatedAt;
}

class TimelineEvent {
  const TimelineEvent({
    required this.id,
    required this.threadId,
    required this.eventType,
    required this.eventDatePrecision,
    required this.title,
    required this.userApprovedSummary,
    required this.source,
    required this.createdAt,
    required this.updatedAt,
    this.rawNoteId,
    this.eventDate,
  });

  factory TimelineEvent.fromJson(Map<String, dynamic> json) {
    return TimelineEvent(
      id: json['id'] as String,
      threadId: json['thread_id'] as String,
      rawNoteId: json['raw_note_id'] as String?,
      eventType: json['event_type'] as String,
      eventDate: json['event_date'] as String?,
      eventDatePrecision: json['event_date_precision'] as String,
      title: json['title'] as String,
      userApprovedSummary: json['user_approved_summary'] as String,
      source: json['source'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }

  final String id;
  final String threadId;
  final String? rawNoteId;
  final String eventType;
  final String? eventDate;
  final String eventDatePrecision;
  final String title;
  final String userApprovedSummary;
  final String source;
  final String createdAt;
  final String updatedAt;
}
