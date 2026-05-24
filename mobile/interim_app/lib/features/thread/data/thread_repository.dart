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
}
