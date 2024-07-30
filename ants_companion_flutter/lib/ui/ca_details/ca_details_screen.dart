import 'package:ants_companion_flutter/domain/colony_actions.dart/colony_actions.dart';
import 'package:ants_companion_flutter/ui/ca_scheduler/ca_info_extension.dart';
import 'package:ants_companion_flutter/ui/ca_scheduler/ca_name_extension.dart';
import 'package:ants_companion_flutter/ui/layouts/page_layout.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ColonyActionDetailsScreen extends StatelessWidget {
  const ColonyActionDetailsScreen({super.key, required this.caKey});

  final String caKey;

  @override
  Widget build(BuildContext context) {
    final caName = caKey.colonyActionName();
    final tasks = CATask.colonyActionTaskList(caKey);

    return PageLayout(
      title: caName,
      slivers: [
        SliverToBoxAdapter(
          child: ColonyActionNotificationDetails(caKey: caKey),
        ),
        SliverList.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];

            return ListTile(
              title: Text(task.title),
              subtitle: Text(task.points.toString()),
            );
          },
        )
      ],
    );
  }
}

class ColonyActionNotificationDetails extends StatelessWidget {
  ColonyActionNotificationDetails({super.key, required this.caKey});

  final String caKey;

  final ColonyActions _colonyActions = GetIt.I();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _colonyActions.byKey(caKey),
      builder: (context, snapshot) {
        final colonyAction = snapshot.data;

        if (colonyAction == null) {
          return Container();
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${colonyAction.hour} UTC'),
            IconButton(
              onPressed: () {
                _colonyActions.updateColonyAction(
                  colonyAction.copyWith(
                    notificationEnabled: !colonyAction.notificationEnabled,
                  ),
                );
              },
              icon: Icon(
                colonyAction.notificationEnabled
                    ? Icons.notifications_active
                    : Icons.notifications_off,
                color: colonyAction.notificationEnabled
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }
}
