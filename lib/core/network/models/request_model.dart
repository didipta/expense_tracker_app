import 'package:dio/dio.dart';

class RequestModel {
  final String path;
  final Map<String, dynamic>? queryParams;
  final FormData? formData;
  final Map<String, dynamic>? headers;

  RequestModel({
    required this.path,
    this.queryParams = const {},
    this.formData,
    this.headers,
  });
}
