// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginheader => 'Welcome back! Glad to see you, Again!';

  @override
  String get emailinput => 'Enter your email';

  @override
  String get passwordinput => 'Enter your password';

  @override
  String get forgotpassword => 'Forgot Password?';

  @override
  String get loginbutton => 'Login';

  @override
  String get orloginwith => 'Or login with';

  @override
  String get registernow => 'Register Now';

  @override
  String get dontaccount => 'Don\\\'t have an account?';
}
