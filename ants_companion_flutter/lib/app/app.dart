import 'package:ants_companion_flutter/bootstrap/router.dart';
import 'package:ants_companion_flutter/common/theme/dark_color_scheme.dart';
import 'package:ants_companion_flutter/common/theme/light_color_scheme.dart';
import 'package:ants_companion_flutter/core/snackbar_service.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ants Companion',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: SnackbarService().scaffoldMessengerKey,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      // themeMode: ThemeMode.dark,
      routerConfig: routerConfig(),
    );
  }
}
