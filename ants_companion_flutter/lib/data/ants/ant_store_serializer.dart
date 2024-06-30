import 'package:ants_companion_client/ants_companion_client.dart';
import 'package:ants_companion_flutter/data/store/store_serializer.dart';

class AntStoreSerializer implements StoreSerializer<Ant> {
  static String makeKey(String antId) => 'ant_$antId';

  @override
  String getKey(Ant ant) {
    return makeKey(ant.id.toString());
  }

  @override
  Map<String, dynamic> toMap(Ant ant) {
    return ant.toJson();
  }

  @override
  Ant fromMap(Map<String, dynamic> map) {
    return Ant.fromJson(map);
  }
}
