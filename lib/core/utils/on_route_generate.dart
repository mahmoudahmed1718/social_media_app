import 'package:flutter/material.dart';
import 'package:social_meda/features/auth/presentation/views/login_page.dart';
import 'package:social_meda/features/auth/presentation/views/register_page.dart';
import 'package:social_meda/features/home/presentation/view/home_page.dart';
import 'package:social_meda/features/profile/presentation/view/profile_page.dart';
import 'package:social_meda/features/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case LoginPage.routeName:
      return MaterialPageRoute(builder: (context) => const LoginPage());

    case RegisterPage.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterPage());
    case HomePage.routeName:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case ProfilePage.routeName:
      return MaterialPageRoute(builder: (context) => const ProfilePage());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
