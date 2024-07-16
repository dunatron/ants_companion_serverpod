sealed class AppException implements Exception {
  const AppException(this.message);
  final String message;
}

class ValidationException extends AppException {
  const ValidationException(super.message);

  @override
  String toString() => 'ValidationException: $message';
}

class DataFetchException extends AppException {
  const DataFetchException(super.message);

  @override
  String toString() => 'DataFetchException: $message';
}

/// Exception for when conflicts occur such as creating a duplicate
class ConflictException extends AppException {
  const ConflictException(super.message);

  @override
  String toString() => 'ConflictException: $message';
}

class UnknownException extends AppException {
  const UnknownException(super.message);

  @override
  String toString() => 'UnknownException: $message';
}
