import 'package:ants_companion_client/ants_companion_client.dart';
import 'package:ants_companion_flutter/domain/models/ant.dart' as domain;

extension AntToDataExtension on domain.Ant {
  Ant toData() {
    return Ant(
      name: name,
      description: description,
      type: AntType.carrier,
      role: AntRole.ranged,
      createdAt: DateTime.now(),
    );
  }
}
