import '../../../shared/api/interim_api_client.dart';
import 'thread_models.dart';

class ThreadRepository {
  ThreadRepository({required InterimApiClient apiClient})
    : _apiClient = apiClient;

  factory ThreadRepository.defaultRepository() {
    return ThreadRepository(apiClient: InterimApiClient.defaultClient());
  }

  final InterimApiClient _apiClient;

  Future<List<PreparationThread>> listThreads() async {
    final response = await _apiClient.dio.get<List<dynamic>>('/threads');
    final data = response.data ?? <dynamic>[];

    return data
        .cast<Map<String, dynamic>>()
        .map(PreparationThread.fromJson)
        .toList();
  }

  Future<PreparationThread> createThread({
    required String kind,
    required String title,
    String? userGoal,
  }) async {
    final response = await _apiClient.dio.post<Map<String, dynamic>>(
      '/threads',
      data: {
        'kind': kind,
        'title': title,
        if (userGoal != null && userGoal.trim().isNotEmpty)
          'user_goal': userGoal,
      },
    );

    return PreparationThread.fromJson(response.data ?? <String, dynamic>{});
  }

  Future<List<RawNote>> listRawNotes(String threadId) async {
    final response = await _apiClient.dio.get<List<dynamic>>(
      '/threads/$threadId/notes',
    );
    final data = response.data ?? <dynamic>[];

    return data.cast<Map<String, dynamic>>().map(RawNote.fromJson).toList();
  }

  Future<RawNote> createRawNote({
    required String threadId,
    required String originalText,
    String inputMode = 'text',
  }) async {
    final localDate = DateTime.now().toIso8601String().split('T').first;

    final response = await _apiClient.dio.post<Map<String, dynamic>>(
      '/threads/$threadId/notes',
      data: {
        'original_text': originalText,
        'input_mode': inputMode,
        'user_local_date': localDate,
      },
    );

    return RawNote.fromJson(response.data ?? <String, dynamic>{});
  }

  Future<List<TimelineEvent>> listTimelineEvents(String threadId) async {
    final response = await _apiClient.dio.get<List<dynamic>>(
      '/threads/$threadId/timeline',
    );
    final data = response.data ?? <dynamic>[];

    return data
        .cast<Map<String, dynamic>>()
        .map(TimelineEvent.fromJson)
        .toList();
  }

  Future<TimelineEvent> createTimelineEvent({
    required String threadId,
    required String rawNoteId,
    required String eventType,
    required String title,
    required String userApprovedSummary,
  }) async {
    final eventDate = DateTime.now().toIso8601String().split('T').first;

    final response = await _apiClient.dio.post<Map<String, dynamic>>(
      '/threads/$threadId/timeline-events',
      data: {
        'raw_note_id': rawNoteId,
        'event_type': eventType,
        'event_date': eventDate,
        'event_date_precision': 'exact',
        'title': title,
        'user_approved_summary': userApprovedSummary,
      },
    );

    return TimelineEvent.fromJson(response.data ?? <String, dynamic>{});
  }
}
