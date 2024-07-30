import 'package:ants_companion_flutter/data/colony_actions/colony_actions_generator.dart';
import 'package:ants_companion_flutter/data/colony_actions/datasource/colony_actions_datasource.dart';

import 'package:ants_companion_flutter/domain/colony_actions.dart/colony_actions.dart';
import 'package:ants_companion_flutter/domain/colony_actions.dart/models/colony_action.dart';
import 'package:rxdart/subjects.dart';

class ColonyActionsRepository implements ColonyActionsProvider {
  ColonyActionsRepository(this._datasource) {
    _initWeeklyList();
  }
  final ColonyActionsDatasource _datasource;

  // final _weeklyListSubject = BehaviorSubject<List<ColonyAction>>.seeded(
  //   ColonyActionsGenerator.generateList(),
  // );
  final _weeklyListSubject = BehaviorSubject<List<ColonyAction>>.seeded([]);

  _initWeeklyList() {
    final items = _datasource.allColonyActions();

    if (items.isEmpty) {
      final generatedList = ColonyActionsGenerator.generateList();
      _datasource.addColonyActions(generatedList);
      _weeklyListSubject.add(generatedList);
    } else {
      _weeklyListSubject.add(items);
    }
  }

  @override
  Stream<List<ColonyAction>> weeklyList() => _weeklyListSubject.stream;

  @override
  Stream<ColonyAction?> byKey(String key) => _weeklyListSubject.stream
      .map((it) => it.firstWhere((ca) => ca.key == key));

  @override
  Future<void> updateColonyAction(ColonyAction item) async {
    await _datasource.updateColonyAction(item);
    final currentList = _weeklyListSubject.value;

    final replacementIndex = currentList.indexWhere((it) => it.key == item.key);

    currentList[replacementIndex] = item;

    _weeklyListSubject.add(currentList);
  }
}
