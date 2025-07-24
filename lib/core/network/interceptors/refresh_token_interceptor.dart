import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../app/network_setup/configurations.dart';
import '../../services/authlocalStorageService.dart'; // update path as needed

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class RefreshTokenInterceptor extends Interceptor {
  final Dio dio;
  final Future<String> Function() onRefreshToken;
  final void Function(String newToken) onTokenUpdated;

  RefreshTokenInterceptor({
    required this.dio,
    required this.onRefreshToken,
    required this.onTokenUpdated,
  });

  bool _isRefreshing = false;
  final List<void Function()> _retryQueue = [];

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == '401' && !_isRefreshing) {
      _isRefreshing = true;

      try {
        final newToken = await onRefreshToken();
        onTokenUpdated(newToken);

        for (var retry in _retryQueue) {
          retry();
        }
        _retryQueue.clear();

        _isRefreshing = false;

        final opts = err.requestOptions;
        opts.headers['Authorization'] = 'Bearer $newToken';
        final cloneReq = await dio.fetch(opts);
        return handler.resolve(cloneReq);
      } catch (e) {
        _isRefreshing = false;

        // 👉 Clear auth data and navigate to login screen
        await Authlocalstorageservice.clearAuthData();

        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          '/login',
              (route) => false,
        );

        return handler.reject(err);
      }
    } else if (err.response?.statusCode == '401' && _isRefreshing) {
      _retryQueue.add(() {
        final opts = err.requestOptions;
        opts.headers['Authorization'] = 'Bearer ${Configurations.token}';
        dio.fetch(opts).then(
              (response) => handler.resolve(response),
          onError: (e) => handler.reject(e),
        );
      });
    } else {
      return handler.next(err);
    }
  }
}
