import 'package:ants_companion_flutter/data/_model_type_ids.dart';
import 'package:ants_companion_flutter/data/ants/models/ant_role.dart';
import 'package:ants_companion_flutter/data/ants/models/ant_type.dart';

import 'package:hive/hive.dart';

part 'ant.g.dart';

@HiveType(typeId: ModelTypeIds.ant)
class Ant {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final AntType type;

  @HiveField(4)
  final AntRole role;

  @HiveField(5)
  final String? profileImageUrl;

  Ant({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.role,
    required this.profileImageUrl,
  });

  @override
  String toString() {
    return 'id: $id, name: $name, description: $description, role: $role, profileImageUrl: $profileImageUrl';
  }
}
