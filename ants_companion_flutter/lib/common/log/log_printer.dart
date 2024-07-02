import 'package:logger/logger.dart';

class CustomLogPrinter extends PrettyPrinter {
  CustomLogPrinter({
    required this.className,
    super.methodCount = 0,
    super.errorMethodCount = 5,
    super.printEmojis = true,
    super.printTime = false,
  });
  final String className;

  @override
  List<String> log(LogEvent event) {
    final customEvent = LogEvent(
      event.level,
      '$className: ${event.message}',
      time: event.time,
      error: event.error,
      stackTrace: event.stackTrace,
    );
    return super.log(customEvent);
  }
}
