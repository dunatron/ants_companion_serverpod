/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../protocol.dart' as _i2;

abstract class AntServerException
    implements
        _i1.SerializableException,
        _i1.SerializableModel,
        _i1.ProtocolSerialization {
  AntServerException._({
    required this.message,
    required this.errorType,
  });

  factory AntServerException({
    required String message,
    required _i2.ExceptionType errorType,
  }) = _AntServerExceptionImpl;

  factory AntServerException.fromJson(Map<String, dynamic> jsonSerialization) {
    return AntServerException(
      message: jsonSerialization['message'] as String,
      errorType:
          _i2.ExceptionType.fromJson((jsonSerialization['errorType'] as int)),
    );
  }

  String message;

  _i2.ExceptionType errorType;

  AntServerException copyWith({
    String? message,
    _i2.ExceptionType? errorType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'errorType': errorType.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'message': message,
      'errorType': errorType.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AntServerExceptionImpl extends AntServerException {
  _AntServerExceptionImpl({
    required String message,
    required _i2.ExceptionType errorType,
  }) : super._(
          message: message,
          errorType: errorType,
        );

  @override
  AntServerException copyWith({
    String? message,
    _i2.ExceptionType? errorType,
  }) {
    return AntServerException(
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
    );
  }
}
