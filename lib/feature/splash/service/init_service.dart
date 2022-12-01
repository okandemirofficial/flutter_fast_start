// ignore_for_file: flutter_style_todos

import 'package:flutter_fast_start/core/cache/abstract/cache_repository.dart';
import 'package:flutter_fast_start/core/injection/locator.dart';
import 'package:flutter_fast_start/core/routing/abstract/router_service.dart';
import 'package:flutter_fast_start/core/routing/routes.dart';

///It's a first open service which works async with splash screen
class InitService {
  // ignore: unused_element
  InitService._();

  ///It should init while splash screen visible
  InitService.asyncInit() {
    final appsettings = locator<CacheRepository>().getAppsettings();

    if (appsettings.isFirstLaunch == true) {
      //TODO: Redirect your homepage
    } else {
      locator<RouterService>().pushNamedRemoveStack(Routes.onBoard);
    }
  }
}
