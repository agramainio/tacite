import 'package:dio/dio.dart';

import '../../app/app_config.dart';
import '../auth/session_store.dart';

class InterimApiClient {
  InterimApiClient({required this.dio, required this.sessionStore}) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await sessionStore.readAccessToken();

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },
      ),
    );
  }

  factory InterimApiClient.defaultClient() {
    return InterimApiClient(
      dio: Dio(
        BaseOptions(
          baseUrl: AppConfig.apiBaseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 20),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      ),
      sessionStore: const SessionStore(),
    );
  }

  final Dio dio;
  final SessionStore sessionStore;
}
