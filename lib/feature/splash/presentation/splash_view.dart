import 'package:flutter/material.dart';
import 'package:flutter_fast_start/feature/splash/service/init_service.dart';

///Splash screen for the app
class SplashView extends StatelessWidget {
  ///Splash screen for the app
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    InitService.asyncInit();
    return Container();
  }
}
