import 'package:ants_companion_client/ants_companion_client.dart' as api;

import 'package:ants_companion_flutter/domain/ants/models/ant_type.dart';

extension ApiAntTypeFromDomainExtension on AntType {
  /// converts a domain AntType model to the api version
  api.AntType toApiModel() => switch (this) {
        AntType.guardian => api.AntType.guardian,
        AntType.shooter => api.AntType.shooter,
        AntType.carrier => api.AntType.carrier,
        AntType.universal => api.AntType.universal,
      };
}

extension ApiAntTypeToDomainExtension on api.AntType {
  /// converts an api AntType model to the domain version
  AntType toDomain() => switch (this) {
        api.AntType.guardian => AntType.guardian,
        api.AntType.shooter => AntType.shooter,
        api.AntType.carrier => AntType.carrier,
        api.AntType.universal => AntType.universal,
      };
}
