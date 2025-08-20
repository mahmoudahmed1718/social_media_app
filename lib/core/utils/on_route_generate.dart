import 'package:flutter/material.dart';
import 'package:social_meda/features/auth/presentation/views/login_page.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
