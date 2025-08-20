import 'package:flutter/material.dart';
import 'package:social_meda/features/auth/presentation/views/widgets/login_page_body.dart';

class LoginPage extends StatelessWidget {
  static const routeName = 'login_page';
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginPageBody());
  }
}
