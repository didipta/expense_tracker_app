import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../services/authlocalStorageService.dart';

// Global navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class UnauthorizedInterceptor extends Interceptor {
  bool _handledUnauthorized = false;

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !_handledUnauthorized) {
      _handledUnauthorized = true;

      // Clear local storage
      await Authlocalstorageservice.clearAuthData();

      // Navigate to login
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        '/login', // Replace with your actual login route
            (route) => false,
      );
    }

    handler.next(err);
  }
}
