import 'package:ants_companion_flutter/data/store/store.dart';
import 'package:ants_companion_flutter/data/store/store_serializer.dart';

class StoreService {
  final Store _store;

  StoreService(this._store);

  T? get<T>(String key, StoreSerializer<T> serializer) {
    final map = _store.get(key);
    if (map == null) {
      return null;
    }
    return serializer.fromMap(map);
  }

  void put<T>(T value, StoreSerializer<T> serializer) {
    final key = serializer.getKey(value);
    final map = serializer.toMap(value);
    _store.put(key, map);
  }

  void putAll<T>(Iterable<T> items, StoreSerializer<T> serializer) {
    for (var item in items) {
      final key = serializer.getKey(item);
      final map = serializer.toMap(item);
      _store.put(key, map);
    }
  }

  void delete(String key) {
    _store.delete(key);
  }

  void deleteAll(Iterable<String> keys) {
    _store.deleteAll(keys);
  }

  void clear() {
    _store.clear();
  }

  Iterable<String> get keys => _store.keys;

  Future<void> dispose() async {
    await _store.dispose();
  }

  List<T> getAll<T>(StoreSerializer<T> serializer) {
    final List<T> items = [];
    for (final key in _store.keys) {
      try {
        final item = get(key, serializer);
        if (item != null) {
          items.add(item);
        }
      } catch (e) {
        // Handle deserialization errors if necessary
      }
    }
    return items;
  }
}
