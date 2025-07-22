import 'package:dio/dio.dart';

class CoreInterceptor extends Interceptor {
  final String basePath;
  final String Function() getAccessToken;

  CoreInterceptor({required this.basePath, required this.getAccessToken});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.path = basePath + options.path;
    final token = getAccessToken();
    if (token.isNotEmpty) {
      options.headers.addAll({'Authorization': 'Bearer $token'});
    }
    handler.next(options);
  }
}
