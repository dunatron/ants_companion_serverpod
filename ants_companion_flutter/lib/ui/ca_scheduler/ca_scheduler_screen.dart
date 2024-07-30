import 'dart:async';

import 'package:ants_companion_flutter/domain/colony_actions.dart/colony_actions.dart';
import 'package:ants_companion_flutter/domain/colony_actions.dart/models/colony_action.dart';
import 'package:ants_companion_flutter/domain/notifications/local_notifications.dart';
import 'package:ants_companion_flutter/ui/ca_scheduler/ca_info_extension.dart';
import 'package:ants_companion_flutter/ui/ca_scheduler/ca_name_extension.dart';

import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class CASchedulerScreen extends StatefulWidget {
  const CASchedulerScreen({super.key});

  @override
  State<CASchedulerScreen> createState() => _CASchedulerScreenState();
}

class _CASchedulerScreenState extends State<CASchedulerScreen> {
  List<ColonyAction> weeklySchedule = [];

  final ColonyActions _colonyActions = GetIt.I();

  StreamSubscription<List<ColonyAction>>? _sub;

  @override
  void initState() {
    super.initState();
    _sub = _colonyActions.weeklyList().listen(
      (event) {
        setState(() {
          weeklySchedule = event;
        });
      },
    );
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  viewColonyActionTasks(ColonyAction colonyAction) {
    // final info = colonyAction.key.colonyActionPointsInfo();
    final taskList = CATask.colonyActionTaskList(colonyAction.key);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: ListView.builder(
            itemCount: taskList.length,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            itemBuilder: (context, index) {
              final item = taskList[index];

              return Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '+${item.points.toString()}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              );
              // return ListTile(
              //   leading: Text(item.title),
              //   trailing: Text(item.points.toString()),
              // );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Scheduler'),
      ),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, dayIndex) {
          final warzoneName = dayIndex.warzoneDayName();
          return ExpansionTile(
            title: Text(warzoneName),
            children: List.generate(
              24,
              (hourIndex) {
                final key =
                    ColonyAction.makeKey(day: dayIndex, hour: hourIndex);
                final item = weeklySchedule.firstWhere(
                  (it) => it.key == key,
                );

                final caName = key.colonyActionName();

                return ListTile(
                  // leading: Text('${item.key}: $caName\n${item.date.toUtc()}'),
                  onTap: () {
                    context.go('/ca-scheduler/${item.key}');
                  },
                  subtitle: RichText(
                    text: TextSpan(
                      text: '$caName\n',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                            text: '${item.date.toUtc().hour} UTC',
                            style: TextStyle(fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  leading: IconButton(
                    onPressed: () {
                      viewColonyActionTasks(item);
                    },
                    icon: const Icon(Icons.info_outlined),
                  ),
                  trailing: Checkbox(
                    value: item.notificationEnabled,
                    onChanged: (v) async {
                      if (v == true) {
                        LocalNotifications.scheduleColonyActionNotification(
                          id: item.order,
                          title: '${item.key}: $caName',
                          body: '${item.key}: ${item.date.toUtc()}',
                          payload: 'payload',
                          date: item.date,
                        );
                      }

                      _colonyActions.updateColonyAction(item.copyWith(
                        notificationEnabled: v,
                      ));
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

extension on int {
  String warzoneDayName() {
    final val = switch (this) {
      0 => 'Anthill development',
      1 => 'Gather Resources',
      2 => 'Evolution',
      3 => 'Strengthen Special Ants',
      4 => 'Hatch Soldier Ants',
      5 => 'Free choice',
      6 => 'Insect Hatching',
      int() => throw UnimplementedError(),
    };
    return val;
  }
}
