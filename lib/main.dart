import 'dart:async';
import 'package:expense_tracker_app/app/serviceLocator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expense_tracker_app/app.dart';
import 'package:expense_tracker_app/core/firebase/firebase_initializer.dart';

import 'core/firebase/crashlytics/crashlytics_handler.dart';
import 'core/services/connectivity_service.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    ConnectivityService.listenConnectionStatus();

    await FirebaseInitializer.initialize();

    CrashlyticsHandler.setup();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    setUpServiceLocator();
    runApp(const ExpenseTrackerApp());
  }, (error, stackTrace) {
    CrashlyticsHandler.recordError(error, stackTrace, fatal: true);
  });
}
