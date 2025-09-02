import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_meda/features/profile/domain/entities/profile_user_entity.dart';
import 'package:social_meda/features/profile/presentation/manger/cubit/profile_cubit.dart';
import 'package:social_meda/features/profile/presentation/view/profile_page.dart';

class EditProfilePageBody extends StatefulWidget {
  final ProfileUserEntity user;

  const EditProfilePageBody({super.key, required this.user});

  @override
  State<EditProfilePageBody> createState() => _EditProfilePageBodyState();
}

class _EditProfilePageBodyState extends State<EditProfilePageBody> {
  late final TextEditingController nameController;
  late final TextEditingController bioController;
  late final TextEditingController userNameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    bioController = TextEditingController(text: widget.user.bio);
    userNameController = TextEditingController(text: widget.user.username);
  }

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  void _updateProfile() {
    final updatedUser = ProfileUserEntity(
      imageFile: widget.user.imageFile,
      uId: widget.user.uId, // keep old uid
      email: widget.user.email, // keep old email
      username: userNameController.text, // updated username
      profileImageUrl: widget.user.profileImageUrl, // keep old image
      name: nameController.text, // updated name
      bio: bioController.text,
      // updated bio
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

          () async {
            final updatedUser = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(uid: state.profileUser.uId),
              ),
            );

            // 🔑 If user was updated, re-fetch profile
            if (updatedUser != null) {
              // ignore: use_build_context_synchronously
              context.read<ProfileCubit>().fetchProfileUser(
                uid: updatedUser.uId,
              );
            }
          }();
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
              controller: userNameController,
              decoration: const InputDecoration(labelText: 'Username'),
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
