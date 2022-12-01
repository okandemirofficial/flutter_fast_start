import 'package:flutter/material.dart';
import 'package:flutter_fast_start/core/routing/abstract/router_service.dart';
import 'package:flutter_fast_start/core/routing/auto_route.dart';

// ignore_for_file: flutter_style_todos

///WARNING
///AutoRouter warns nested navigation should not used
///in global declarations without context
class AutoRouterService extends RouterService {
  // ignore: public_member_api_docs
  AutoRouterService() {
    _appRouter = ProjectAutoRouter();
  }

  late ProjectAutoRouter _appRouter;

  @override
  RouterDelegate<Object>? routerDelegate() {
    return _appRouter.delegate();
  }

  @override
  RouteInformationParser<Object>? routeInformationParser() {
    return _appRouter.defaultRouteParser();
  }

  @override
  void pushNamed(String appRoute) {
    _appRouter.pushNamed(appRoute);
  }

  @override
  void pop() {
    _appRouter.pop();
  }

  @override
  void popUntil(String appRoute) {
    _appRouter.popUntilRouteWithName(appRoute);
  }

  @override
  void popUntilMainPage() {
    _appRouter.popUntilRoot();
  }

  @override
  String currentRouteName() {
    return _appRouter.current.name;
  }

  // @override
  // push(String appRoute) {
  //   _appRouter.pushNamed(appRoute);
  // }

  //TODO: Find a better way to do this
  @override
  void pushNamedRemoveStack(String appRoute) {
    _appRouter
      ..popUntilRoot()
      ..replaceNamed(appRoute);
  }
}
