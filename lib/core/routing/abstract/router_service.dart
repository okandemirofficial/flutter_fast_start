// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_fast_start/core/routing/auto_route_service.dart';

///Conscrete implementation is [AutoRouterService]
abstract class RouterService {
  RouterDelegate<Object>? routerDelegate();
  RouteInformationParser<Object>? routeInformationParser();

  //void push(String appRoute);
  void pushNamed(String appRoute);
  void pushNamedRemoveStack(String appRoute);
  void pop();
  void popUntil(String appRoute);
  void popUntilMainPage();
  String currentRouteName();
}
