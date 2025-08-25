import 'package:flutter/material.dart';
import 'package:social_meda/core/helper/get_user_data.dart';
import 'package:social_meda/features/auth/presentation/views/login_page.dart';
import 'package:social_meda/features/auth/presentation/views/register_page.dart';
import 'package:social_meda/features/home/presentation/view/home_page.dart';
import 'package:social_meda/features/profile/domain/entities/profile_user_entity.dart';
import 'package:social_meda/features/profile/presentation/view/edit_profile_page.dart';
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
      final uid = settings.arguments as String? ?? getUserData().uId;
      return MaterialPageRoute(builder: (context) => ProfilePage(uid: uid));

    case EditProfilePage.routeName:
      final user = settings.arguments as ProfileUserEntity;
      return MaterialPageRoute(
        builder: (context) => EditProfilePage(user: user),
      );

    default:
      return MaterialPageRoute(
        builder: (context) =>
            const Scaffold(body: Center(child: Text("Route not found"))),
      );
  }
}
