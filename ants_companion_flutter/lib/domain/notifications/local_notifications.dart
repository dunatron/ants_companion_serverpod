import 'dart:io';

import 'package:ants_companion_flutter/domain/notifications/notification_channels.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'package:flutter_timezone/flutter_timezone.dart';

var count = 22;

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}

Future<void> _configureLocalTimeZone() async {
  if (kIsWeb || Platform.isLinux) {
    return;
  }
  tz.initializeTimeZones();
  final String timeZoneName = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName));
}

class LocalNotifications {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static final onClickNotification = BehaviorSubject<String>();

  // on tap any notification
  static void onNotificationTap(
    NotificationResponse notificationResponse,
  ) {
    onClickNotification.add(notificationResponse.payload!);
  }

  /// Initialize the local notifications plugin.
  /// must be awaited before running the main app
  static Future init() async {
    _configureLocalTimeZone();
    // final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    // initialize the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final initializationSettingsDarwin = DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) {},
    );
    const initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');

    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
      linux: initializationSettingsLinux,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onNotificationTap,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  static Future<List<PendingNotificationRequest>> pendingNotifications() async {
    final v =
        await _flutterLocalNotificationsPlugin.pendingNotificationRequests();

    return v;
  }

  static Future showSimpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    // if (kIsWeb) {
    //   /// import 'dart:html' as html;
    //   /// import 'dart:js_util';
    //   // window.callMethod("showNotification", ["Title", "custom message"]);
    //   //callMethod(html.window, "showNotification", ["Title", "custom message"]);

    //   return;
    // }

    count++;

    await _flutterLocalNotificationsPlugin.show(
      // 0,
      count,
      title,
      body,
      NotificationChannels.channelOneDetails(),
      payload: payload,
    );
  }

  /// show a periodic notification at a regular interval
  static Future showPeriodicNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    await _flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      title,
      body,
      RepeatInterval.everyMinute,
      NotificationChannels.channelOneDetails(),
    );
  }

  static Future cancelNotificationChannel(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  static Future cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  static Future scheduleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    tz.initializeTimeZones();

    return _zonedScheduleNotification(
      title: title,
      body: body,
      payload: payload,
    );
  }

  static Future<void> _zonedScheduleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    /// we want to use this. and schedule the DateTimeComponents.dayOfWeekAndTime
    /// this will fir it weekly on the same day and time
    final scheduledDate = tz.TZDateTime.now(tz.local).add(
      const Duration(seconds: 5),
    );

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      3,
      title,
      body,
      scheduledDate,
      NotificationChannels.zonedScheduleChannelDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static Future<void> scheduleColonyActionNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
    required DateTime date,
  }) async {
    await requestPermissions();
    final scheduledDate = tz.TZDateTime.from(date, tz.local);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      NotificationChannels.zonedScheduleChannelDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static Future<bool> areNotificationsEnabled() async {
    // _flutterLocalNotificationsPlugin.
    final enabled = await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.areNotificationsEnabled();
    return enabled ?? true;
  }

  static Future<void> requestPermissions() async {
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestExactAlarmsPermission();

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestFullScreenIntentPermission();

    // if (Platform.isIOS || Platform.isMacOS) {
    //   await _flutterLocalNotificationsPlugin
    //       .resolvePlatformSpecificImplementation<
    //           IOSFlutterLocalNotificationsPlugin>()
    //       ?.requestPermissions(
    //         alert: true,
    //         badge: true,
    //         sound: true,
    //       );
    //   await _flutterLocalNotificationsPlugin
    //       .resolvePlatformSpecificImplementation<
    //           MacOSFlutterLocalNotificationsPlugin>()
    //       ?.requestPermissions(
    //         alert: true,
    //         badge: true,
    //         sound: true,
    //       );
    // } else if (Platform.isAndroid) {}
  }

  static Future<void> scheduleHourlyNotifications() async {
    print('scheduleHourlyNotifications');

    final now = tz.TZDateTime.now(tz.UTC);

    final firstTrigger = now.minute < 5
        ? tz.TZDateTime(tz.UTC, now.year, now.month, now.day, now.hour, 5)
        : tz.TZDateTime(tz.UTC, now.year, now.month, now.day, now.hour + 1, 5);

    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your_CA_channel_id',
      'your_CA_channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );
    const platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      12,
      'Scheduled Hourly Notification',
      'This is your notification scheduleHourlyNotifications',
      firstTrigger,
      platformChannelSpecifics,
      // androidAllowWhileIdle: true,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> _scheduleWeeklyNotifications() async {}

  Future<void> _scheduleNotification(
    int day,
    int hour,
    int notificationId,
  ) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );
    const platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    final now = tz.TZDateTime.now(tz.local);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId,
      'Scheduled Notification',
      'This is your notification for Day ${day + 1} at $hour:00',
      now,
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      // matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,

      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );
  }
}
