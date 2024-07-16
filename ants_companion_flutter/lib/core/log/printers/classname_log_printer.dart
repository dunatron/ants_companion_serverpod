import 'package:logger/logger.dart';

/// Prints the className followed by the message
class CustomLogPrinter extends PrettyPrinter {
  CustomLogPrinter({
    required this.className,
    super.methodCount = 5,
    super.errorMethodCount = 5,
    super.printEmojis = true,
    super.printTime = false,
    super.stackTraceBeginIndex = 0,
  });
  final String className;

  @override
  List<String> log(LogEvent event) {
    final customEvent = LogEvent(
      event.level,
      '$className: ${event.message}',
      time: event.time,
      error: event.error,
      stackTrace: _filterStackTrace(event.stackTrace),
    );
    return super.log(customEvent);
  }

  StackTrace? _filterStackTrace(StackTrace? stackTrace) {
    if (stackTrace == null) {
      return null;
    }
    final filtered = stackTrace.toString().split('\n').where((line) {
      return !line.contains('CustomLogPrinter');
    }).join('\n');
    return StackTrace.fromString(filtered);
  }
}
