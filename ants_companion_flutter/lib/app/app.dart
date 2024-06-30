import 'package:ants_companion_flutter/bootstrap/router.dart';
import 'package:ants_companion_flutter/common/theme/dark_color_scheme.dart';
import 'package:ants_companion_flutter/common/theme/light_color_scheme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // builder: Authenticator.builder(),
      title: 'Ants Companion',
      // scaffoldMessengerKey: snackbarKey,
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        // appBarTheme: AppBarTheme(
        //   backgroundColor: darkColorScheme.background,
        //   surfaceTintColor: darkColorScheme.background,
        // ),
        // outlinedButtonTheme: OutlinedButtonThemeData(
        //   style: OutlinedButton.styleFrom(
        //     side: BorderSide(color: darkColorScheme.primary),
        //   ),
        // ),
      ),
      themeMode: ThemeMode.dark,
      routerConfig: routerConfig(),
    );
  }
}
