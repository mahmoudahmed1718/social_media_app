import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_meda/features/auth/presentation/views/login_page.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    excuteNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Spash'));
  }

  void excuteNavigation() async {
    Future.delayed(Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      var user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          LoginPage.routeName,
          (route) => false,
        );
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          LoginPage.routeName,
          (route) => false,
        );
      }
    });
  }
}
