import 'package:ants_companion_flutter/app/app.dart';
import 'package:ants_companion_flutter/bootstrap/bootstrap.dart';

import 'package:ants_companion_flutter/domain/notifications/local_notifications.dart';

import 'package:flutter/material.dart';

void main() async {
  await bootstrap();
  await LocalNotifications.init();

  runApp(const App());
}
