import 'package:ants_companion_flutter/domain/notifications/local_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationTests extends StatefulWidget {
  const NotificationTests({super.key});

  @override
  State<NotificationTests> createState() => _NotificationTestsState();
}

class _NotificationTestsState extends State<NotificationTests> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listenToNotifications();
    // listen to any notification clicked or not
  }

  listenToNotifications() {
    print('Listening to notifications');
    LocalNotifications.onClickNotification.stream.listen((event) {
      context.go('/ca-scheduler/2-2');

      // context.go('/tier-ratings');
      // Navigator.push(context, route);
      // GoRouter
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            LocalNotifications.requestPermissions();
          },
          child: const Text('Request Permissions'),
        ),
        ElevatedButton(
          onPressed: () {
            LocalNotifications.showSimpleNotification(
              title: 'Ant Colony Action\n',
              body:
                  'Do not miss you next CA it is soldier ant hatch hour so get ready!!!',
              payload: 'Simple Notification',
            );
          },
          child: const Text('Simple Notification'),
        ),
        ElevatedButton(
          onPressed: () {
            LocalNotifications.showPeriodicNotification(
              title: 'Periodic Notification\n',
              body:
                  'Do not miss you next CA it is soldier ant hatch hour so get ready!!!',
              payload: 'payload',
            );
          },
          child: const Text('Periodic Notification'),
        ),
        ElevatedButton(
          onPressed: () {
            LocalNotifications.scheduleNotification(
              title: 'Scheduled Notification\n',
              body:
                  'Do not miss you next CA it is soldier ant hatch hour so get ready!!!',
              payload: 'payload',
            );
          },
          child: const Text('Scheduled Notification'),
        ),
        ElevatedButton(
          onPressed: () {
            LocalNotifications.cancelNotificationChannel(1);
          },
          child: const Text('Cancel Channel'),
        ),
        ElevatedButton(
          onPressed: () {
            LocalNotifications.cancelAllNotifications();
          },
          child: const Text('Cancel All'),
        ),
        ElevatedButton(
          onPressed: () {
            LocalNotifications.scheduleHourlyNotifications();
          },
          child: const Text('scheduleHourlyNotifications'),
        ),
        FutureBuilder(
          future: LocalNotifications.areNotificationsEnabled(),
          builder: (context, snapshot) {
            final data = snapshot.data;

            if (data == null) {
              return const CircularProgressIndicator();
            }
            return Text(data ? 'YES' : 'NO');
          },
        )
      ],
    );
  }
}
