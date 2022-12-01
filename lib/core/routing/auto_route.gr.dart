// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'auto_route.dart';

class _$ProjectAutoRouter extends RootStackRouter {
  _$ProjectAutoRouter([GlobalKey<NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    Splash.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    OnBoard.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OnBoardView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splash',
          fullMatch: true,
        ),
        RouteConfig(
          Splash.name,
          path: 'splash',
        ),
        RouteConfig(
          OnBoard.name,
          path: 'onBoard',
        ),
      ];
}

/// generated route for
/// [SplashView]
class Splash extends PageRouteInfo<void> {
  const Splash()
      : super(
          Splash.name,
          path: 'splash',
        );

  static const String name = 'Splash';
}

/// generated route for
/// [OnBoardView]
class OnBoard extends PageRouteInfo<void> {
  const OnBoard()
      : super(
          OnBoard.name,
          path: 'onBoard',
        );

  static const String name = 'OnBoard';
}
