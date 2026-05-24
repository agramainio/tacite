import '../../shared/api/interim_api_client.dart';
import '../../shared/auth/session_store.dart';
import 'auth_models.dart';

class AuthRepository {
  AuthRepository({
    required InterimApiClient apiClient,
    required SessionStore sessionStore,
  }) : _apiClient = apiClient,
       _sessionStore = sessionStore;

  factory AuthRepository.defaultRepository() {
    const sessionStore = SessionStore();

    return AuthRepository(
      apiClient: InterimApiClient.defaultClient(),
      sessionStore: sessionStore,
    );
  }

  final InterimApiClient _apiClient;
  final SessionStore _sessionStore;

  Future<String?> requestLoginCode(String email) async {
    final response = await _apiClient.dio.post<Map<String, dynamic>>(
      '/auth/request-code',
      data: {'email': email},
    );

    return response.data?['dev_code'] as String?;
  }

  Future<AuthProfile> verifyLoginCode({
    required String email,
    required String code,
  }) async {
    final response = await _apiClient.dio.post<Map<String, dynamic>>(
      '/auth/verify-code',
      data: {'email': email, 'code': code},
    );

    final data = response.data ?? <String, dynamic>{};
    final token = data['access_token'] as String;
    final profile = AuthProfile.fromJson(
      data['profile'] as Map<String, dynamic>,
    );

    await _sessionStore.saveAccessToken(token);

    return profile;
  }

  Future<AuthProfile> me() async {
    final response = await _apiClient.dio.get<Map<String, dynamic>>('/me');

    return AuthProfile.fromJson(response.data ?? <String, dynamic>{});
  }

  Future<void> logout() {
    return _sessionStore.clear();
  }
}
