import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_meda/core/services/get_it_service.dart';
import 'package:social_meda/features/profile/domain/repo/profile_user_repo.dart';
import 'package:social_meda/features/profile/presentation/manger/cubit/profile_cubit.dart';
import 'package:social_meda/features/profile/presentation/view/edit_profile_page.dart';
import 'package:social_meda/features/profile/presentation/view/widgets/profile_page_body_bloc_Builder.dart';

class ProfilePage extends StatelessWidget {
  final String uid;
  static const String routeName = '/profile';
  const ProfilePage({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = ProfileCubit(
          profileUserRepo: getIt.get<ProfileUserRepo>(),
        );
        cubit.fetchProfileUser(uid: uid); // trigger fetch once here
        return cubit;
      },
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(''),
              foregroundColor: Theme.of(context).colorScheme.primary,
              actions: [
                if (state is ProfileLoaded)
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        EditProfilePage.routeName,
                        arguments: state.profileUser,
                      );
                    },
                  ),
              ],
            ),
            body: const ProfilePageBodyBlocBuilder(),
          );
        },
      ),
    );
  }
}
