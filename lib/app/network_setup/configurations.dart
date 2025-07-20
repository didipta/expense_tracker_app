import '../../core/services/authlocalStorageService.dart';

class Configurations {
  static const String appName = 'MyApp';
  static const String baseUrl = 'http://54.90.81.111/api/v1/';
  static final Duration connectTimeout = Duration(seconds: 30);
  static final Duration receiveTimeout = Duration(seconds: 30);
  static final Duration sendTimeout = Duration(seconds: 30);

  static String token = ''; // ✅ Make it mutable

  static Future<void> loadTokenFromStorage() async {
    final authData = await Authlocalstorageservice.getAuthData();
    token = authData['accessToken']['token'] ?? '';
  }
}
