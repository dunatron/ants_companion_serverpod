import 'package:ants_companion_client/ants_companion_client.dart' as client;
import 'package:ants_companion_flutter/data/ants/datasource/ants_remote_datasource.dart';
import 'package:ants_companion_flutter/data/tier_tags/datasource/tier_tags_remote_datasource.dart';
import 'package:get_it/get_it.dart';

Future<void> registerRemoteDataSources(client.Client client) async {
  GetIt.I.registerLazySingleton(() => AntsRemoteDatasource(client));
  GetIt.I.registerLazySingleton(() => TierTagsRemoteDatasource(client));
}
