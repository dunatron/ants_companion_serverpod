// import 'package:ants_companion_flutter/core/log/printers/classname_log_printer.dart';
// import 'package:ants_companion_flutter/core/log/printers/function_name_printer.dart';
import 'package:ants_companion_flutter/core/log/printers/super_simple_printer.dart';
import 'package:logger/logger.dart';

// Debug (d): Used for general debugging information.
// Info (i): Used for informational messages that highlight the progress of the application.
// Warning (w): Used for potentially harmful situations.
// Error (e): Used for error events that might still allow the application to continue running.
// Fatal (f): Used for very severe error events that will presumably lead the application to abort.
// final logger = (Type type) => Logger(
//   printer: CustomLogPrinter(className: type.toString());
// );
Logger appLogger(Type type) => Logger(
      // printer: CustomLogPrinter(className: type.toString()),
      // printer: FunctionNamePrinter(),
      printer: PrettyPrinter(),
      // printer: SimplePrinter(),
      // printer: SuperSimplePrinter(type.toString()),
    );
