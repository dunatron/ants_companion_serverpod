/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

enum ExceptionType implements _i1.SerializableModel {
  InvalidInputException,
  AuthenticationException,
  AuthorizationException,
  ResourceNotFoundException,
  DatabaseException,
  ServiceUnavailableException,
  TimeoutException,
  ConflictException,
  InternalServerException,
  ExternalServiceException;

  static ExceptionType fromJson(int index) {
    switch (index) {
      case 0:
        return InvalidInputException;
      case 1:
        return AuthenticationException;
      case 2:
        return AuthorizationException;
      case 3:
        return ResourceNotFoundException;
      case 4:
        return DatabaseException;
      case 5:
        return ServiceUnavailableException;
      case 6:
        return TimeoutException;
      case 7:
        return ConflictException;
      case 8:
        return InternalServerException;
      case 9:
        return ExternalServiceException;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "ExceptionType"');
    }
  }

  @override
  int toJson() => index;
  @override
  String toString() => name;
}
