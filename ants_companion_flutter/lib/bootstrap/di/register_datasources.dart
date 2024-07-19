import 'package:ants_companion_client/ants_companion_client.dart' as client;
import 'package:ants_companion_flutter/bootstrap/di/register_local_datasources.dart';
import 'package:ants_companion_flutter/bootstrap/di/register_remote_datasources.dart';
import 'package:ants_companion_flutter/data/ants/datasource/ants_datasource.dart';
import 'package:ants_companion_flutter/data/tier_tags/datasource/tier_tags_datasource.dart';
import 'package:get_it/get_it.dart';

Future<void> registerDataSources(client.Client client) async {
  await Future.wait([
    registerRemoteDataSources(client),
    registerLocalDataSources(),
  ]);

  GetIt.I.registerLazySingleton(
    () => AntsDatasource(GetIt.I(), GetIt.I()),
  );

  GetIt.I.registerLazySingleton(
    () => TierTagsDatasource(GetIt.I(), GetIt.I()),
  );
}
