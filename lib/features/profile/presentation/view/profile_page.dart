import 'package:flutter/material.dart';
import 'package:social_meda/core/helper/get_user_data.dart';
import 'package:social_meda/features/profile/presentation/view/widgets/profile_page_body_bloc_Builder.dart';

class ProfilePage extends StatelessWidget {
  final String uid;
  static const String routeName = '/profile';
  const ProfilePage({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text(
          getUserData().email,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: ProfilePageBodyBlocBuilder(),
    );
  }
}
