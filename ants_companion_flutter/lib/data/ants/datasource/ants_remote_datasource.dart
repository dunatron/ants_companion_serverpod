import 'package:ants_companion_client/ants_companion_client.dart';
import 'package:ants_companion_flutter/core/log/loggers.dart';
import 'package:file_picker/file_picker.dart';

class AntsRemoteDatasource {
  AntsRemoteDatasource(this._client);

  final Client _client;

  final logger = appLogger(AntsRemoteDatasource);

  Future<List<Ant>> getAll() async {
    logger.d('Fetching all ants from remote');
    final ants = await _client.ants.all();
    logger.i('Retrieved ${ants.length} ants from remote');
    return ants;
  }

  Future<Ant> create(final Ant ant) async {
    try {
      final createdAnt = await _client.ants.create(ant);
      logger.i('${ant.name} ant created.');
      return createdAnt;
    } catch (e, s) {
      logger.e('Failed to create ant: ${ant.name}', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<Ant> update(final Ant ant) async {
    try {
      final updatedAnt = await _client.ants.update(
        ant.id!,
        AntUpdateData(name: ant.name, description: ant.description),
      );

      if (updatedAnt == null) {
        throw Exception('updated ant: ${ant.name} was somehow null');
      }
      logger.i('${ant.name} ant updated.');
      return updatedAnt;
    } catch (e, s) {
      logger.e('Failed to update ant: ${ant.name}', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<Ant> delete(final Ant ant) async {
    try {
      final deletedAnt = await _client.ants.delete(ant.id!);

      if (deletedAnt == null) {
        throw Exception('deleted ant: ${ant.name} was somehow null');
      }
      logger.i('${ant.name} was deleted in te remote.');
      return deletedAnt;
    } catch (e, s) {
      logger.e('Failed to delete ant: ${ant.name}', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<String> setProfilePicture(
    int antId,
    String fileName,
    PlatformFile platformFile,
  ) async {
    try {
      String? signedUrl = await _client.ants.getUploadDescription(fileName);

      final stream = platformFile.readStream;

      if (signedUrl == null) {
        logger.d('Signed url is null for the file');
        throw Exception('Unable to get the signed url');
      }

      if (stream == null) {
        logger.d('File stream is null. Unable to upload');
        throw Exception('File stream is null. Unable to upload');
      }

      FileUploader uploader = FileUploader(signedUrl);

      /// seems to work for ios, macos, android, but not web
      bool uploadSuccess = await uploader.upload(stream, platformFile.size);

      if (!uploadSuccess) {
        throw Exception('Upload failed');
      }

      final verified = await _client.ants.verifyUpload(fileName);
      logger.d('Verified file upload: $verified');

      final publicUrl = await _client.ants.getProfileUrl(fileName);
      logger.d('file public url: $publicUrl');

      await _client.ants.setProfilePicture(antId, fileName);

      return publicUrl ?? '';
    } catch (e) {
      logger.e('Error in setProfilePicture: $e');
      rethrow;
    }
  }
}
