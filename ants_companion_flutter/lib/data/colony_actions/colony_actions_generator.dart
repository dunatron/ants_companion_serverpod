import 'package:ants_companion_flutter/domain/colony_actions.dart/models/colony_action.dart';

class ColonyActionsGenerator {
  static List<ColonyAction> generateList() {
    final weeklyList = List.generate(7, (_) => List.generate(24, (_) => false));

    final items = <ColonyAction>[];

    int order = 0;

    DateTime date = getLastMondayInUTC().add(const Duration(minutes: 5));

    for (int day = 0; day < weeklyList.length; day++) {
      for (int hour = 0; hour < 24; hour++) {
        items.add(
          ColonyAction(
            key: ColonyAction.makeKey(day: day, hour: hour),
            order: order,
            date: date,
            day: date.weekday,
            hour: hour,
            notificationEnabled: false,
          ),
        );

        date = date.add(const Duration(hours: 1));
        order++;
      }
      order++;
    }
    return items;
  }

  static DateTime getLastMondayInUTC() {
    DateTime now = DateTime.now().toUtc();
    // Calculate how many days have passed since the last Monday
    int daysSinceLastMonday = now.weekday - DateTime.monday;
    if (daysSinceLastMonday < 0) {
      daysSinceLastMonday += 7;
    }
    // Subtract the number of days since the last Monday from the current date
    DateTime lastMonday = now.subtract(Duration(days: daysSinceLastMonday));
    // Reset the time to the start of the day (midnight)
    lastMonday =
        DateTime.utc(lastMonday.year, lastMonday.month, lastMonday.day);
    return lastMonday;
  }
}
