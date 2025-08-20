import 'package:flutter/material.dart';
import 'package:social_meda/features/auth/presentation/views/login_page.dart';
import 'package:social_meda/features/auth/presentation/views/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // intial login page
  bool showLoginPage = true;

  // toggle between pages
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(togglePage: togglePages);
    } else {
      return RegisterPage(togglePage: togglePages);
    }
  }
}
