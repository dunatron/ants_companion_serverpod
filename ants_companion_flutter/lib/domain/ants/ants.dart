import 'dart:typed_data';

import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:file_picker/file_picker.dart';

class Ants {
  const Ants(this._provider);
  final AntsProvider _provider;

  Stream<List<Ant>> antsList() => _provider.antsList().map(
        (it) => it.alphabeticallySorted(),
      );

  Future<Ant?> antById(String id) => _provider.antById(id);

  Future<Ant> createAnt(Ant ant) => _provider.createAnt(ant);

  Future<Ant> updateAnt(Ant ant) => _provider.updateAnt(ant);

  // Future<String> setAntProfilePicture(
  //   final String antId,
  //   String fileName,
  //   ByteData byteData,
  // ) =>
  //     _provider.setAntProfilePicture(antId, fileName, byteData);

  Future<String> setAntProfilePicture(
    final String antId,
    String fileName,
    PlatformFile byteData,
  ) =>
      _provider.setAntProfilePicture(antId, fileName, byteData);

  Future<Ant> deleteAnt(String antId) => _provider.deleteAnt(antId);

  Future<void> refresh() => _provider.refresh();
}

abstract class AntsProvider {
  Stream<List<Ant>> antsList();

  Future<Ant?> antById(String id);

  Future<Ant> createAnt(Ant ant);

  Future<Ant> updateAnt(Ant ant);

  Future<Ant> deleteAnt(String antId);

  // Future<String> setAntProfilePicture(
  //   final String antId,
  //   String fileName,
  //   ByteData byteData,
  // );

  Future<String> setAntProfilePicture(
    final String antId,
    String fileName,
    PlatformFile byteData,
  );

  Future<void> refresh();
}

extension on List<Ant> {
  List<Ant> alphabeticallySorted() {
    final sortedList = [...this];
    sortedList.sort((a, b) => a.name.compareTo(b.name));
    return sortedList;
  }
}
