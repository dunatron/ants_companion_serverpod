import 'package:flutter/foundation.dart';

class MultiSelectController<T> extends ChangeNotifier {
  // This notifier is used to trigger updates manually
  final ValueNotifier<int> _updateNotifier = ValueNotifier<int>(0);
  ValueNotifier<int> get updateNotifier => _updateNotifier;

  List<T> _items = [];

  List<T> _selected = [];

  Set<T> _changedItems = {};

  Set<T> get changedItems => Set.unmodifiable(_changedItems);

  // List<T> get items => List.unmodifiable(_items);

  // List<T> get selected => List.unmodifiable(_selected);
  List<T> get items => _items;

  List<T> get selected => _selected;

  void clearItems() {
    _items.clear();
    notifyListeners();
  }

  void setItems(List<T> items) {
    _items = items;
    notifyListeners();
  }

  void toggleItem(T item) {
    if (_selected.contains(item)) {
      _selected.remove(item);
    } else {
      _selected.add(item);
    }

    // _changedItems.add(item); // Mark the item as changed
    _changedItems = {item}; // Mark the item as changed
    _updateNotifier.value++; // Increment the notifier to trigger updates
    notifyListeners();
  }
}
