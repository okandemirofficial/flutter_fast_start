import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // Init's service locator (Get.it)
  //await injection.Locator.initAsync();
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
      routeInformationParser: locator<RouterService>().routeInformationParser(),
      routerDelegate: locator<RouterService>().routerDelegate(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('tr', ''), // Turkish, no country code
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
