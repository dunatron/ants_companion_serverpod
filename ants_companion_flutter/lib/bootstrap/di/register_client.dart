import 'package:ants_companion_client/ants_companion_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

Client registerClient() {
  // var client = Client('http://192.168.20.7:8080/');
  // var client = Client('http://$localhost:8080/')
  //   ..connectivityMonitor = FlutterConnectivityMonitor();
  var client = Client('http://192.168.20.7:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();
  // var client = Client('http://10.0.2.2:8080/')
  //   ..connectivityMonitor = FlutterConnectivityMonitor();
  return client;
}
