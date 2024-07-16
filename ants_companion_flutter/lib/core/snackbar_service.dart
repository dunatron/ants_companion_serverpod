import 'package:flutter/material.dart';

class SnackbarService {
  static final SnackbarService _instance = SnackbarService._internal();

  factory SnackbarService() {
    return _instance;
  }

  SnackbarService._internal();

  GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void hideCurrent() =>
      scaffoldMessengerKey.currentState?.hideCurrentSnackBar();

  void showSnackbar(
    String message, {
    SnackbarType type = SnackbarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: type.backgroundColor(),
        duration: duration,
      ),
    );
  }
}

enum SnackbarType { info, success, error }

extension on SnackbarType {
  Color backgroundColor() => switch (this) {
        SnackbarType.info => Colors.blue,
        SnackbarType.success => Colors.green,
        SnackbarType.error => Colors.red,
      };
}
