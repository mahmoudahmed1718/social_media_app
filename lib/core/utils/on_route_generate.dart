import 'package:flutter/material.dart';
import 'package:social_meda/features/auth/presentation/views/login_page.dart';
import 'package:social_meda/features/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case LoginPage.routeName:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
