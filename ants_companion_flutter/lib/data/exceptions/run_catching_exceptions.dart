import 'package:ants_companion_flutter/data/exceptions/mappers/exception_mapper.dart';
import 'package:ants_companion_flutter/domain/exceptions/exceptions.dart';
import 'package:logger/logger.dart';

Future<T> runCatchingExceptions<T>(
  Future<T> Function() task,
  Logger logger,
) async {
  try {
    return await task();
  } on Exception catch (e, s) {
    final domainException = e.toDomain();

    logger.e(domainException.message, stackTrace: s);
    throw domainException;
  } catch (e, s) {
    logger.e('Unknown Error: $e', stackTrace: s);
    throw const UnknownException('Generic Exception for domain');
  }
}
