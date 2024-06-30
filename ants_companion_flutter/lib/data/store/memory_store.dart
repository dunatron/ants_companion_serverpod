import 'dart:async';

import 'package:ants_companion_flutter/data/store/store.dart';
import 'package:rxdart/rxdart.dart';

class MemoryStore extends Store {
  MemoryStore([final Map<String, Map<String, dynamic>> initialData = const {}])
      : _valueStream = BehaviorSubject.seeded(initialData);

  final BehaviorSubject<Map<String, Map<String, dynamic>?>> _valueStream;

  @override
  Iterable<String> get keys => _valueStream.value.keys;

  @override
  Map<String, dynamic>? get(final String key) => _valueStream.value[key];

  @override
  void put(final String key, final Map<String, dynamic>? value) =>
      _valueStream.add(
        Map.from(_valueStream.value)..addAll({key: value}),
      );

  @override
  void delete(final String key) => _valueStream.add(
        Map.from(_valueStream.value)..remove(key),
      );

  @override
  void deleteAll(final Iterable<String> keys) => _valueStream.add(
        Map.from(_valueStream.value)
          ..removeWhere((final key, final _) => keys.contains(key)),
      );

  @override
  void clear() => _valueStream.add({});

  @override
  Future<void> dispose() => _valueStream.close();
}
