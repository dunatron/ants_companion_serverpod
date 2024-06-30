abstract class Store {
  Iterable<String> get keys;

  Map<String, dynamic>? get(final String key);

  void put(final String key, final Map<String, dynamic>? value);

  void delete(final String key);

  void deleteAll(final Iterable<String> keys);

  void clear();

  Future<void> dispose() async => {};
}
