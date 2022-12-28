import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_start/core/routing/model/routes.dart';
import 'package:flutter_fast_start/feature/onboard/presentation/onboard_view.dart';
import 'package:flutter_fast_start/feature/splash/presentation/splash_view.dart';

part 'auto_route.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    //AutoRoute(page: HomeView, name: Routes.home, path: Routes.home),
    AutoRoute(
      page: SplashView,
      initial: true,
      name: Routes.splash,
      path: Routes.splash,
    ),
    AutoRoute(
      page: OnBoardView,
      name: Routes.onBoard,
      path: Routes.onBoard,
    ),
  ],
)
// extend the generated private router
//class B extends _$AppRouter {}

// ignore: public_member_api_docs
class ProjectAutoRouter extends _$ProjectAutoRouter {}
