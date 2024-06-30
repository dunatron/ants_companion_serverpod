abstract class StoreSerializer<T> {
  Map<String, dynamic> toMap(T object);

  T fromMap(Map<String, dynamic> map);

  static makeKey(dynamic value) => value;

  String getKey(T object);
}
