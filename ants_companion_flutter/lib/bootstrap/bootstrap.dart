import 'dart:async';

import 'package:ants_companion_flutter/bootstrap/dependency_injection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> bootstrap(Widget child) async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // unawaited(MobileAds.instance.initialize());

  FlutterError.onError = (errorDetails) {
    // FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  setupDI();

  // final dir = await getApplicationDocumentsDirectory();
  // final isar = await Isar.open(
  //   [HatchRecordingSchema],
  //   directory: dir.path,
  // );

  runApp(child);
}
