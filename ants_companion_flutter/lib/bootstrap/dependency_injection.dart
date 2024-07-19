import 'package:ants_companion_client/ants_companion_client.dart';
import 'package:ants_companion_flutter/bootstrap/di/register_client.dart';
import 'package:ants_companion_flutter/bootstrap/di/register_datasources.dart';
import 'package:ants_companion_flutter/data/ants/ants_repository.dart';
import 'package:ants_companion_flutter/data/tier_tags/tier_tags_repository.dart';
import 'package:ants_companion_flutter/domain/ants/ants.dart';
import 'package:ants_companion_flutter/domain/tier_tags/tier_tags.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get_it/get_it.dart';

Future<void> setupDI() async {
  // Sets up a singleton client object that can be used to talk to the server from
  // anywhere in our app. The client is generated from your server code.
  // The client is set up to connect to a Serverpod running on a local server on
  // the default port. You will need to modify this to connect to staging or
  // production servers.
  // var client = Client('http://$localhost:8080/')
  //   ..connectivityMonitor = FlutterConnectivityMonitor();

  final client = registerClient();

  await Hive.initFlutter();

  // Hive.registerAdapter(AntAdapter());

  GetIt.I.registerSingleton<Client>(client);

  await registerDataSources(client);

  GetIt.I.registerLazySingleton(
    () => Ants(AntsRepository(GetIt.I())),
  );

  GetIt.I.registerLazySingleton(
    () => TierTags(
      TierTagsRepository(GetIt.I()),
    ),
  );
}
