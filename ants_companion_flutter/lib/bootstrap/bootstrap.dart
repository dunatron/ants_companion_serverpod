import 'dart:async';

import 'package:ants_companion_flutter/app/app.dart';
import 'package:ants_companion_flutter/bootstrap/dependency_injection.dart';
import 'package:ants_companion_flutter/core/log/loggers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> bootstrap(Widget child) async {
  final logger = appLogger(App);
  WidgetsFlutterBinding.ensureInitialized();

  // unawaited(MobileAds.instance.initialize());

  FlutterError.onError = (errorDetails) {
    logger.e(errorDetails.exception);
    // FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    logger.e('Unhandled error ${error.toString()}', stackTrace: stack);
    // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  await setupDI();

  runApp(child);
}
