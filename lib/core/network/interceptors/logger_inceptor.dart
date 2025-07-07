import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
class LoggerInterceptor extends Interceptor{
  final Logger _logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String message = ''' 
    Url: ${options.path}
    Request method: ${options.method}
    Request data: ${options.data}
    Headers: ${options.headers}
    Query Params: ${options.queryParameters}
    ''';
    _logger.d(message);

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String message = ''' 
    Url: ${response.realUri}
    Headers: ${response.headers}
    Response status code: ${response.statusCode}
    Response data: ${response.data}
    ''';
    _logger.i(message);

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String message = ''' 
    Url: ${err.requestOptions.baseUrl}
    Headers: ${err.requestOptions.headers}
    Response status code: ${err.response?.statusCode}
    Response data: ${err.response?.data}
    Error response: ${err.response}
    ''';
    _logger.e(message);

    super.onError(err, handler);
  }

}