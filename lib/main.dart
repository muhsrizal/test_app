import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:witt/witt.dart';

import 'route_path.dart';
import 'services/local_storage.dart';
import 'theme/theme_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WService.enableLog = true;
  HttpOverrides.global = MyHttpOverrides();
  await LocalStorage.userStorage.initStorage;

  runApp(
    MaterialApp(
      navigatorKey: WRouter.navigatorKey,
      title: "Sambat",
      theme: ThemeGenerator.generate(),
      darkTheme: ThemeGenerator.generate(darkMode: true),
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        minWidth: 320,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(320, name: MOBILE),
          ResponsiveBreakpoint.resize(480, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
        ],
      ),
      onGenerateRoute: (settings) => WRouter.onGenerateMaterialRoute(
        settings: settings,
        pages: RoutePath.listPage,
      ),
      initialRoute: RoutePath.splashPath,
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
