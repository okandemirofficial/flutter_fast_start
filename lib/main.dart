import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_start/core/injection/locator.dart' as get_it;
import 'package:flutter_fast_start/core/routing/abstract/router_service.dart';
import 'package:flutter_fast_start/core/theme/project_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // Init's service locator (Get.it)
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await get_it.Locator.initAsync();
  runApp(
    ProviderScope(
      child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [Locale('en', 'US'), Locale('tr', 'TR')],
        child: const MyApp(),
      ),
    ),
  );
}

///First inits of application
class MyApp extends StatelessWidget {
  ///First inits of application
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Fast Start',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationParser:
          get_it.locator<RouterService>().routeInformationParser(),
      routerDelegate: get_it.locator<RouterService>().routerDelegate(),
      theme: ProjectTheme.lightColorTheme,
    );
  }
}
