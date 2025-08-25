import 'package:flutter/material.dart';
import 'package:social_meda/features/profile/domain/entities/profile_user_entity.dart';
import 'package:social_meda/features/profile/presentation/view/widgets/bio_box.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key, required this.profileUser});
  final ProfileUserEntity profileUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          profileUser.email,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(height: 25),
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Center(
            child: Icon(
              Icons.person,
              size: 70,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(height: 25),
        // bio box
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Row(
            children: [
              Text(
                'Bio',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        BioBox(text: profileUser.bio),
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 25),
          child: Row(
            children: [
              Text(
                'Posts',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
