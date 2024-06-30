import 'package:ants_companion_flutter/data/store/store.dart';

class InMemoryStore extends Store {
  final Map<String, Map<String, dynamic>?> _storage = {};

  @override
  Iterable<String> get keys => _storage.keys;

  @override
  Map<String, dynamic>? get(String key) => _storage[key];

  @override
  void put(String key, Map<String, dynamic>? value) {
    _storage[key] = value;
  }

  @override
  void delete(String key) {
    _storage.remove(key);
  }

  @override
  void deleteAll(Iterable<String> keys) {
    for (var key in keys) {
      _storage.remove(key);
    }
  }

  @override
  void clear() {
    _storage.clear();
  }

  @override
  Future<void> dispose() async {
    _storage.clear();
  }
}
