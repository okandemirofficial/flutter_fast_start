import 'package:flutter_fast_start/core/cache/abstract/cache_repository.dart';
import 'package:flutter_fast_start/core/cache/isar_cache_repository.dart';
import 'package:flutter_fast_start/core/network/dio_network_service.dart';
import 'package:flutter_fast_start/core/network/abstract/networt_service.dart';
import 'package:flutter_fast_start/core/routing/abstract/router_service.dart';
import 'package:flutter_fast_start/core/routing/auto_route_service.dart';
import 'package:flutter_fast_start/core/utils/snackbar/abstract/snackbar_service.dart';
import 'package:flutter_fast_start/core/utils/snackbar/top_snackbar_service.dart';
import 'package:get_it/get_it.dart';

///A service locator using by get.it package
///All repositories and services which doesn't require WidgetRef or BuildContext
///Could implement to here
///Also useful for dependency injection
final locator = GetIt.instance;

///A Locator class which we inits our repositories and services
class Locator {
  // ignore: unused_element
  Locator._();

  ///await and Init first
  static Future<void> initAsync() async {
    locator
      ..registerSingletonAsync<CacheRepository>(() async {
        return IsarCacheRepository.initAsync();
      })
      ..registerSingleton<RouterService>(AutoRouterService())
      ..registerSingleton<NetworkService>(DioNetworkService())
      ..registerSingleton<SnackbarService>(TopSnackBarService());

    // ..registerLazySingleton<AuthenticationService>(
    //     () => AuthenticationService());

    await Future.wait([locator.allReady()]);
  }
}
