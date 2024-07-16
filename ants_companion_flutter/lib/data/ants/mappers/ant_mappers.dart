import 'package:ants_companion_client/ants_companion_client.dart' as api;
import 'package:ants_companion_flutter/data/ants/mappers/ant_role_mappers.dart';

import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:ants_companion_flutter/data/ants/mappers/ant_type_mappers.dart';

extension AntListToDomainExtension on List<api.Ant> {
  List<Ant> toDomain() => map((it) => it.toDomain()).toList();
}

extension AntFromDomainExtension on Ant {
  api.Ant toApiModel() => api.Ant(
        id: int.tryParse(id),
        name: name,
        description: description,
        type: type.toApiModel(),
        role: role.toApiModel(),
        createdAt: DateTime.now(),
        profilePictureUrl: profilePictureUrl,
      );
}

extension AntApiModelToDomainExtension on api.Ant {
  Ant toDomain() => Ant(
      id: id.toString(),
      name: name,
      description: description,
      type: type.toDomain(),
      role: role.toDomain(),
      // profilePictureUrl: profilePictureUrl,
      // ToDo: don't do this
      // profilePictureUrl:
      //     'http://localhost:8080/serverpod_cloud_storage?method=file&path=$profilePictureUrl');
      profilePictureUrl:
          'http://192.168.20.7:8080/serverpod_cloud_storage?method=file&path=$profilePictureUrl');
}
