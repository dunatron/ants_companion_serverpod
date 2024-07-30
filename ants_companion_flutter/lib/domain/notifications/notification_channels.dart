import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationChannels {
  static NotificationDetails channelOneDetails() {
    const androidNotificationDetails = AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const darwinNotificationDetails = DarwinNotificationDetails(
      subtitle: 'Darwin Subtitle',
      presentSound: true,
      presentAlert: true,
      presentBadge: true,
      presentBanner: true,
      presentList: true,
      interruptionLevel: InterruptionLevel.critical,
    );

    const notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      macOS: darwinNotificationDetails,
    );

    return notificationDetails;
  }

  static NotificationDetails periodicChannelDetails() {
    const androidNotificationDetails = AndroidNotificationDetails(
      'channel 2',
      'channel 2 name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const darwinNotificationDetails = DarwinNotificationDetails(
      subtitle: 'Darwin Subtitle',
    );

    const details = NotificationDetails(
      android: androidNotificationDetails,
      macOS: darwinNotificationDetails,
    );

    return details;
  }

  static NotificationDetails zonedScheduleChannelDetails() {
    const androidNotificationDetails = AndroidNotificationDetails(
      'channel 3',
      'channel 3 name',
      channelDescription: 'your channel description',
      ticker: 'ticker',
      priority: Priority.high,
      importance: Importance.max,
    );

    const darwinNotificationDetails = DarwinNotificationDetails(
      subtitle: 'Darwin Subtitle',
      presentSound: true,
      presentAlert: true,
      presentBadge: true,
      presentBanner: true,
      presentList: true,
      interruptionLevel: InterruptionLevel.critical,
    );

    const details = NotificationDetails(
      android: androidNotificationDetails,
      macOS: darwinNotificationDetails,
    );
    return details;
  }
}
