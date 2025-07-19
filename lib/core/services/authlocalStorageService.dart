import 'package:shared_preferences/shared_preferences.dart';

class Authlocalstorageservice {
  static const _accessTokenKey = 'access_token';
  static const _accessTokenExpiryKey = 'access_token_expiry';
  static const _refreshTokenKey = 'refresh_token';
  static const _refreshTokenExpiryKey = 'refresh_token_expiry';
  static const _userIdKey = 'user_id';
  static const _userEmailKey = 'user_email';
  static const _userFullNameKey = 'user_full_name';
  static const _userAvatarUrlKey = 'user_avatar_url';

  static Future<void> saveAuthData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();

    final accessToken = data['accessToken'];
    final refreshToken = data['refreshToken'];
    final user = data['user'];

    await prefs.setString(_accessTokenKey, accessToken['token']);
    await prefs.setInt(_accessTokenExpiryKey, accessToken['expiration']);

    await prefs.setString(_refreshTokenKey, refreshToken['token']);
    await prefs.setInt(_refreshTokenExpiryKey, refreshToken['expiration']);

    await prefs.setInt(_userIdKey, user['id']);
    await prefs.setString(_userEmailKey, user['email']);
    await prefs.setString(_userFullNameKey, user['fullName']);
    await prefs.setString(_userAvatarUrlKey, user['avatarUrl'] ?? '');
  }

  static Future<Map<String, dynamic>> getAuthData() async {
    final prefs = await SharedPreferences.getInstance();

    return {
      'accessToken': {
        'token': prefs.getString(_accessTokenKey),
        'expiration': prefs.getInt(_accessTokenExpiryKey),
      },
      'refreshToken': {
        'token': prefs.getString(_refreshTokenKey),
        'expiration': prefs.getInt(_refreshTokenExpiryKey),
      },
      'user': {
        'id': prefs.getInt(_userIdKey),
        'email': prefs.getString(_userEmailKey),
        'fullName': prefs.getString(_userFullNameKey),
        'avatarUrl': prefs.getString(_userAvatarUrlKey),
      }
    };
  }

  static Future<void> clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
