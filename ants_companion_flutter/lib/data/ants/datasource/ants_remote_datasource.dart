import 'package:ants_companion_client/ants_companion_client.dart';

class AntsRemoteDatasource {
  const AntsRemoteDatasource(this._client);

  final Client _client;

  Future<List<Ant>> getAll() async {
    return await _client.ants.all();
  }

  Future<Ant> create(final Ant ant) async {
    return await _client.ants.create(ant);
  }
}
