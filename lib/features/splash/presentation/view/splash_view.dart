import 'package:flutter/material.dart';
import 'package:social_meda/features/splash/presentation/view/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,

        title: Text('Splash'),
      ),
      body: SplashViewBody(),
    );
  }
}
