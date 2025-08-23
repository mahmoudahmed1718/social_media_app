import 'package:flutter/material.dart';
import 'package:social_meda/features/profile/presentation/view/widgets/profile_page_body.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = '/profile';
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const ProfilePageBody(),
    );
  }
}
