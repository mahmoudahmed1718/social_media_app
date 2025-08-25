import 'package:flutter/material.dart';
import 'package:social_meda/features/profile/domain/entities/profile_user_entity.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key, required this.profileUser});
  final ProfileUserEntity profileUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(profileUser.profileImageUrl),
        ),
        const SizedBox(height: 12),
        Text(
          profileUser.username,
          style: Theme.of(context).textTheme.titleLarge,
        ),

        Text(profileUser.bio, style: Theme.of(context).textTheme.bodyMedium),
        Text(profileUser.email, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
