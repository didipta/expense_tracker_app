import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

import '../../core/network/interceptors/core_interceptor.dart';
import '../../core/network/interceptors/logger_inceptor.dart';
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
      accessToken: Configurations.token,
    ),
    RetryInterceptor(dio: dio, retries: 3,retryDelays: [
      const Duration(seconds: 5),
      const Duration(seconds: 10),
      const Duration(seconds: 15),

    ]),
    // RefreshTokenInterceptor
  ];

  dio.interceptors.addAll(interceptors);

  return dio;
}
