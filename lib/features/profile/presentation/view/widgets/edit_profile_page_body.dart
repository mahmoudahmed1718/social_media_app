import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_meda/features/profile/domain/entities/profile_user_entity.dart';
import 'package:social_meda/features/profile/presentation/manger/cubit/profile_cubit.dart';

class EditProfilePageBody extends StatefulWidget {
  final ProfileUserEntity user;

  const EditProfilePageBody({super.key, required this.user});

  @override
  State<EditProfilePageBody> createState() => _EditProfilePageBodyState();
}

class _EditProfilePageBodyState extends State<EditProfilePageBody> {
  late final TextEditingController nameController;
  late final TextEditingController bioController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    bioController = TextEditingController(text: widget.user.bio);
  }

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    super.dispose();
  }

  void _updateProfile() {
    final updatedUser = ProfileUserEntity(
      uId: widget.user.uId, // keep old uid
      email: widget.user.email, // keep old email
      username: widget.user.username, // keep old username
      profileImageUrl: widget.user.profileImageUrl, // keep old image
      name: nameController.text, // updated name
      bio: bioController.text, // updated bio
    );

    context.read<ProfileCubit>().updateProfileUser(profileUser: updatedUser);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile updated successfully ✅')),
          );
          Navigator.pop(context);
        } else if (state is ProfileError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: bioController,
              decoration: const InputDecoration(labelText: 'Bio'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _updateProfile,
              child: const Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
