import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_meda/core/services/get_it_service.dart';
import 'package:social_meda/features/profile/domain/entities/profile_user_entity.dart';
import 'package:social_meda/features/profile/domain/repo/profile_user_repo.dart';
import 'package:social_meda/features/profile/presentation/manger/cubit/profile_cubit.dart';
import 'package:social_meda/features/profile/presentation/view/widgets/edit_profile_page_body.dart';

class EditProfilePage extends StatelessWidget {
  static const String routeName = '/editProfile';
  final ProfileUserEntity user; // ✅ pass the full user

  const EditProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            ProfileCubit(profileUserRepo: getIt.get<ProfileUserRepo>()),
        child: EditProfilePageBody(user: user), // pass user down
      ),
    );
  }
}
