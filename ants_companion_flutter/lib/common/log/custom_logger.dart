import 'package:ants_companion_flutter/common/log/function_name_printer.dart';
import 'package:ants_companion_flutter/common/log/log_printer.dart';
import 'package:logger/logger.dart';

// Debug (d): Used for general debugging information.
// Info (i): Used for informational messages that highlight the progress of the application.
// Warning (w): Used for potentially harmful situations.
// Error (e): Used for error events that might still allow the application to continue running.
// Fatal (f): Used for very severe error events that will presumably lead the application to abort.

Logger getLogger(String className) {
  /// default Pretty printer
  return Logger(printer: PrettyPrinter(methodCount: 1));

  /// class pretty, very lightweight
  // return Logger(printer: CustomLogPrinter(className: className));

  /// a bit heavier
  // return Logger(printer: FunctionNamePrinter());
}
