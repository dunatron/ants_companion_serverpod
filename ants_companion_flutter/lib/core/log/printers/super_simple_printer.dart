import 'package:logger/logger.dart';

/// Is super basic and used to get an overview at a debug level
/// i.e for a developer use this printer to see application flow
class SuperSimplePrinter extends LogPrinter {
  SuperSimplePrinter(this.className);
  final String className;

  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.defaultLevelColors[event.level];
    final emoji = PrettyPrinter.defaultLevelEmojis[event.level];

    // final stackTrace = event.stackTrace;
    final message = event.message;

    return [color!('$emoji $className: $message')];
  }
}
