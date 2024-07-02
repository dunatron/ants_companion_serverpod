import 'package:ants_companion_client/ants_companion_client.dart' as api;
import 'package:ants_companion_flutter/data/ants/mappers/ant_role_mappers.dart';
import 'package:ants_companion_flutter/data/ants/models/ant.dart' as store;
import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:ants_companion_flutter/data/ants/mappers/ant_type_mappers.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant_role.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant_type.dart';

extension AntListToDomainExtension on List<api.Ant> {
  List<Ant> toDomain() => map((it) => it.toDomain()).toList();
}

extension AntsListFromDomainExtension on List<Ant> {
  List<store.Ant> toStoreModel() => map((e) => e.toStoreModel()).toList();
}

extension AntFromDomainExtension on Ant {
  api.Ant toApiModel() => api.Ant(
        name: name,
        description: description,
        type: type.toApiModel(),
        role: role.toApiModel(),
        createdAt: DateTime.now(),
      );

  store.Ant toStoreModel() => store.Ant(
        id: id,
        name: name,
        description: description,
        type: type.toStoreModel(),
        role: role.toStoreModel(),
        // createdAt: DateTime.now(),
      );
}

extension AntApiModelToDomainExtension on api.Ant {
  Ant toDomain() => Ant(
        id: id.toString(),
        name: name,
        description: description,
        type: type.toDomain(),
        role: role.toDomain(),
      );
}

extension AntsListStoreModelToDomainExtension on List<store.Ant> {
  List<Ant> toDomain() => map((e) => e.toDomain()).toList();
}

extension AntStoreModelToDomainExtension on store.Ant {
  Ant toDomain() => Ant(
        id: id.toString(),
        name: name,
        description: description,
        type: AntType.carrier,
        role: AntRole.melee,
      );
}
