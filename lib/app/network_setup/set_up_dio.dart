import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:expense_tracker_app/core/network/interceptors/unauthorized_interceptor.dart';

import '../../core/network/interceptors/core_interceptor.dart';
import '../../core/network/interceptors/logger_inceptor.dart';
import '../../core/network/interceptors/refresh_token_interceptor.dart';
import 'configurations.dart';

Dio getDioInstance() {
  BaseOptions dioOption = BaseOptions(
    baseUrl: Configurations.baseUrl,
    connectTimeout: Configurations.connectTimeout,
    receiveTimeout: Configurations.receiveTimeout,
    sendTimeout: Configurations.sendTimeout,
    headers: {'Content-Type': 'application/json'},
  );

  final Dio dio = Dio(dioOption);

  List<Interceptor> interceptors = [
    LoggerInterceptor(),
    CoreInterceptor(
      basePath: Configurations.baseUrl,
      getAccessToken: () => Configurations.token,
    ),
    RefreshTokenInterceptor(
      dio: dio,
      onRefreshToken: () async {
        final response = await dio.post('/auth/refresh', data: {
          'refresh_token': Configurations.refreshToken,
        });
        return response.data['access_token'];
      },
      onTokenUpdated: (String newToken) {
        Configurations.token = newToken;
      },
    ),
    RetryInterceptor(
      dio: dio,
      retries: 3,
      retryDelays: const [
        Duration(seconds: 5),
        Duration(seconds: 10),
        Duration(seconds: 15),
      ],
    ),
    UnauthorizedInterceptor(), // Should come after RefreshTokenInterceptor
  ];


  dio.interceptors.addAll(interceptors);

  return dio;
}
