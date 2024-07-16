import 'package:ants_companion_client/ants_companion_client.dart' as api;

import 'package:ants_companion_flutter/domain/ants/models/ant_role.dart';

extension AntRoleFromDomainExtension on AntRole {
  api.AntRole toApiModel() => switch (this) {
        AntRole.melee => api.AntRole.melee,
        AntRole.support => api.AntRole.support,
        AntRole.ranged => api.AntRole.ranged,
      };
}

extension AntRoleApiModelToDomainExtension on api.AntRole {
  AntRole toDomain() => switch (this) {
        api.AntRole.melee => AntRole.melee,
        api.AntRole.support => AntRole.support,
        api.AntRole.ranged => AntRole.ranged,
      };
}
