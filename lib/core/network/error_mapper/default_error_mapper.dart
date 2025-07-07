import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';

import '../models/network_resonse.dart';
import 'error_mapper.dart';

class DefaultErrorMapper implements ErrorMapper {
  final VoidCallback onUnauthorized;

  DefaultErrorMapper({
    required this.onUnauthorized,
  });
  @override
  NetworkResponse mapError(Exception e) {
    if (e is DioException) {
      if (e.response?.statusCode == 401) {
        //Todo: Redirect to login Screen
        //Let's decide from client end
        onUnauthorized();
        return NetworkResponse(statusCode: 401, data: e.response?.data);
      } else {
        return NetworkResponse(
          statusCode: e.response?.data,
          data: e.response?.data,
        );
      }
    } else {
      return NetworkResponse(statusCode: -1, data: "Something went wrong");
    }
  }
}
