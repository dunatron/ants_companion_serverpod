import 'package:ants_companion_client/ants_companion_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

Client registerClient() {
  var client = Client('http://$localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();
  return client;
}
