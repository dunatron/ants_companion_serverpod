/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/ants_endpoint.dart' as _i2;
import '../endpoints/example_endpoint.dart' as _i3;
import '../endpoints/theme_endpoint.dart' as _i4;
import '../endpoints/tier_tags_endpoint.dart' as _i5;
import 'package:ants_companion_server/src/generated/ant.dart' as _i6;
import 'package:ants_companion_server/src/generated/tier_tag.dart' as _i7;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'ants': _i2.AntsEndpoint()
        ..initialize(
          server,
          'ants',
          null,
        ),
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'theme': _i4.ThemeEndpoint()
        ..initialize(
          server,
          'theme',
          null,
        ),
      'tierTags': _i5.TierTagsEndpoint()
        ..initialize(
          server,
          'tierTags',
          null,
        ),
    };
    connectors['ants'] = _i1.EndpointConnector(
      name: 'ants',
      endpoint: endpoints['ants']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'ant': _i1.ParameterDescription(
              name: 'ant',
              type: _i1.getType<_i6.Ant>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ants'] as _i2.AntsEndpoint).create(
            session,
            params['ant'],
          ),
        ),
        'all': _i1.MethodConnector(
          name: 'all',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ants'] as _i2.AntsEndpoint).all(session),
        ),
        'byId': _i1.MethodConnector(
          name: 'byId',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ants'] as _i2.AntsEndpoint).byId(
            session,
            params['id'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'antId': _i1.ParameterDescription(
              name: 'antId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ants'] as _i2.AntsEndpoint).update(
            session,
            params['antId'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'antId': _i1.ParameterDescription(
              name: 'antId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ants'] as _i2.AntsEndpoint).delete(
            session,
            params['antId'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['theme'] = _i1.EndpointConnector(
      name: 'theme',
      endpoint: endpoints['theme']!,
      methodConnectors: {
        'changeTheme': _i1.MethodConnector(
          name: 'changeTheme',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['theme'] as _i4.ThemeEndpoint).changeTheme(session),
        )
      },
    );
    connectors['tierTags'] = _i1.EndpointConnector(
      name: 'tierTags',
      endpoint: endpoints['tierTags']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'tag': _i1.ParameterDescription(
              name: 'tag',
              type: _i1.getType<_i7.TierTag>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tierTags'] as _i5.TierTagsEndpoint).create(
            session,
            params['tag'],
          ),
        ),
        'all': _i1.MethodConnector(
          name: 'all',
          params: {
            'antId': _i1.ParameterDescription(
              name: 'antId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tierTags'] as _i5.TierTagsEndpoint).all(
            session,
            params['antId'],
          ),
        ),
        'tierTagsByAntId': _i1.MethodConnector(
          name: 'tierTagsByAntId',
          params: {
            'antId': _i1.ParameterDescription(
              name: 'antId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tierTags'] as _i5.TierTagsEndpoint).tierTagsByAntId(
            session,
            params['antId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'tierTagId': _i1.ParameterDescription(
              name: 'tierTagId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tierTags'] as _i5.TierTagsEndpoint).update(
            session,
            params['tierTagId'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'tierTagId': _i1.ParameterDescription(
              name: 'tierTagId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tierTags'] as _i5.TierTagsEndpoint).delete(
            session,
            params['tierTagId'],
          ),
        ),
      },
    );
  }
}
