import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_meda/core/helper/get_user_data.dart';
import 'package:social_meda/core/services/get_it_service.dart';
import 'package:social_meda/features/profile/domain/repo/profile_user_repo.dart';
import 'package:social_meda/features/profile/presentation/manger/cubit/profile_cubit.dart';
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
      body: BlocProvider(
        create: (context) =>
            ProfileCubit(profileUserRepo: getIt.get<ProfileUserRepo>()),

        child: ProfilePageBodyBlocBuilder(),
      ),
    );
  }
}
