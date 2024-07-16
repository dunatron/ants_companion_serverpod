/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:ants_companion_client/src/protocol/ant.dart' as _i3;
import 'package:ants_companion_client/src/protocol/ant_update_data.dart' as _i4;
import 'package:ants_companion_client/src/protocol/tier_tag.dart' as _i5;
import 'protocol.dart' as _i6;

/// {@category Endpoint}
class EndpointAnts extends _i1.EndpointRef {
  EndpointAnts(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'ants';

  /// CREATE
  /// Create an ant record
  _i2.Future<_i3.Ant> create(_i3.Ant ant) => caller.callServerEndpoint<_i3.Ant>(
        'ants',
        'create',
        {'ant': ant},
      );

  /// READ
  /// list of all ants in the database
  _i2.Future<List<_i3.Ant>> all() => caller.callServerEndpoint<List<_i3.Ant>>(
        'ants',
        'all',
        {},
      );

  /// list of all ants in the database
  _i2.Future<_i3.Ant?> byId(int id) => caller.callServerEndpoint<_i3.Ant?>(
        'ants',
        'byId',
        {'id': id},
      );

  /// UPDATE
  /// update a an ant record in the database
  _i2.Future<_i3.Ant?> update(
    int antId,
    _i4.AntUpdateData data,
  ) =>
      caller.callServerEndpoint<_i3.Ant?>(
        'ants',
        'update',
        {
          'antId': antId,
          'data': data,
        },
      );

  /// DELETE
  /// delete an ant record in the database
  _i2.Future<_i3.Ant?> delete(int antId) => caller.callServerEndpoint<_i3.Ant?>(
        'ants',
        'delete',
        {'antId': antId},
      );

  _i2.Future<String?> getUploadDescription(String path) =>
      caller.callServerEndpoint<String?>(
        'ants',
        'getUploadDescription',
        {'path': path},
      );

  _i2.Future<bool> verifyUpload(String path) => caller.callServerEndpoint<bool>(
        'ants',
        'verifyUpload',
        {'path': path},
      );

  _i2.Future<void> setProfilePicture(
    int antId,
    String fileName,
  ) =>
      caller.callServerEndpoint<void>(
        'ants',
        'setProfilePicture',
        {
          'antId': antId,
          'fileName': fileName,
        },
      );

  _i2.Future<String?> getProfileUrl(String path) =>
      caller.callServerEndpoint<String?>(
        'ants',
        'getProfileUrl',
        {'path': path},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointTheme extends _i1.EndpointRef {
  EndpointTheme(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'theme';

  _i2.Future<void> changeTheme() => caller.callServerEndpoint<void>(
        'theme',
        'changeTheme',
        {},
      );
}

/// {@category Endpoint}
class EndpointTierTags extends _i1.EndpointRef {
  EndpointTierTags(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'tierTags';

  /// CREATE
  /// create a new tier tag
  _i2.Future<_i5.TierTag> create(_i5.TierTag tag) =>
      caller.callServerEndpoint<_i5.TierTag>(
        'tierTags',
        'create',
        {'tag': tag},
      );

  /// READ
  /// get a list of all tier tags in the database
  _i2.Future<List<_i5.TierTag>> all() =>
      caller.callServerEndpoint<List<_i5.TierTag>>(
        'tierTags',
        'all',
        {},
      );

  /// get all the tier tags for an ant by the id
  _i2.Future<List<_i5.TierTag>> tierTagsByAntId(int antId) =>
      caller.callServerEndpoint<List<_i5.TierTag>>(
        'tierTags',
        'tierTagsByAntId',
        {'antId': antId},
      );

  /// UPDATE
  /// update a tier tag
  _i2.Future<_i5.TierTag?> update(int tierTagId) =>
      caller.callServerEndpoint<_i5.TierTag?>(
        'tierTags',
        'update',
        {'tierTagId': tierTagId},
      );

  /// DELETE
  /// delete a tier tag
  _i2.Future<_i5.TierTag?> delete(int tierTagId) =>
      caller.callServerEndpoint<_i5.TierTag?>(
        'tierTags',
        'delete',
        {'tierTagId': tierTagId},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    ants = EndpointAnts(this);
    example = EndpointExample(this);
    theme = EndpointTheme(this);
    tierTags = EndpointTierTags(this);
  }

  late final EndpointAnts ants;

  late final EndpointExample example;

  late final EndpointTheme theme;

  late final EndpointTierTags tierTags;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'ants': ants,
        'example': example,
        'theme': theme,
        'tierTags': tierTags,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
