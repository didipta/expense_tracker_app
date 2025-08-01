import 'package:firebase_core/firebase_core.dart';
import 'package:expense_tracker_app/firebase_options.dart';

class FirebaseInitializer {
  static Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
