import 'package:ants_companion_flutter/data/exceptions/local_database_exception.dart';
import 'package:ants_companion_flutter/domain/exceptions/exceptions.dart' as d;

extension LocalDatabaseExceptionToDomainExtension on LocalDatabaseException {
  d.AppException toDomain() => switch (this) {
        LocalDatabaseException exception =>
          d.DataFetchException(exception.message),
      };
}
