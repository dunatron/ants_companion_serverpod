import 'package:ants_companion_client/ants_companion_client.dart';
import 'package:ants_companion_flutter/domain/exceptions/exceptions.dart';

extension ApiServerExceptionToDomainExtension on AntServerException {
  AppException toDomain() => switch (errorType) {
        ExceptionType.InvalidInputException => ConflictException(message),
        ExceptionType.ConflictException => ConflictException(message),
        _ => DataFetchException(message),
      };
}
