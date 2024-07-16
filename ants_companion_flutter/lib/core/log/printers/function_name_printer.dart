import 'package:logger/logger.dart';

/// Prints the className and method followed by the message
class FunctionNamePrinter extends PrettyPrinter {
  FunctionNamePrinter({
    super.methodCount = 0,
    super.errorMethodCount = 5,
    super.printEmojis = true,
    super.printTime = false,
  });

  @override
  List<String> log(LogEvent event) {
    var message = event.message;
    if (event.level.index >= Level.debug.index) {
      final frame = StackTrace.current.toString().split("\n")[3];
      final match = RegExp(r'#[0-9]+\s+([^\s]+)\s').firstMatch(frame);
      if (match != null) {
        final functionName = match.group(1);
        message = '[$functionName]\n$message';
      }
    }

    final customEvent = LogEvent(
      event.level,
      message,
      time: event.time,
      error: event.error,
      stackTrace: event.stackTrace,
    );
    return super.log(customEvent);
  }
}
