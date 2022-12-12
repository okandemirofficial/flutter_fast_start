import 'package:flutter/material.dart';
import 'package:flutter_fast_start/core/injection/locator.dart' as get_it;
import 'package:flutter_fast_start/core/routing/abstract/router_service.dart';
import 'package:flutter_fast_start/core/theme/project_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // Init's service locator (Get.it)
  await get_it.Locator.initAsync();
  runApp(const ProviderScope(child: MyApp()));
}

///First inits of application
class MyApp extends StatelessWidget {
  ///First inits of application
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routeInformationParser: get_it.locator<RouterService>().routeInformationParser(),
      routerDelegate: get_it.locator<RouterService>().routerDelegate(),
      theme: ProjectTheme.lightColorTheme,
      darkTheme: ProjectTheme.darkColorTheme,
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('tr', ''), // Turkish, no country code
      ],
    );
  }
}
