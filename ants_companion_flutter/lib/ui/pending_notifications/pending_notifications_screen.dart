import 'package:ants_companion_flutter/domain/notifications/local_notifications.dart';
import 'package:ants_companion_flutter/ui/layouts/page_layout.dart';
import 'package:flutter/material.dart';

class PendingNotificationsScreen extends StatelessWidget {
  const PendingNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: 'Pending Notifications',
      slivers: [
        FutureBuilder(
          future: LocalNotifications.pendingNotifications(),
          builder: (context, snapshot) {
            final data = snapshot.data;

            if (data == null) {
              return const SliverToBoxAdapter(child: SizedBox());
            }

            return SliverList.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];

                return ListTile(
                  title: Text(item.title ?? ''),
                  subtitle: Text(item.body ?? ''),
                );
              },
            );
          },
        )
      ],
    );
  }
}
