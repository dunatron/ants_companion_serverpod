import 'package:ants_companion_client/ants_companion_client.dart';
import 'package:ants_companion_flutter/core/log/loggers.dart';
import 'package:ants_companion_flutter/data/exceptions/local_database_exception.dart';
import 'package:ants_companion_flutter/data/exceptions/mappers/api_exception_mappers.dart';
import 'package:ants_companion_flutter/data/exceptions/mappers/local_database_exception_mappers.dart';
import 'package:ants_companion_flutter/domain/exceptions/exceptions.dart';

extension DataExceptionToDomainExtension on Exception {
  // AppException toDomain() => switch (this) {
  //       AntServerException e => e.toDomain(),
  //       LocalDatabaseException e => e.toDomain(),
  //       _ => const UnknownException('An unknown exception occurred'),
  //     };

  AppException toDomain() {
    final v = switch (this) {
      AntServerException e => e.toDomain(),
      LocalDatabaseException e => e.toDomain(),
      _ => const UnknownException('An unknown exception occurred'),
    };

    // final logger = LoggerSingleton.logger(v.runtimeType.toString());
    // logger.e(v.message);

    return v;
  }
}
