import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_start/const/globals.dart';
import 'package:flutter_fast_start/core/injection/locator.dart' as get_it;
import 'package:flutter_fast_start/core/injection/locator.dart';
import 'package:flutter_fast_start/core/routing/abstract/router_service.dart';
import 'package:flutter_fast_start/core/theme/project_theme.dart';
import 'package:flutter_fast_start/core/utils/snackbar/abstract/snackbar_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // Init's service locator (Get.it)
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await get_it.Locator.initAsync();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    locator<SnackbarService>().showSnackbar(
      type: SnackBarType.error,
      title: 'ERROR',
      message: error.toString(),
    );
    return false;
  };
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
      //Provides show snackbar without BuildContext
      //locator<SnackbarService>().showSnackbar()
      scaffoldMessengerKey: scaffoldMessengerKey,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationParser:
          get_it.locator<RouterService>().routeInformationParser(),
      routerDelegate: get_it.locator<RouterService>().routerDelegate(),
      theme: ProjectTheme.lightColorTheme,
    );
  }
}
