import 'dart:ui';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class CrashlyticsHandler {
  static void setup() {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  static void recordError(Object error, StackTrace stack, {bool fatal = false}) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: fatal);
  }
}
